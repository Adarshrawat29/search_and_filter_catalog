/// Pure Dart Entity (NO JSON here)
/// AC 11.4: Domain must be framework-independent

class PostEntity {
  final int id;
  final String title;
  final String body;

  PostEntity({
    required this.id,
    required this.title,
    required this.body,
  });
}