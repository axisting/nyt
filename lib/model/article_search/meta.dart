class Meta {
  int? hits;
  int? offset;
  int? time;

  Meta({this.hits, this.offset, this.time});

  Meta.fromJson(Map<String, dynamic> json) {
    hits = json['hits'];
    offset = json['offset'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hits'] = hits;
    data['offset'] = offset;
    data['time'] = time;
    return data;
  }
}