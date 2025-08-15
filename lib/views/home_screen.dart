import 'package:flash_news/views/empty_Screen.dart';
import 'package:flash_news/widgets/carousel_with_indicator.dart';
import 'package:flash_news/widgets/custom_headline.dart';
import 'package:flash_news/widgets/custom_icon.dart';

import 'package:flash_news/widgets/news_builder.dart';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [
    EmptyScreen(text: '1'),
    EmptyScreen(text: '2'),
    EmptyScreen(text: '3'),
    EmptyScreen(text: '4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
          child: GNav(
            rippleColor: Colors.white,
            padding: EdgeInsets.all(12),
            tabBorderRadius: 200,
            gap: 10,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.blue,
            onTabChange: (s) {},
            duration: Duration(milliseconds: 400),
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.search,
                text: "Search",
              ),
              GButton(
                icon: Icons.favorite_border,
                text: "Favorite",
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
            backgroundColor: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIcon(icon: Icons.menu),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: CustomIcon(icon: Icons.search),
                    ),
                    CustomIcon(icon: Icons.notifications),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            CustomHeadline(
              text: 'Breaking News',
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(height: 200, child: CarouselWithIndicatorDemo()),
            SizedBox(
              height: 28,
            ),
            CustomHeadline(
              text: 'Recommendations',
            ),
            SizedBox(
              height: 12,
            ),
            NewsBuilder(),
          ],
        ),
      ),
    );
  }
}
