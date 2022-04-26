class FilterCardRequest {
  String type;
  String race;
  String attribute;
  String fname;

  FilterCardRequest({this.type, this.race, this.attribute, this.fname});

  factory FilterCardRequest.fromJson(Map<String, dynamic> json) {
    return FilterCardRequest(
      type: json['type'],
      race: json['race'] as String,
      attribute: json['attribute'] as String,
      fname: json['fname'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "race": race,
        "attribute": attribute,
        "fname": fname,
      };
}
