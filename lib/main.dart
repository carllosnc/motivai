import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    title: 'Motivai',
    theme: ThemeData(
      textTheme: GoogleFonts.robotoTextTheme()
    ),
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
  ));
}
