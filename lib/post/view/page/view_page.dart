import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_bloc/post/bloc/bloc/post_bloc.dart';
import 'package:infinite_list_bloc/post/data/data_provider/post_data_provider.dart';
import 'package:infinite_list_bloc/post/data/repository/post_repository.dart';
import 'package:infinite_list_bloc/post/widgets/post_list.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          final postRepo = PostRepository(PostDataProvider());
          return PostBloc(postRepo)..add(PostFetched());
        },
        child: const PostsList(),
      ),
    );
  }
}
