import '../../domain/entities/post_entity.dart';

/// AC 11.2: States for UI

abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<PostEntity> posts;

  PostLoaded(this.posts);
}

class PostError extends PostState {
  final String message;

  PostError(this.message);
}