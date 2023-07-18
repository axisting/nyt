import 'package:mediaprobe/model/article_search/legacy.dart';

class Multimedia {
  int? rank;
  String? subtype;
  String? caption;
  String? credit;
  String? type;
  String? url;
  int? height;
  int? width;
  Legacy? legacy;
  String? subType;
  String? cropName;

  Multimedia(
      {this.rank,
      this.subtype,
      this.caption,
      this.credit,
      this.type,
      this.url,
      this.height,
      this.width,
      this.legacy,
      this.subType,
      this.cropName});

  Multimedia.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    subtype = json['subtype'];
    caption = json['caption'];
    credit = json['credit'];
    type = json['type'];
    url = json['url'];
    height = json['height'];
    width = json['width'];
    legacy =
        json['legacy'] != null ? Legacy.fromJson(json['legacy']) : null;
    subType = json['subType'];
    cropName = json['crop_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rank'] = rank;
    data['subtype'] = subtype;
    data['caption'] = caption;
    data['credit'] = credit;
    data['type'] = type;
    data['url'] = url;
    data['height'] = height;
    data['width'] = width;
    if (legacy != null) {
      data['legacy'] = legacy!.toJson();
    }
    data['subType'] = subType;
    data['crop_name'] = cropName;
    return data;
  }
}