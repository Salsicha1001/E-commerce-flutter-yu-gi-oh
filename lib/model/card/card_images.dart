class CardsImage {
  int id;
  String image_url;
  String image_url_small;

  CardsImage({this.id, this.image_url, this.image_url_small});
  factory CardsImage.fromJson(Map<String, dynamic> json) {
    return CardsImage(
      id: json['id'] ,
      image_url: json['image_url'] as String,
      image_url_small: json['image_url_small'] as String,
  
    );
  }

    Map<String, dynamic> toJson() => {
        "id": id,
        "image_url": image_url,
        "image_url_small": image_url_small,
    };


}
