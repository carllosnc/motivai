import 'package:flutter/material.dart';
import 'screens/home.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    title: 'Motivai',
    theme: ThemeData(
      fontFamily: 'Quicksand',
    ),
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
  ));
}
