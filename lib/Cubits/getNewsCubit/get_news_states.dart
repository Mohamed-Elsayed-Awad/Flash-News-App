import 'package:flash_news/model/news_tile.dart';

class GeneralNewsState extends NewsStates {}
class LoadingNewsState extends NewsStates {}

class NewsState extends NewsStates {
  final List<NewsTileModel> newList;

  NewsState({required this.newList});
}

class FailureState extends NewsStates {
  final String message;

  FailureState({required this.message});
}

class NewsStates {}
