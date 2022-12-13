import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:motivai/models/folder.model.dart';
import 'package:motivai/utils/api.dart';

class FolderRepository {
  final Dio _dio = Dio();

  Future<List<FolderModel>> getFolders() async {
    var res = await _dio.get(
      Api.url('/folders/motivai'),
      options: buildCacheOptions(const Duration( days: 7))
    );

    var folders = (res.data['folders'] as List).map((item) => FolderModel.fromJson(item)).toList();

    return folders;
  }
}
