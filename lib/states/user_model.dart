
// TODO: need to add field for date and time
class User {
  String id;
  final String text;
  final String translatedText;

  User({this.id = '', required this.text, required this.translatedText});

  // create fields and add to firestore database
  Map<String, dynamic> toJson() => {
        'id': id,
        'fromTranslate': text,
        'translated': translatedText,
      };

  // retrieve fields -> key & values
  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      text: json['fromTranslate'],
      translatedText: json['translated']);

}