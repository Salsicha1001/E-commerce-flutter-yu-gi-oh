class CardList {
  int id;
  String name;
  String imageSmall;
  String archetype;

  CardList({this.id, this.name, this.imageSmall, this.archetype});

  factory CardList.fromJson(Map<String, dynamic> json) {
    return CardList(
      id: json['id'],
      name: json['name'] as String,
      imageSmall: json['imageSmall'] as String,
      archetype: json['archetype'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["imageSmall"] = this.imageSmall;
    data["archetype"] = this.archetype;
    return data;
  }
}
