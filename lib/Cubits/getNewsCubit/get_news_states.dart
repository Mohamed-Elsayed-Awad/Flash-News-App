import 'package:flash_news/model/news_tile.dart';

class GeneralNewsState extends NewsStates {}

class NewsState extends NewsStates {
  String category;

  NewsState({required this.category});
}

class FailureState extends NewsStates {}

class newsLoading extends NewsStates{}
class NewsStates {}