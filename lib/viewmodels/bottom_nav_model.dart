import 'package:flutter/material.dart';

class BottomNavModel extends ChangeNotifier {
  String initialRoute = "home";
  int currentIndex = 0;
  setNewIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }

  setNewInitialRoute(String newRoute) {
    initialRoute = newRoute;
    notifyListeners();
  }
}
