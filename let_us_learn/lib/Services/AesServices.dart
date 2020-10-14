import 'package:let_us_learn/models/AesPosts.dart';
import 'package:http/http.dart' as http;

class AesServices {
  static const String url = 'https://learn.maledamotivation.com/learn/v1/Answers.php';

  static Future<List<AesPosts>> getQuesPosts({String id}) async {
    try {
      // final response = await http.get(url);
      final response = await http.post(url, body: {'id': id});
      if (response.statusCode == 200) {
        final List<AesPosts> listPosts = aesPostsFromJson(response.body);
        return listPosts;
      } else {
        return List<AesPosts>();
      }
    } catch (e) {
      return List<AesPosts>();
    }
  }
}
