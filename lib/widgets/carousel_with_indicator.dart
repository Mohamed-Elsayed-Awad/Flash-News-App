import 'package:carousel_slider/carousel_slider.dart';
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

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imgList.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imgList[itemIndex]['img'],
                fit: BoxFit.cover,
                width: 400,
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   left: 0,
            //   right: 0,
            //   child: Container(
            //     width: 200,
            //     height: 60,
            //     color: Colors.blue.withOpacity(0.3),
            //     child: Center(
            //       child: Text(
            //         imgList[itemIndex]['name'],
            //         style: TextStyle(fontSize: 19, color: Colors.white),
            //       ),
            //     ),
            //   ),
            // ),
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
        autoPlayInterval: Duration(seconds: 2),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
