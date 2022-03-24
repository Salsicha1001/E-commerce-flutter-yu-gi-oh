
class CardList {
  int id;
  String name;
  String imageSmall;

  CardList({this.id, this.name, this.imageSmall});

  factory CardList.fromJson(Map<String, dynamic> json) {
    return CardList(
      id: json['id'],
      name: json['name'] as String,
      imageSmall: json['imageSmall'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["imageSmall"] = this.imageSmall;
    return data;
  }

}
