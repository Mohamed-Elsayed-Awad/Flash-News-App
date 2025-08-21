import 'dart:math';

import 'package:flash_news/model/news_tile.dart';
import 'package:flash_news/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class ArticleAppBar extends StatefulWidget {
  const ArticleAppBar({super.key, required this.newsTileModel});
  final NewsTileModel newsTileModel;

  @override
  State<ArticleAppBar> createState() => _ArticleAppBarState();
}

class _ArticleAppBarState extends State<ArticleAppBar> {
  List<NewsTileModel> bookmarkedList = [];
  bool isBookMarked = false;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: Container(
          height: 20,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        ),
      ),
      pinned: true,
      expandedHeight: 380,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0, top: 8),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: CustomIcon(
            icon: Icons.chevron_left,
            size: 30,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            if (isBookMarked == false) {
              bookmarkedList.add(widget.newsTileModel);
              isBookMarked = true;
              for (var element in bookmarkedList) {
                if (bookmarkedList.isEmpty) {
                  print('zero');
                }
                print(element.title);
              }
              setState(() {});
            } else {
              bookmarkedList.remove(widget.newsTileModel);
              isBookMarked = false;
              for (var element in bookmarkedList) {
                if (bookmarkedList.isEmpty) {
                  print('zero');
                }
                print(element);
              }
              setState(() {});
            }
          },
          child: CustomIcon(
            icon: isBookMarked
                ? Icons.bookmark_added
                : Icons.bookmark_border_outlined,
            size: 26,
          ),
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
                widget.newsTileModel.img!,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Opacity(
                opacity: 0.25,
                child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.black)),
              ),
            ),
            Positioned(
              bottom: 30,
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
                        widget.newsTileModel.category!,
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
                      widget.newsTileModel.title!,
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
                        "${widget.newsTileModel.channel} -",
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
