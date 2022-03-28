class Users {
  int? id;
  String? title;
  String? image;
  String? rent;

  Users({this.id, this.title, this.image, this.rent});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    rent = json['rent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['rent'] = rent;
    return data;
  }
}
