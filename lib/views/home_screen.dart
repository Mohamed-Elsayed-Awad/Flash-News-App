import 'package:flash_news/Cubits/getNewsCubit/get_news_cubit.dart';
import 'package:flash_news/Cubits/getNewsCubit/get_news_states.dart';
import 'package:flash_news/views/failure_screen.dart';
import 'package:flash_news/views/home_body_view.dart';
import 'package:flash_news/views/home_searched_news.dart';
import 'package:flash_news/views/search_Screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  void goToHome() {
    setState(() {
      selectedIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Flash',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            Text(
              ' News',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
          child: GNav(
            selectedIndex: selectedIndex,
            rippleColor: Colors.white,
            padding: EdgeInsets.all(12),
            tabBorderRadius: 200,
            gap: 10,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.blue,
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
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
      body: IndexedStack(
        index: selectedIndex,
        children: [
          HomeBodyView(),
          SearchScreen(
            onDone: goToHome,
          ),
        ],
      ),
    );
  }
}
