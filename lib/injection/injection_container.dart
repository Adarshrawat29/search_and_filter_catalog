import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'package:userstory_remote_data_fetching/features/post/data/datasources/post_remote_data_source.dart';
import 'package:userstory_remote_data_fetching/features/post/data/datasources/post_remote_data_source_impl.dart';
import 'package:userstory_remote_data_fetching/features/post/data/repositories/post_repository_impl.dart';
import 'package:userstory_remote_data_fetching/features/post/domain/repository/post_repository.dart';
import 'package:userstory_remote_data_fetching/features/post/domain/usecases/get_posts_usecase.dart';
import 'package:userstory_remote_data_fetching/features/post/presentation/cubit/post_cubit.dart';

import '../core/network/network_client.dart';
import '../core/network/dio_network_client.dart';




final sl = GetIt.instance;


/// Dependency Injection wires layers together

Future<void> setupInjection() async {
  // External
  sl.registerLazySingleton(() => Dio());

  // Core
  sl.registerLazySingleton<NetworkClient>(

                              () => DioNetworkClient(sl()),

                             );

  /// Data Source
  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(sl()),
  );

  /// Repository
  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(sl()),
  );

  /// UseCase
  sl.registerLazySingleton(() => GetPostsUseCase(sl()));

  /// Cubit
  sl.registerFactory(() => PostCubit(sl()));

  /// 🔥 FLOW EXPLANATION:
  /// UI (PostPage) → asks GetIt for PostCubit
  /// PostCubit → gets UseCase
  /// UseCase → gets Repository
  /// Repository → gets DataSource
  /// DataSource → gets NetworkClient
}