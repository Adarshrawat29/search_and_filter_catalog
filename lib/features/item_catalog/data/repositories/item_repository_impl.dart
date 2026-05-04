import '../../domain/entities/item_entity.dart';
import '../../domain/repositories/item_repository.dart';
import '../datasources/item_local_data_source.dart';
import '../models/item_model.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemLocalDataSource dataSource;

  ItemRepositoryImpl(this.dataSource);

  @override
  Future<List<ItemEntity>> getItems() async {
    try {
      final data = await dataSource.getItems();

      return data
          .map((json) => ItemModel.fromJson(json))
          .map((model) => model.toEntity())
          .toList();
    } catch (e) {
      throw Exception('Data fetch failed');
    }
  }
}