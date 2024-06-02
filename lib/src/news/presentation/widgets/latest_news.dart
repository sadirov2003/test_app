import 'package:flutter/material.dart';
import 'package:flutter_news_app/core/res/colors.dart';

import '../../data/models/article.dart';
import '../bloc/news_bloc.dart';
import '../bloc/news_event.dart';

class LatestNews extends StatelessWidget {
  final List<Article> data;
  final NewsBloc newsBloc;
  const LatestNews({
    required this.newsBloc,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    


    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final model = data[index];
        return Padding(
          padding: const EdgeInsets.only(left: 28, right: 28, bottom: 20),
          child: GestureDetector(
            onTap: () {
              newsBloc.add(NewsButtonNavigateEvent(clickedArticleModel: model));
            },
            child: Material(
              elevation: 10,
              shadowColor: Colors.black38,
              borderRadius: BorderRadius.circular(9),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 103,
                decoration: BoxDecoration(
                  color: model.readed
                      ? ColorsUI.darkColorLatestNewsContainer
                      : ColorsUI.whiteColor,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Center(
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(width: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          model.imageUrl,
                          width: 90,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 46,
                            width: (MediaQuery.sizeOf(context).width) - 221,
                            child: Text(
                              model.title,
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 16),
                            ),
                          ),
                          Text(
                            timePublished(model.publicationDate.toString()),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 12, color: ColorsUI.publishedTimeColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
