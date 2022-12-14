import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:motivai/models/folder.model.dart';
import 'package:motivai/services/cloudinary.service.dart';

class FolderRepository {
  final Dio _dio = Dio();
  final cloudinary = Cloudinary();

  Future<List<FolderModel>> getFolders() async {
    var res = await _dio.get(
      cloudinary.service('/folders/motivai'),
      options: buildCacheOptions(const Duration( days: 7))
    );

    List<FolderModel> folders = [];

    for (var item in res.data['folders']) {
      folders.add(FolderModel.fromJson(item));
    }

    return folders;
  }
}
