import '../../domain/entities/post_entity.dart';

/// DTO (Data Transfer Object)
/// AC 11.1: Responsible for JSON parsing

class PostModel extends PostEntity {
  PostModel({
    required int id,
    required String title,
    required String body,
  }) : super(id: id, title: title, body: body);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}