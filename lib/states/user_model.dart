class User {
  String id;
  final String text;
  final String translatedText;
  final date;
  final time;

  User(
      {this.id = '',
      required this.text,
      required this.translatedText,
      required this.date,
      required this.time});

  // create fields and add to firestore database
  Map<String, dynamic> toJson() => {
        'id': id,
        'fromTranslate': text,
        'translated': translatedText,
        'date': date,
        'time': time,
      };

  // retrieve fields -> key & values
  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      text: json['fromTranslate'],
      translatedText: json['translated'],
      date: json['date'],
      time: json['time'],
      );
      
}
