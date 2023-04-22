import 'package:flutter/foundation.dart';
import '/domain/domain.dart';

class HomeController {
  static final instance = HomeController._();
  HomeController._();

  dynamic category = ValueNotifier<Folder>(
    Folder(
      name: 'Tudo',
      path: 'motivai/*',
    ),
  );

  setCategory(Folder value) {
    category.value = value;
  }
}
