import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mediaprobe/controller/date_controller.dart';
import 'package:mediaprobe/general_providers.dart';
import 'package:mediaprobe/widget/home_page/list_item.dart';

class HomePageBody extends StatefulHookConsumerWidget {
  const HomePageBody({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends ConsumerState<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    var asyncNews = ref.watch(mostPopularProvider);

    return Container(
      child: asyncNews.when(
          data: (news) {
            return news.isEmpty
                ? const SizedBox()
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: news.length,
                    itemBuilder: (context, index) {
                      var sortedList = ref
                          .watch(dateControllerProvider.notifier)
                          .sortNews(news);
                      var newsItem = sortedList[index];

                      return HomePageListItem(newsResult: newsItem);
                    });
          },
          error: (e, st) {
            debugPrint("TODO PAGE : $e");
            return const Center(
              child: Text("Error"),
            );
          },
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
