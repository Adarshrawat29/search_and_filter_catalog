import 'package:userstory_remote_data_fetching/core/network/http_response_handler.dart';
import 'package:userstory_remote_data_fetching/core/network/network_client.dart';
import 'package:userstory_remote_data_fetching/features/post/data/models/post_model.dart';
import 'post_remote_data_source.dart';

//  Uses HTTP client to fetch data

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final NetworkClient client;

  PostRemoteDataSourceImpl(this.client);

  @override
  Future<List<PostModel>> getPosts() async {
    final response = await client.get("https://jsonplaceholder.typicode.com/posts");

    final data = HttpResponseHandler.handle(response);

    return (data as List)
        .map((json) => PostModel.fromJson(json))
        .toList();
  }
}