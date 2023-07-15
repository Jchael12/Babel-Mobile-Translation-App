import 'package:flutter/material.dart';

class ShowState extends ChangeNotifier {

  bool show = true;
  bool canSwipe = true;

  bool get isShowed => show;
  bool get canSwipeBack => canSwipe;

  void setShow(bool stateShow){
    show = stateShow;
    notifyListeners();
  }
  
  void setSwipeState(bool state){
    canSwipe = state;
    notifyListeners();
  }
}