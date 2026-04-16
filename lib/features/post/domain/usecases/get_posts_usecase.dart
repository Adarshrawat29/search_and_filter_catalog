import 'package:dartz/dartz.dart';
import 'package:userstory_remote_data_fetching/core/error/failure.dart';
import 'package:userstory_remote_data_fetching/features/post/domain/entities/post_entity.dart';
import 'package:userstory_remote_data_fetching/features/post/domain/repository/post_repository.dart';

// Cubit depends ONLY on UseCase

class GetPostsUseCase {
  final PostRepository repository;

  GetPostsUseCase(this.repository);

  Future<Either<Failure, List<PostEntity>>> call() {
    return repository.getPosts();
  }
}