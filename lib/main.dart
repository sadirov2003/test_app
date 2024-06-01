import 'package:flutter/material.dart';
import 'package:flutter_news_app/core/res/theme.dart';
import 'package:flutter_news_app/src/news/presentation/views/news_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const NewsPage(),
    );
  }
}

