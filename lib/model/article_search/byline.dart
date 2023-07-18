import 'package:mediaprobe/model/article_search/person.dart';

class Byline {
  String? original;
  List<Person>? person;
  String? organization;

  Byline({this.original, this.person, this.organization});

  Byline.fromJson(Map<String, dynamic> json) {
    original = json['original'];
    if (json['person'] != null) {
      person = <Person>[];
      json['person'].forEach((v) {
        person!.add(Person.fromJson(v));
      });
    }
    organization = json['organization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['original'] = original;
    if (person != null) {
      data['person'] = person!.map((v) => v.toJson()).toList();
    }
    data['organization'] = organization;
    return data;
  }
}