import 'package:flash_news/widgets/carousel_with_indicator.dart';
import 'package:flash_news/widgets/custom_headline.dart';
import 'package:flash_news/widgets/custom_icon.dart';
import 'package:flash_news/widgets/news_builder.dart';
import 'package:flutter/material.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIcon(
                icon: Icons.menu,
                size: 30,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CustomIcon(
                      icon: Icons.search,
                      size: 30,
                    ),
                  ),
                  CustomIcon(
                    icon: Icons.notifications,
                    size: 30,
                  ),
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
          SizedBox(height: 170, width: 450, child: CarouselWithIndicatorDemo()),
          SizedBox(
            height: 28,
          ),
          CustomHeadline(
            text: 'Recommendations',
          ),
          SizedBox(
            height: 15,
          ),
          NewsBuilder(),
        ],
      ),
    );
  }
}
