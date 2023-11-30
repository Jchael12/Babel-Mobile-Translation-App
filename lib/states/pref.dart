import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

setTermStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setBool('agreed', true);
}

Future<bool> getTermStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool? status = prefs.getBool('agreed') ?? false;
  return status;
}

class Check extends ChangeNotifier {
  bool isCheck = false;

  void setIsCheck(bool check) {
    isCheck = check;
    notifyListeners();
  }

  bool get isChecked => isCheck;
}
