class Legacy {
  String? xlarge;
  int? xlargewidth;
  int? xlargeheight;
  String? thumbnail;
  int? thumbnailwidth;
  int? thumbnailheight;
  int? widewidth;
  int? wideheight;
  String? wide;

  Legacy(
      {this.xlarge,
      this.xlargewidth,
      this.xlargeheight,
      this.thumbnail,
      this.thumbnailwidth,
      this.thumbnailheight,
      this.widewidth,
      this.wideheight,
      this.wide});

  Legacy.fromJson(Map<String, dynamic> json) {
    xlarge = json['xlarge'];
    xlargewidth = json['xlargewidth'];
    xlargeheight = json['xlargeheight'];
    thumbnail = json['thumbnail'];
    thumbnailwidth = json['thumbnailwidth'];
    thumbnailheight = json['thumbnailheight'];
    widewidth = json['widewidth'];
    wideheight = json['wideheight'];
    wide = json['wide'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['xlarge'] = xlarge;
    data['xlargewidth'] = xlargewidth;
    data['xlargeheight'] = xlargeheight;
    data['thumbnail'] = thumbnail;
    data['thumbnailwidth'] = thumbnailwidth;
    data['thumbnailheight'] = thumbnailheight;
    data['widewidth'] = widewidth;
    data['wideheight'] = wideheight;
    data['wide'] = wide;
    return data;
  }
}