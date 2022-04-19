class Config {
  bool theme;
  String language;
  Config({this.theme, this.language});
  factory Config.fromMap(Map<dynamic, dynamic> map) {
    return Config(
      theme: map['theme'],
      language: map['language'],
    );
  }
    Map toJson() => {
        'theme': theme,
        'language': language,
    
      };
}
