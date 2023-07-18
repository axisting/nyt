# NY Times API Kullanma üzerine çalışma

Bu proje bir study case olarak ve kendime bir challenge olarak  adına yaptığım bir projedir.

## Başlarken

Bu bir Flutter projesidir. 
Sadece mobil arayüzü düşünülerek bir tasarım yapılmıştır. 

- NY Times API kullanılmıştır (https://developer.nytimes.com/)
- [Flutter](https://flutter.dev/)


## Bilinmesi gerekenler
- Uygulama Provider/MVC design patternlerine uygun olarak dizayn edilmiştir. 

- Uygulama main.dart ile başlar. 
- route_generator ile sayfaların yönlendirilmesi yapılmıştır.
- general_provider'da uygulamanın genel Text'leri ve global olarak önemli değişkenler depolanmıştır.
- widget altında widgetlar sayfalara göre klasörlenmiştir. Global'e etki edebilecek widgetlar kategorize edilmemiştir. Doğrudan widget altındadır. 
- Uygulamanın ilk açılış sayfası home_page'dir. 
- Uygulamada her bir widget olabildiğince ayrı ve tekrar kullanılabilir şekilde tasarlanmıştır. 
- Global bazı sabitler constant klasörü altında toplanmıştır.
- controller ve repository klasörleri birlikte uygulamanın methot ve fonksiyon kısmını üstlenir
- Model kısmında NYTimes'ın 2 adet API'si kullanıldığından 2 farklı klasörde kategorize edilmiştir.

## Kullanılan bazı kütüphaneler 
    Riverpod (hooks ile birlikte ) 
    Dio
    intl 
    cached_network_image
    html

  dio: ^5.2.1+1
  hooks_riverpod: ^2.3.6
  flutter_hooks: ^0.18.6
  intl: ^0.18.1
  cached_network_image: ^3.2.3
  html: ^0.15.4

## Uygulamadan görseller

Home Page (https://imgur.com/SKmA3Ng)
Detail Page (https://imgur.com/cXESo1i) 
Drawer (https://imgur.com/0UmM88f)



## Tarih sırama için yapılan unit test sonuçları

Yapılan testte aşağıdaki sonuçlar hedeflenmektedir ve gerçekleşmiştir. 


I/flutter (19063): 00:00 +0: Boş bir liste verildiğinde boş bir liste döndürür
I/flutter (19063): 00:00 +1: Zaten sıralanmış bir liste verildiğinde aynı listeyi döndürür
I/flutter (19063): 00:00 +2: Sıralanmamış bir liste verildiğinde güncelden eskiye doğru sıralanmış bir liste döndürür
I/flutter (19063): 00:00 +3: Yayınlanma tarihi olmayan veya geçersiz olan haber sonuçlarını listenin sonuna atar
I/flutter (19063): 00:00 +4: All tests passed!

