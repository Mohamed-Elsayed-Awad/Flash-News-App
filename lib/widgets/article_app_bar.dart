import 'package:flash_news/model/news_tile.dart';
import 'package:flash_news/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class ArticleAppBar extends StatelessWidget {
  const ArticleAppBar({super.key, required this.newsTileModel});
  final NewsTileModel newsTileModel;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 350,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: CustomIcon(icon: Icons.chevron_left),
      ),
      flexibleSpace: FlexibleSpaceBar(
          background: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              newsTileModel.img!,
              fit: BoxFit.cover,
            ),
          ),
        ],
      )),
    );
  }
}
