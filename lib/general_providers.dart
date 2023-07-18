

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mediaprobe/constant/general_constants.dart';
import 'package:mediaprobe/model/most_popular/news.dart';
import 'package:mediaprobe/model/most_popular/results.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:intl/intl.dart';
//import 'package:html/dom.dart' hide Text;
import 'package:dio/dio.dart';
//import 'package:html/parser.dart' as parser;

final titleProvider = Provider<String>((ref) => "NY Times Most Popular");
final errorMessageProvider =
    Provider<String>((ref) => "Oops! Something is wrong.");

final dateFormatProvider = Provider<DateFormat>((ref) {
  //(dateFormatProvider).format(DateTime.now())  -> kullanımı bu şekilde
  return DateFormat(
      'yyyy-MM-dd'); // Haberin paylaşım zamanına göre yapılan sıralama da tarih formatı bu şekilde
});

final mostPopularProvider = FutureProvider<List<Results>>((ref) async {
  final dio = Dio();

  final response = await dio.get(
    GeneralConstant.apiUrl,
  );
  News news = News.fromJson(response.data ?? {});
  List<Results> newsBodyList = news.results ?? [];
  //getFullText();
  return newsBodyList;
});


// ! Burada haberin tüm text'tini getirmek için haberin websitesindeki gövdesini geçmek için bazı çalışmalar yaptım 
// ? Ama haberin tüm gövdesini getiremedim. Başlarda API içerisinden haber gövdesine ulaşabilirim diye NYTimes içerisinde tüm APIleri kontrol ettim fakat bulamadım. Normalde 2 günde uygulamayı yapmıştım ama haberin tüm içeriğine ulaşmak için 2 günde öyle bakmama rağmen ulaşamadım. Haberin tüm gövdesine ulaşmak ücretli abonelik istiyor olabilir bu yüzden burada manuel çekmeye çalıştım.
/* *
getFullText() async {
  Dio dio = Dio();
  String url =
      "https://www.nytimes.com/2023/07/16/sports/tennis/wimbledon-carlos-alcaraz-novak-djokovic.html";


  Response response = await dio.get(url);


  String html = response.data;


  Document document = parser.parse(html);


  var paragraphs = document.querySelectorAll("p[itemprop='articleBody']");


  String full_text = paragraphs.map((p) => p.text).join(" ");

// full_text değişkenini yazdır
  print("Text :" + full_text);
  print("HTML " + document.toString());
}
*/