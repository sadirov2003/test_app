import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/src/news/presentation/bloc/news_bloc.dart';
import 'package:flutter_news_app/src/news/presentation/bloc/news_event.dart';
import 'package:flutter_news_app/src/news/presentation/bloc/news_state.dart';
import 'package:flutter_news_app/src/news/presentation/views/news_detailed_page.dart';
import 'package:flutter_news_app/src/news/presentation/widgets/latest_news.dart';

import '../../../../core/icons/custom_icons.dart';
import '../widgets/featured_news.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final NewsBloc newsBloc = NewsBloc();

  @override
  void initState() {
    super.initState();
    newsBloc.add(NewsInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(CustomIcons.arrow_back, color: Color(0xFF000000)),
        ),
        title: Text(
          'Notifications',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            child: Text(
              'Mark all read',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18),
            ),
            onPressed: () {
              newsBloc.add(NewsResetEvent(clickedMakeAll: true));
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: BlocConsumer<NewsBloc, NewsState>(
        bloc: newsBloc,
        listenWhen: (previous, current) => current is NewsActionState,
        buildWhen: (previous, current) => current is! NewsActionState,
        listener: (context, state) async {
          if (state is NewsNavigateToDetailedPageActionState) {
            await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) =>
                        NewsDetailedPage(model: state.articleModel))));
            newsBloc.add(NewsResetEvent(articleModel: state.articleModel));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case NewsLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case NewsLoadedState:
              final successState = state as NewsLoadedState;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 28, top: 20),
                      child: Text(
                        'Featured',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FeaturedNews(
                        data: successState.featuredData, newsBloc: newsBloc),
                    Padding(
                      padding: const EdgeInsets.only(left: 28, top: 20),
                      child: Text(
                        'Latest news',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 20),
                    LatestNews(
                        data: successState.latestData, newsBloc: newsBloc),
                  ],
                ),
              );
            case NewsErrorState:
              return const Center(
                child: Text(
                  'Произошла ошибка',
                ),
              );

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
