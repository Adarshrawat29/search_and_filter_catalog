import 'package:flutter/material.dart';
import '../../domain/entities/post_entity.dart';

/// Reusable UI component
/// AC 11.3: UI maps from Domain Entity ONLY

class PostItemWidget extends StatelessWidget {
  final PostEntity post;

  const PostItemWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(post.title),
        subtitle: Text(post.body),
      ),
    );
  }
}