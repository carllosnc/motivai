import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/utils/colors.dart';
import 'app.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: ProjectColors.main,
      statusBarColor: ProjectColors.main,
    ),
  );

  runApp(const App());
}
