import 'package:let_us_learn/models/QesPosts.dart';
import 'package:http/http.dart' as http;

class QesServices {
  static const String url =
      'https://learn.maledamotivation.com/learn/v1/Questions.php';

  static Future<List<QesPosts>> getQuesPosts() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<QesPosts> listPosts = qesPostsFromJson(response.body);
        return listPosts;
      } else {
        return List<QesPosts>();
      }
    } catch (e) {
      return List<QesPosts>();
    }
  }
}
