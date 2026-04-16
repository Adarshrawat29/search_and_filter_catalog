import 'package:userstory_remote_data_fetching/features/post/data/models/post_model.dart';

/// Abstract data source
abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPosts();
}