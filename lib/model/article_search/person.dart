class Person {
  String? firstname;
  String? middlename;
  String? lastname;
  String? qualifier;
  String? title;
  String? role;
  String? organization;
  int? rank;

  Person(
      {this.firstname,
      this.middlename,
      this.lastname,
      this.qualifier,
      this.title,
      this.role,
      this.organization,
      this.rank});

  Person.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    middlename = json['middlename'];
    lastname = json['lastname'];
    qualifier = json['qualifier'];
    title = json['title'];
    role = json['role'];
    organization = json['organization'];
    rank = json['rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstname'] = firstname;
    data['middlename'] = middlename;
    data['lastname'] = lastname;
    data['qualifier'] = qualifier;
    data['title'] = title;
    data['role'] = role;
    data['organization'] = organization;
    data['rank'] = rank;
    return data;
  }
}

