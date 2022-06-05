
import 'package:flutter/material.dart';

class BottomNavViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int value) {
    _currentIndex = value;
    print('currentIndex: $_currentIndex');
    notifyListeners();
  }

// int _bottomNavIndex = 0;
// int get bottomNavIndex => _bottomNavIndex;
// set bottomNavIndex(int value) {
//   _bottomNavIndex = value;
//   print('bottomNavIndex: $_bottomNavIndex');
//   notifyListeners();
// }
}