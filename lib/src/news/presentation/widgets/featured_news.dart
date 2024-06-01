import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/news/presentation/bloc/news_bloc.dart';
import 'package:flutter_news_app/src/news/presentation/bloc/news_event.dart';

import '../../data/models/article.dart';

class FeaturedNews extends StatelessWidget {
  final List<Article> data;
  final NewsBloc newsBloc;
  const FeaturedNews({
    required this.data,
    required this.newsBloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          EdgeInsets kPadding;
          if (index == data.length - 1) {
            kPadding = const EdgeInsets.only(left: 28, right: 28);
          } else {
            kPadding = const EdgeInsets.only(left: 28);
          }
          final model = data[index];

          return Padding(
            padding: kPadding,
            child: GestureDetector(
              onTap: () {
                newsBloc.add(NewsButtonNavigateEvent(clickedArticleModel: model));
              },
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width - 56,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(
                          model.imageUrl,
                        ),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5),
                          BlendMode.darken,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 194,
                    left: 20,
                    child: Container(
                      width: 270,
                      child: Text(
                        model.title,
                        style: const TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
