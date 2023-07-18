class Headline {
  String? main;
  String? kicker;
  String? contentKicker;
  String? printHeadline;
  String? name;
  String? seo;
  String? sub;

  Headline(
      {this.main,
      this.kicker,
      this.contentKicker,
      this.printHeadline,
      this.name,
      this.seo,
      this.sub});

  Headline.fromJson(Map<String, dynamic> json) {
    main = json['main'];
    kicker = json['kicker'];
    contentKicker = json['content_kicker'];
    printHeadline = json['print_headline'];
    name = json['name'];
    seo = json['seo'];
    sub = json['sub'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['main'] = main;
    data['kicker'] = kicker;
    data['content_kicker'] = contentKicker;
    data['print_headline'] = printHeadline;
    data['name'] = name;
    data['seo'] = seo;
    data['sub'] = sub;
    return data;
  }
}
