import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mediaprobe/controller/date_controller.dart';
import 'package:mediaprobe/model/most_popular/results.dart';

void main() {
  //Providerı oluşturuyoruz
  final container = ProviderContainer();

  final ref = container.read;
  // Örnek haber sonuçları listesi
  List<Results> newsResultList = [
    Results(
      title: "Son dakika: Türkiye'de korona virüs vaka sayısı açıklandı",
      publishedDate: "2023-07-18T10:00:00Z", //farklı format tarih testi için
    ),
    Results(
      title: "Olimpiyatlar başladı! İşte Türkiye'nin madalya umudu sporcular",
      publishedDate: "2023-07-16",
    ),
    Results(
      title: "Dolar yine yükseldi! İşte güncel kur",
      publishedDate: "2023-07-15",
    ),
    Results(
      title: "Yaz tatili bitti! Okullar ne zaman açılacak?",
      publishedDate: "2023-06-10",
    ),
    Results(
      title: "Meteoroloji'den uyarı! Sıcak hava dalgası geliyor",
      publishedDate: null, //null testi
    ),
    Results(
      title: "Sahte haber uyarısı! Bu mesajlara inanmayın",
      publishedDate: "invalid date", //geçersiz tarih
    ),
  ];

  // Boş liste testi
  test('Boş bir liste verildiğinde boş bir liste döndürür', () {
    // Boş bir liste oluştur
    List<Results> emptyList = [];

    // Fonksiyonu çağır ve sonucu al
    List<Results> result =
        ref(dateControllerProvider.notifier).sortNews(emptyList);

    // Sonucun boş bir liste olduğunu kontrol et
    expect(result, isEmpty);
  });

  // Sıralanmış liste testi
  test('Zaten sıralanmış bir liste verildiğinde aynı listeyi döndürür', () {
    // Fonksiyonu çağır ve sonucu al
    List<Results> result =
        ref(dateControllerProvider.notifier).sortNews(newsResultList);

    // Sonucun verilen listenin aynısı olduğunu kontrol et
    expect(result, equals(newsResultList));
  });

  // Sıralanmamış liste testi
  test(
      'Sıralanmamış bir liste verildiğinde güncelden eskiye doğru sıralanmış bir liste döndürür',
      () {
    // Verilen listenin tersini al

    var mixList = newsResultList;
    mixList.shuffle();

    // Fonksiyonu çağır ve sonucu al
    List<Results> result =
        ref(dateControllerProvider.notifier).sortNews(mixList);

    // Sonucun verilen listenin aynısı olduğunu kontrol et
    // expect(result, equals(newsResultList));
    expect(listEquals(result, newsResultList), isTrue);
  });

  // Yayınlanma tarihi olmayan veya geçersiz olan haber sonuçları testi
  test(
      'Yayınlanma tarihi olmayan veya geçersiz olan haber sonuçlarını listenin sonuna atar',
      () {
    // Yayınlanma tarihi olmayan veya geçersiz olan haber sonuçlarını listeden çıkar
    List<Results> validList = newsResultList
        .where((result) =>
            result.publishedDate != null &&
            result.publishedDate != "invalid date")
        .toList();

    // Fonksiyonu çağır ve sonucu al
    List<Results> result =
        ref(dateControllerProvider.notifier).sortNews(newsResultList);

    // Sonucun ilk dört elemanının geçerli listeye eşit olduğunu kontrol et
    expect(result.sublist(0, 4), equals(validList));

    // Sonucun son iki elemanının yayınlanma tarihi olmayan veya geçersiz olan haber sonuçları olduğunu kontrol et
    expect(result[4].publishedDate, isNull);
    expect(result[5].publishedDate, equals("invalid date"));
  });
}
