import 'package:flutter/foundation.dart';
import '/models/folder.model.dart';

class HomeController {
  static final instance = HomeController._();
  HomeController._();

  dynamic category = ValueNotifier<FolderModel>(FolderModel(
    name: 'Tudo',
    path: 'motivai/*'
  ));

  setCategory(FolderModel value){
    category.value = value;
  }
}
