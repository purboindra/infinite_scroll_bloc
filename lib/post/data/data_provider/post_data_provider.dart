import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infinite_list_bloc/post/models/post_model.dart';

const _postLimit = 20;

class PostDataProvider {
  Future<List<PostModel>> fetchPost([int startIndex = 0]) async {
    final response = await http.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/posts',
        <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'},
      ),
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((e) {
        final data = e as Map<String, dynamic>;

        return PostModel(
            id: data["id"] as int,
            title: data["title"] as String,
            body: data["body"] as String);
      }).toList();
    }
    throw Exception("Error Fetching Post");
  }
}
