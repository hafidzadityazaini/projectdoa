import 'dart:convert';
import 'package:http/http.dart' as http;

class ArticleService {

  static Future<List> getArticles() async {

    final response = await http.get(
      Uri.parse(
        'https://api.spaceflightnewsapi.net/v4/articles/',
      ),
    );

    final data = jsonDecode(response.body);

    return data['results'];
  }
}