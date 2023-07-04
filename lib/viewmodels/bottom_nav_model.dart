import 'package:flutter/material.dart';

class BottomNavModel extends ChangeNotifier {
  int currentIndex = 0;
  setNewIndex(newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
