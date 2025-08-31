import 'package:dio/dio.dart';
import 'package:flash_news/Cubits/getNewsCubit/get_news_states.dart';
import 'package:flash_news/Services/get_news.dart';
import 'package:flash_news/model/news_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetNewsCubit extends Cubit<NewsStates> {
  GetNewsCubit() : super(GeneralNewsState());
  List<NewsTileModel> newsList = [];
  void fetchNews({required String category}) async {
    emit(LoadingNewsState());
    try {
      newsList = await GetNews(dio: Dio()).fetchNews(category);
      emit(NewsState(newList: newsList));
    } catch (e) {
      emit(FailureState(message: e.toString()));
    }
  }
}
