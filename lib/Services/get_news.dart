import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flash_news/model/news_tile.dart';

class GetNews {
  final Dio dio;
  GetNews({required this.dio});
  Future<List<NewsTileModel>> fetchNews() async {
    final String category = "Football";
    String apiKey = "474378253e974245a7d7039b121e7a71";
    try {
      Response response = await dio
          .get('https://newsapi.org/v2/everything?q=$category&apiKey=$apiKey');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<NewsTileModel> newsTileList = [];

      for (var article in articles) {
        NewsTileModel newsTile = NewsTileModel.fromJson(article, category);
        newsTileList.add(newsTile);
      }

      return newsTileList;
    } on DioException catch (e) {
      log("dio exception : ${e.response.toString()}");
      return [];
    } catch (e) {
      log("exception : ${e.toString()}");
      return [];
    }
  }

  Future<NewsTileModel?> fetchPoliticalNews() async {
    final String category = "Political";
    String apiKey = "474378253e974245a7d7039b121e7a71";
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/everything?q=$category&apiKey=$apiKey',
      );
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];

      if (articles.isNotEmpty) {
        return NewsTileModel.fromJson(articles[0], category); // أول خبر فقط
      }
      return null;
    } on DioException catch (e) {
      log("dio exception : ${e.response.toString()}");
      return null;
    } catch (e) {
      log("exception : ${e.toString()}");
      return null;
    }
  }

  Future<NewsTileModel?> fetchArticle(String category) async {
    String apiKey = "474378253e974245a7d7039b121e7a71";
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/everything?q=$category&apiKey=$apiKey',
      );
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];

      if (articles.isNotEmpty) {
        return NewsTileModel.fromJson(articles[0], category); // أول خبر فقط
      }
      return null;
    } on DioException catch (e) {
      log("dio exception : ${e.response.toString()}");
      return null;
    } catch (e) {
      log("exception : ${e.toString()}");
      return null;
    }
  }
}
