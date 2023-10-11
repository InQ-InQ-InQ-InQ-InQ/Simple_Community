import 'dart:convert';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchdata() async {
  List<User> userInstances = [];
  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    final List<dynamic> jsonData = jsonDecode(response.body);
    for (var user in jsonData) {
      userInstances.add(User.fromJson(user));
    }
    return userInstances;
  } else {
    throw Exception('fail to load api');
  }
}
