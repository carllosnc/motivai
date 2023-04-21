import 'package:flutter/foundation.dart';
import '../../domain/entities/folder.dart';

class HomeController {
  static final instance = HomeController._();
  HomeController._();

  dynamic category = ValueNotifier<FolderModel>(
    FolderModel(
      name: 'Tudo',
      path: 'motivai/*',
    ),
  );

  setCategory(FolderModel value) {
    category.value = value;
  }
}
