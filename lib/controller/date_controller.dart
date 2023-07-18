import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mediaprobe/model/most_popular/results.dart';
import 'package:mediaprobe/repository/custom_exception.dart';

final dateExceptionProvider = StateProvider<CustomException?>((ref) => null);

final dateControllerProvider =
    StateNotifierProvider<DateStateController, String>(
        (ref) => DateStateController(ref));

class DateStateController extends StateNotifier<String> {
  final Ref ref;
  DateStateController(this.ref) : super("");

  List<Results> sortNews(List<Results> newsResultList) {
    List<Results> sortedList = newsResultList;
    sortedList.sort((a, b) {
      DateTime? aDate;
      DateTime? bDate;
      try {
        aDate = DateTime.parse(a.publishedDate ?? "");
      } on FormatException {
        // Geçersiz bir tarih ise null ata
        aDate = null;
      }
      try {
        bDate = DateTime.parse(b.publishedDate ?? "");
      } on FormatException {
        // Geçersiz bir tarih ise null ata
        bDate = null;
      }
      // Baştaki -1 ile çarptığımızda güncelden eskiye doğru sıralama yapar
      return -1 * (aDate ?? DateTime(0)).compareTo(bDate ?? DateTime(0));
    });

    return sortedList;
  }
}
