import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_api/src/models/article.dart';

class NewsController extends GetxController {
  final baseUrl =
      "https://newsapi.org/v2/everything?q=apple&from=2022-01-23&to=2022-01-23&sortBy=popularity&apiKey=3b92bf255fbd45af95db3affc8288a54";

  Future getNews() async {
    try {
      final res = await http.get(Uri.parse(baseUrl));
      if (res.statusCode == 200) {
        final finalRes = jsonDecode(res.body);
        List<News> news = (finalRes['articles'] as List)
            .map((i) => News.fromJson(i))
            .toList();
        return news;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return e.toString();
    }
  }
}
