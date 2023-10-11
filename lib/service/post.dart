import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/post_model.dart';

Future<List<Post>> fetchData() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  List<Post> postInstances = [];
  var response = await http.get(url);
  if (response.statusCode == 200) {
    final List<dynamic> jsonData = jsonDecode(response.body);
    for (var post in jsonData) {
      postInstances.add(Post.fromJson(post));
    }
    return postInstances;
  } else {
    throw Exception('API를 불러오지 못했습니다.');
  }
}
