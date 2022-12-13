import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motivai/utils/colors.dart';
import 'package:motivai/screens/home.screen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: ProjectColors.main,
      statusBarColor: ProjectColors.main
    )
  );

  runApp(MaterialApp(
    title: 'Motivai',
    theme: ThemeData(
      textTheme: GoogleFonts.robotoTextTheme()
    ),
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
  ));
}
