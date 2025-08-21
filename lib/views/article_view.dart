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
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                ArticleAppBar(newsTileModel: newsTileModel),
                SliverToBoxAdapter(
                  child: NewsBody(
                    newsTileModel: newsTileModel,
                  ),
                )
              ],
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  height: 70,
                  width: 430,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.white, Colors.white.withOpacity(0)])),
                ))
          ],
        ));
  }
}
