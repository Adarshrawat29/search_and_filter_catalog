import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/item_entity.dart';
import '../../domain/usecases/get_items_usecase.dart';
import 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  final GetItemsUseCase useCase;

  ItemCubit(this.useCase) : super(Initial());

  List<ItemEntity> _allItems = [];
  String _query = '';
  String _category = '';

  Future<void> loadItems() async {
    emit(Loading());

    try {
      _allItems = await useCase();
      emit(Loaded(_allItems));
    } catch (_) {
      emit(Error());
    }
  }

  void search(String query) {
    _query = query.trim().toLowerCase();
    _applyFilters();
  }

  void filter(String category) {
    _category = category;
    _applyFilters();
  }

  void _applyFilters() {
    final results = _allItems.where((item) {
      final matchesSearch =
          item.title.toLowerCase().contains(_query) ||
          item.description.toLowerCase().contains(_query);

      final matchesFilter =
          _category.isEmpty || item.category == _category;

      return matchesSearch && matchesFilter;
    }).toList();

    if (results.isEmpty) {
      emit(Empty());
    } else {
      emit(Loaded(results));
    }
  }
}
