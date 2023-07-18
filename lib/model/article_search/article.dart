import 'package:mediaprobe/model/article_search/response.dart';

class Article {
  String? status;
  String? copyright;
  Response? response;

  Article({this.status, this.copyright, this.response});

  Article.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    copyright = json['copyright'];
    response = json['response'] != null
        ? Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['copyright'] = copyright;
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }
}












