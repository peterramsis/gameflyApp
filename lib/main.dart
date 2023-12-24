import 'package:flutter/material.dart';
import 'package:gamefly/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gamefly',
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}
