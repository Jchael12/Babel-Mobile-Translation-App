import 'package:flutter/material.dart';

class TranName extends ChangeNotifier {
  late String text;

  String get name => text;

  void transtext(String newText) {
    newText = text;
    notifyListeners();
  }
}
