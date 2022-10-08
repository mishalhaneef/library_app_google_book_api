import 'package:flutter/cupertino.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int selectedIndex = 0;

  changeNavigation(newIndex) {
    selectedIndex = newIndex;
    notifyListeners();
  }
}
