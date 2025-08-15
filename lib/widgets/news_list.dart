import 'package:flash_news/model/news_tile.dart';
import 'package:flash_news/widgets/news.dart';
import 'package:flutter/material.dart';

class newsListUi extends StatelessWidget {
  const newsListUi({
    required this.newsList,
    required this.category,
  });
  final String category;
  final List<NewsTileModel> newsList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: newsList.length,
          itemBuilder: (context, item) {
            return News(
              category: category,
              newsTileModel: newsList[item],
            );
          }),
    );
  }
}
