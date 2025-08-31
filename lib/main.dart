import 'package:flash_news/Cubits/getNewsCubit/get_news_cubit.dart';
import 'package:flash_news/views/home_screen.dart';
import 'package:flash_news/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(FlashNewsApp());
}

class FlashNewsApp extends StatelessWidget {
  FlashNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetNewsCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: LoginScreen(),
        ),
      ),
    );
  }
}
