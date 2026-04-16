import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userstory_remote_data_fetching/features/post/presentation/cubit/post_cubit.dart';
import 'package:userstory_remote_data_fetching/features/post/presentation/widgets/post_list_widget.dart';
import 'package:userstory_remote_data_fetching/injection/injection_container.dart';


// Cubit provided via BlocProvider

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PostCubit>()..fetchPosts(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Posts")),
        body: const PostListWidget(),
      ),
    );
  }
}