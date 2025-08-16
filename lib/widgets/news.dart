import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flash_news/model/news_tile.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class News extends StatelessWidget {
  News({super.key, required this.newsTileModel, required this.category});
  final NewsTileModel newsTileModel;
  final String category;
  final timeDate = DateTime.now();
  final timeAgo = DateTime.now().subtract(Duration(minutes: 1));
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl:
                    (newsTileModel.img != null && newsTileModel.img!.isNotEmpty)
                        ? newsTileModel.img!
                        : "https://via.placeholder.com/150",
                width: 150,
                height: 90,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: TextStyle(color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    '${newsTileModel.title}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "${newsTileModel.channel} -",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      timeago.,
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
