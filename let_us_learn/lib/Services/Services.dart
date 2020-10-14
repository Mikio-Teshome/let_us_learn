import 'package:let_us_learn/models/posts.dart';
import 'package:http/http.dart' as http;

class Services {
  static const String url =
      'https://learn.maledamotivation.com/learn/v1/books.php';

  static Future<List<Post>> getPosts() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Post> listPosts = postFromJson(response.body);
        return listPosts;
      } else {
        return List<Post>();
      }
    } catch (e) {
      return List<Post>();
    }
  }
}
