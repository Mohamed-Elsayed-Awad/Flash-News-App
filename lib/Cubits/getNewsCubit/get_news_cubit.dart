import 'package:dio/dio.dart';
import 'package:flash_news/Cubits/getNewsCubit/get_news_states.dart';
import 'package:flash_news/Services/get_news.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetNewsCubit extends Cubit<NewsStates> {
  GetNewsCubit() : super(GeneralNewsState());
 
  void fetchNews({required String category}) async {
    try {
     var newsList = await GetNews(dio: Dio()).fetchNews(category);
      emit(NewsState(category: category));
    } catch (e) {
      emit(FailureState());
    }
  }
}
