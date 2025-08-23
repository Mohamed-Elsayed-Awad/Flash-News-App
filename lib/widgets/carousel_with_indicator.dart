import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flash_news/Services/get_news.dart';
import 'package:flash_news/model/news_tile.dart';
import 'package:flash_news/views/category_screen.dart';
import 'package:flutter/material.dart';

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  final List<Map> imgList = [
    {
      "name": 'Some words about business',
      "img": 'assets/images/charles-forerunner-3fPXt37X6UQ-unsplash1.jpg'
    },
    {
      "name": 'Some words about business',
      "img": 'assets/images/hunters-race-MYbhN8KaaEc-unsplash(2).jpg'
    },
    {
      "name": 'Some words about business',
      "img": 'assets/images/microsoft-365-oUbzU87d1Gc-unsplash1.jpg'
    },
    {
      "name": 'Some words about business',
      "img": 'assets/images/charles-forerunner-3fPXt37X6UQ-unsplash1.jpg'
    },
  ];

  List<NewsTileModel> articleList = [];
  bool isLoading = true;
  void getArticle() async {
    NewsTileModel? politicsNews =
        await GetNews(dio: Dio()).fetchPoliticalNews();
    NewsTileModel? entertainmentArticle =
        await GetNews(dio: Dio()).fetchArticle('Entertainment');
    NewsTileModel? scienceArticle =
        await GetNews(dio: Dio()).fetchArticle('Science');
    NewsTileModel? footballArticle =
        await GetNews(dio: Dio()).fetchArticle('Football');
    setState(() {
      articleList.add(politicsNews!);
      articleList.add(entertainmentArticle!);
      articleList.add(scienceArticle!);
      articleList.add(footballArticle!);
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getArticle();
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading)
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          )
        : CarouselSlider.builder(
            itemCount: articleList.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 380,
                      height: 200,
                      imageUrl: (articleList[itemIndex].img != null &&
                              articleList[itemIndex].img!.isNotEmpty)
                          ? articleList[itemIndex].img!
                          : "https://via.placeholder.com/150",
                      placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(color: Colors.blue)),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  Positioned.fill(
                    top: 0,
                    child: Opacity(
                        opacity: 0.2,
                        child: DecoratedBox(
                            decoration: BoxDecoration(color: Colors.black))),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      height: 32,
                      width: 105,
                      child: Center(
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryScreen(newsTileModel: articleList[itemIndex],))),
                          child: Text(
                            articleList[itemIndex].category!,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  Positioned(
                      bottom: 8,
                      left: 8,
                      child: SizedBox(
                        width: 300,
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryScreen(newsTileModel: articleList[itemIndex],))),
                          child: Text(
                            articleList[itemIndex].title!,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ))
                ],
              ),
            ),
            options: CarouselOptions(
              height: 400,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
          );
  }
}
