import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './pages/pages.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motivai',
      theme: ThemeData(textTheme: GoogleFonts.robotoTextTheme()),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
