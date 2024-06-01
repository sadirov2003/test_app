import 'package:flutter/material.dart';

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
            onTap: (){
              newsBloc.add(NewsButtonNavigateEvent(clickedArticleModel: model));
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 103,
              decoration: BoxDecoration(
                
                color: model.readed ? Color(0xFFF5F5F5) : Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Center(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        model.imageUrl,
                        width: 90,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 23),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 46,
                          width: 190,
                          child: Text(
                            model.title,
                            maxLines: 2,
                            style: const TextStyle(
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Text(
                          '1 day ago',
                          style: const TextStyle(
                            color: Color(0xFF9A9A9A),
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
