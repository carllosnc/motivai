import 'package:flutter_test/flutter_test.dart';
import 'package:motivai/services/cloudinary.dart';
import 'package:motivai/models/image.dart';
import 'package:motivai/models/folder.dart';

void main() {
  var cloudinary = Cloudinary();

  test('check Image model', () async {
    var res = await cloudinary.getImages();
    var images = (res.data['resources'] as List).map((item) => ImageModel.fromJson(item)).toList();

    for (var item in images) {
      expect(item.runtimeType.toString(), 'ImageModel');
    }
  });

  test('check Folder model', () async {
    var res = await cloudinary.getFolder();
    var folders = (res.data['folders'] as List).map((item) =>  FolderModel.fromJson(item)).toList();

    for (var item in folders) {
      expect(item.runtimeType.toString(), 'FolderModel');
    }
  });
}
