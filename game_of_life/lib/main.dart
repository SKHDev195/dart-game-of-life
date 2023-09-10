import 'package:flutter/material.dart';
import 'package:game_of_life/pages/setup_page/setup_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Colored Grid Example'),
        ),
        body: const Center(
          child: SetupPage(),
        ),
      ),
    ),
  );
}
