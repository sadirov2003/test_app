import 'package:flutter/material.dart';
import 'package:flutter_news_app/core/icons/custom_icons.dart';
import 'package:flutter_news_app/core/res/colors.dart';
import 'package:flutter_news_app/src/news/data/models/article.dart';

class NewsDetailedPage extends StatelessWidget {
  final Article model;
  const NewsDetailedPage({
    required this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Material(
            elevation: 15,
            shadowColor: Colors.black38,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 400,
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
                  left: 48,
                  top: 300,
                  child: Container(
                    width: 270,
                    child: Text(
                      model.title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 28, color: ColorsUI.whiteColor),
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  //left: 5,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      CustomIcons.arrow_back,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, bottom: 20, right: 20),
                  child: Text(
                    model.description!.split('. ').join('.\n\n'),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
