import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flash_news/Services/get_news.dart';
import 'package:flash_news/model/news_tile.dart';
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
    });
  }

  @override
  void initState() {
    super.initState();
    getArticle();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: articleList.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: articleList.isNotEmpty
                  ? Image.network(
                      articleList[itemIndex].img!,
                      fit: BoxFit.cover,
                      width: 400,
                    )
                  : Image.asset(
                      imgList[itemIndex]['img'],
                      fit: BoxFit.cover,
                      width: 400,
                    ),
            ),
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
