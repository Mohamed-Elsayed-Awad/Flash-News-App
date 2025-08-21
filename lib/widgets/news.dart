import 'package:cached_network_image/cached_network_image.dart';
import 'package:flash_news/model/news_tile.dart';
import 'package:flash_news/views/article_view.dart';
import 'package:flutter/material.dart';


class News extends StatelessWidget {
  News({super.key, required this.newsTileModel});
  final NewsTileModel newsTileModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleView(newsTileModel: newsTileModel),
            ),
          );
        },
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: (newsTileModel.img != null &&
                          newsTileModel.img!.isNotEmpty)
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
                    newsTileModel.category!,
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
                        ' 8 min ago',
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
