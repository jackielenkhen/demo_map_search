import 'package:demo_map_search/location_search_screen.dart';
import 'package:demo_map_search/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme(context),
      home: const SearchLocationScreen(),
    );
  }
}
