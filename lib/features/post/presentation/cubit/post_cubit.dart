import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userstory_remote_data_fetching/features/post/domain/usecases/get_posts_usecase.dart';
import 'post_state.dart';




class PostCubit extends Cubit<PostState> {
  final GetPostsUseCase getPostsUseCase;

  PostCubit(this.getPostsUseCase) : super(PostInitial());

  Future<void> fetchPosts() async {
    emit(PostLoading());

    final result = await getPostsUseCase();

    result.fold(
      (failure) => emit(PostError(failure.message)),
      (data) => emit(PostLoaded(data)),
    );
  }
}