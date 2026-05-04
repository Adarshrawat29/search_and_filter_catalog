import '../../domain/entities/item_entity.dart';

abstract class ItemState {}

class Initial extends ItemState {}

class Loading extends ItemState {}

class Loaded extends ItemState {
  final List<ItemEntity> items;
  Loaded(this.items);
}

class Empty extends ItemState {}

class Error extends ItemState {}
