import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flash_news/Services/get_news.dart';
import 'package:flash_news/model/news_tile.dart';
import 'package:flash_news/widgets/news_list.dart';
import 'package:flutter/material.dart';

class NewsBuilder extends StatefulWidget {
  @override
  State<NewsBuilder> createState() => _NewsBuilderState();
}

class _NewsBuilderState extends State<NewsBuilder> {
  var future;
  @override
  void initState() {
    super.initState();

    future = GetNews(dio: Dio()).fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsTileModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: Colors.blue));
        } else if (snapshot.hasError) {
          return Text("There are error");
        } else if (snapshot.hasData) {
          log('message');
          return newsListUi(
            newsList: snapshot.data!,
          );
        } else {
          return Text('There is no data');
        }
      },
    );
  }
}
