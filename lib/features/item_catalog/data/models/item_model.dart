import '../../domain/entities/item_entity.dart';

class ItemModel {
  final int id;
  final String title;
  final String description;
  final String category;

  ItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
    );
  }

  ItemEntity toEntity() {
    return ItemEntity(
      id: id,
      title: title,
      description: description,
      category: category,
    );
  }
}