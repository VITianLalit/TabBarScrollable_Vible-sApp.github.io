import 'package:flutter/material.dart';

class WalletScreenProvider with ChangeNotifier {
  int _selectedIndex = 2;
  int get selectedIndex => _selectedIndex;

  void setIndex(int val) {
    _selectedIndex = val;
    notifyListeners();
  }
}
