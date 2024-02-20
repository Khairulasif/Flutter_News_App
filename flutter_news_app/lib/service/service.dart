import 'dart:convert';

import 'package:flutter_news_app/model/news_model.dart';
import 'package:http/http.dart';

class ApiService {
  final all_news_url =
      "https://newsapi.org/v2/everything?q=bitcoin&apiKey=66a6e184a8214d5d9bc1af58fb8c510e";

  final breaking_news_url =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=66a6e184a8214d5d9bc1af58fb8c510e";

  Future<List<NewsModel>> getAllNews() async {
    try {
      Response response = await get(Uri.parse(all_news_url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articleList =
            body.map((item) => NewsModel.fromJson(item)).toList();
        return articleList;
      } else {
        throw ("No News Found");
      }
    } catch (e) {
      throw e;
    }
  }

  Future<List<NewsModel>> getBreakingNews() async {
    try {
      Response response = await get(Uri.parse(breaking_news_url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articleList =
        body.map((item) => NewsModel.fromJson(item)).toList();
        return articleList;
      } else {
        throw ("No News Found");
      }
    } catch (e) {
      throw e;
    }
  }
}
