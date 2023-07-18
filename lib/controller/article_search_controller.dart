import 'package:dio/dio.dart' hide Response;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mediaprobe/constant/general_constants.dart';
import 'package:mediaprobe/model/article_search/article.dart';
import 'package:mediaprobe/model/article_search/docs.dart';

import 'package:mediaprobe/repository/custom_exception.dart';

final articleExceptionProvider = StateProvider<CustomException?>((ref) => null);

final articleControllerProvider =
    StateNotifierProvider<ArticleStateController, String>(
        (ref) => ArticleStateController(ref));

class ArticleStateController extends StateNotifier<String> {
  final Ref ref;
  ArticleStateController(this.ref) : super("");

  Future<List<Docs>> getArticleDocs({required String newsUrl}) async {
    final dio = Dio();
    
    String fullUrl = getUrlFromArticle(newsUrl: newsUrl);

    final dioResponse = await dio.get(
      fullUrl,
    );
    Article article = Article.fromJson(dioResponse.data ?? {});
    var docs = article.response?.docs ?? [];


    return docs;
  }

  String getUrlFromArticle({required String newsUrl}) {
    String encodedUrl = Uri.encodeComponent(newsUrl);

    String fullUrl =
        'https://api.nytimes.com/svc/search/v2/articlesearch.json?q=$encodedUrl&api-key=${GeneralConstant.apiKey}';

    return fullUrl;
  }
}
