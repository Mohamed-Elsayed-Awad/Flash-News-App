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
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0, top: 8),
        child: CustomIcon(
          icon: Icons.chevron_left,
          size: 30,
        ),
      ),
      actions: [
        CustomIcon(
          icon: Icons.bookmark_border_outlined,
          size: 26,
        ),
        SizedBox(
          width: 8,
        ),
        CustomIcon(
          icon: Icons.menu,
          size: 26,
        ),
        SizedBox(
          width: 8,
        ),
      ],
      iconTheme: IconThemeData(color: Colors.white),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                newsTileModel.img!,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Opacity(
                opacity: 0.2,
                child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.black)),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        newsTileModel.category!,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 400,
                    child: Text(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      newsTileModel.title!,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        "${newsTileModel.channel} -",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        ' 8 min ago',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
