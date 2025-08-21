import 'package:flash_news/model/news_tile.dart';
import 'package:flutter/material.dart';

class NewsBody extends StatelessWidget {
  const NewsBody({super.key, required this.newsTileModel});
  final NewsTileModel newsTileModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(newsTileModel.img!),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                newsTileModel.channel!,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
            child: Text(newsTileModel.content!)),
      ],
    );
  }
}
