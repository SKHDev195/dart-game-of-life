import 'package:flutter/material.dart';

final class ThemeRepository {
  late ThemeData appTheme;

  void setTheme({
    required ThemeData appTheme,
  }) {
    this.appTheme = appTheme;
  }
}
