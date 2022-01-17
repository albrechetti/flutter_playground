import 'package:flutter/material.dart';
import 'package:flutter_playground/isolate/isolate_counter.dart';

void main() {
  runApp(
    MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: const CounterApp(),
    ),
  );
}
