import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/post_cubit.dart';
import '../cubit/post_state.dart';
import 'post_item_widget.dart';

/// AC 11.3:
/// Render list, loading, error, empty state

class PostListWidget extends StatelessWidget {
  const PostListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        if (state is PostLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is PostError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.message),
                ElevatedButton(
                  onPressed: () =>
                      context.read<PostCubit>().fetchPosts(),
                  child: const Text("Retry"),
                ),
              ],
            ),
          );
        }

        if (state is PostLoaded) {
          if (state.posts.isEmpty) {
            return const Center(child: Text("No posts available"));
          }

          return ListView.builder(
            itemCount: state.posts.length,
            itemBuilder: (_, index) =>
                PostItemWidget(post: state.posts[index]),
          );
        }

        return const SizedBox();
      },
    );
  }
}