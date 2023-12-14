import 'package:infinite_list_bloc/post/data/data_provider/post_data_provider.dart';
import 'package:infinite_list_bloc/post/models/post_model.dart';

class PostRepository {
  PostRepository(this.postDataProvider);

  final PostDataProvider postDataProvider;

  Future<List<PostModel>> fetchPost([int startIndex = 0]) async {
    try {
      return postDataProvider.fetchPost();
    } catch (e, st) {
      print('ERROR FETCH POST REPO $e $st');
      throw e.toString();
    }
  }
}
