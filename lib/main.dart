import 'package:firebase_core/firebase_core.dart';
import 'package:flash_news/Cubits/getNewsCubit/get_news_cubit.dart';
import 'package:flash_news/firebase_options.dart';
import 'package:flash_news/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(FlashNewsApp());
}

class FlashNewsApp extends StatelessWidget {
 const FlashNewsApp({super.key});

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
