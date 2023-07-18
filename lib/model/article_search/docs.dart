
import 'package:mediaprobe/model/article_search/byline.dart';
import 'package:mediaprobe/model/article_search/headline.dart';
import 'package:mediaprobe/model/article_search/keywords.dart';
import 'package:mediaprobe/model/article_search/multimedia.dart';

class Docs {
  String? abstract;
  String? webUrl;
  String? snippet;
  String? leadParagraph;
  String? printSection;
  String? printPage;
  String? source;
  List<Multimedia>? multimedia;
  Headline? headline;
  List<Keywords>? keywords;
  String? pubDate;
  String? documentType;
  String? newsDesk;
  String? sectionName;
  String? subsectionName;
  Byline? byline;
  String? typeOfMaterial;
  String? sId;
  int? wordCount;
  String? uri;

  Docs(
      {this.abstract,
      this.webUrl,
      this.snippet,
      this.leadParagraph,
      this.printSection,
      this.printPage,
      this.source,
      this.multimedia,
      this.headline,
      this.keywords,
      this.pubDate,
      this.documentType,
      this.newsDesk,
      this.sectionName,
      this.subsectionName,
      this.byline,
      this.typeOfMaterial,
      this.sId,
      this.wordCount,
      this.uri});

  Docs.fromJson(Map<String, dynamic> json) {
    abstract = json['abstract'];
    webUrl = json['web_url'];
    snippet = json['snippet'];
    leadParagraph = json['lead_paragraph'];
    printSection = json['print_section'];
    printPage = json['print_page'];
    source = json['source'];
    if (json['multimedia'] != null) {
      multimedia = <Multimedia>[];
      json['multimedia'].forEach((v) {
        multimedia!.add(Multimedia.fromJson(v));
      });
    }
    headline = json['headline'] != null
        ? Headline.fromJson(json['headline'])
        : null;
    if (json['keywords'] != null) {
      keywords = <Keywords>[];
      json['keywords'].forEach((v) {
        keywords!.add(Keywords.fromJson(v));
      });
    }
    pubDate = json['pub_date'];
    documentType = json['document_type'];
    newsDesk = json['news_desk'];
    sectionName = json['section_name'];
    subsectionName = json['subsection_name'];
    byline =
        json['byline'] != null ? Byline.fromJson(json['byline']) : null;
    typeOfMaterial = json['type_of_material'];
    sId = json['_id'];
    wordCount = json['word_count'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['abstract'] = abstract;
    data['web_url'] = webUrl;
    data['snippet'] = snippet;
    data['lead_paragraph'] = leadParagraph;
    data['print_section'] = printSection;
    data['print_page'] = printPage;
    data['source'] = source;
    if (multimedia != null) {
      data['multimedia'] = multimedia!.map((v) => v.toJson()).toList();
    }
    if (headline != null) {
      data['headline'] = headline!.toJson();
    }
    if (keywords != null) {
      data['keywords'] = keywords!.map((v) => v.toJson()).toList();
    }
    data['pub_date'] = pubDate;
    data['document_type'] = documentType;
    data['news_desk'] = newsDesk;
    data['section_name'] = sectionName;
    data['subsection_name'] = subsectionName;
    if (byline != null) {
      data['byline'] = byline!.toJson();
    }
    data['type_of_material'] = typeOfMaterial;
    data['_id'] = sId;
    data['word_count'] = wordCount;
    data['uri'] = uri;
    return data;
  }
}
