import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/post_entity.dart';

import 'package:userstory_remote_data_fetching/features/post/domain/repository/post_repository.dart';

import '../datasources/post_remote_data_source.dart';


// - Catches exceptions
// - Returns Either<Failure, Success>

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<PostEntity>>> getPosts() async {
    try {
      final result = await remoteDataSource.getPosts();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    }
  }
}