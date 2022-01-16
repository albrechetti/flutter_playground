import 'package:flutter/material.dart';
import 'package:flutter_playground/isolate/isolate_counter.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CounterApp(),
  ));
}
