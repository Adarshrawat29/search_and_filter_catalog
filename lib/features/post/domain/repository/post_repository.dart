import 'package:dartz/dartz.dart';
import 'package:userstory_remote_data_fetching/core/error/failure.dart';
import 'package:userstory_remote_data_fetching/features/post/domain/entities/post_entity.dart';


abstract class PostRepository {
  Future<Either<Failure, List<PostEntity>>> getPosts();
}