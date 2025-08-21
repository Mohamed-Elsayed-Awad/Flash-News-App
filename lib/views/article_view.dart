import 'package:flash_news/model/news_tile.dart';
import 'package:flash_news/widgets/article_app_bar.dart';
import 'package:flash_news/widgets/news_body.dart';
import 'package:flutter/material.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key, required this.newsTileModel});
  final NewsTileModel newsTileModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            ArticleAppBar(newsTileModel: newsTileModel),
            SliverToBoxAdapter(
              child: NewsBody(
                newsTileModel: newsTileModel,
              ),
            )
          ],
        ));
  }
}
