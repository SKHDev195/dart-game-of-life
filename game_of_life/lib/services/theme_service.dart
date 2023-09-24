import 'package:flutter/widgets.dart';

class ThemeService extends ChangeNotifier {
  bool isDark = false;

  void toggleLight() {
    isDark = false;
    notifyListeners();
  }

  void toggleDark() {
    isDark = true;
    notifyListeners();
  }

  void toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
