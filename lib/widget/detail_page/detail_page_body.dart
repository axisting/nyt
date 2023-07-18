import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mediaprobe/constant/general_constants.dart';
import 'package:mediaprobe/controller/article_search_controller.dart';
import 'package:mediaprobe/model/most_popular/results.dart';
import 'package:mediaprobe/widget/detail_page/image_detail.dart';

class DetailPageBody extends HookConsumerWidget {
  final Results? newsResult;
  const DetailPageBody({super.key, required this.newsResult});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ? String articleUrl =GeneralConstant.getUrlFromArticle(newsUrl: newsResult?.url ?? "");
    return Padding(
      padding: EdgeInsets.all(GeneralConstant.padding),
      child: Column(
        children: [
          ImageForDetailPage(
              url: newsResult?.media == null
                  ? ""
                  : newsResult!.media!.isEmpty
                      ? ""
                      : newsResult!.media?.last.mediaMetadata?.last.url ??
                          ""),
          const Divider(),
          // ? Text(articleUrl),
          articleBody(ref),
        ],
      ),
    );
  }

  Widget articleBody(WidgetRef ref) {
    var futureArticle = ref
        .watch(articleControllerProvider.notifier)
        .getArticleDocs(newsUrl: newsResult?.url ?? "");
    return FutureBuilder(
        future: futureArticle,
        builder: (context, snapshot) {
          var data = snapshot.data ?? [];

          return data.isEmpty
              ? const SizedBox()
              : Expanded(
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          const Expanded(child: SizedBox()),
                          Text(
                            newsResult?.publishedDate ?? "",
                          ),
                        ],
                      ),
                      const Divider(),
                      Text(
                        newsResult?.title ?? "",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Divider(),
                      Text(data.first.snippet.toString()),
                      const Divider(),
                      Text(data.first.leadParagraph.toString()),
                    ],
                  ),
                );
        });
  }
}
