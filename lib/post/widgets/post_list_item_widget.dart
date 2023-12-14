import 'package:flutter/material.dart';
import 'package:infinite_list_bloc/post/models/post_model.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({required this.post, super.key});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text('${post.id}', style: textTheme.bodySmall),
        title: Text(post.title),
        isThreeLine: true,
        subtitle: Text(post.body),
        dense: true,
      ),
    );
  }
}
