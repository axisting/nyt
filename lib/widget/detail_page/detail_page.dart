import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mediaprobe/model/most_popular/results.dart';
import 'package:mediaprobe/widget/detail_page/detail_page_body.dart';

class DetailPage extends HookConsumerWidget {
  final Results newsResult;
  const DetailPage({super.key, required this.newsResult});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newsResult.title.toString()),
        
      ),
      body: DetailPageBody(newsResult: newsResult,),
    );
  }
}
