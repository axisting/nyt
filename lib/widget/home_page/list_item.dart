import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mediaprobe/model/most_popular/results.dart';
import 'package:mediaprobe/widget/image_for_leading.dart';

class HomePageListItem extends HookConsumerWidget {
  final Results newsResult;
  const HomePageListItem({super.key, required this.newsResult});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: newsResult);
      },
      child: ListTile(
        // Burada media veya mediametadata boş gelebilir. Bu yüzden boş olup olmadığı kontrol edilmeli
        // ve en kaliteli resim için son elemana gidilip, kaliteli resim urlsi eklenmeli
        leading: ImageForLeading(
            imageUrl: newsResult.media == null
                ? ""
                : newsResult.media!.isEmpty
                    ? ""
                    : newsResult.media?.last.mediaMetadata?.last.url ?? ""),
        trailing: const Icon(Icons.arrow_forward_ios),
        title: Text(
          newsResult.title ?? "",
          maxLines: 2,
        ),
        subtitle: Text("${newsResult.byline}    ${newsResult.publishedDate}"),
      ),
    );
  }
}
