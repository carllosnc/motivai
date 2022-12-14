import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:motivai/models/folder.model.dart';
import 'package:motivai/repositories/repository.dart';

class FolderRepository extends Repository {
  Future<List<FolderModel>> getFolders() async {
    var res = await dio.get(
      '/folders/motivai',
      options: buildCacheOptions(const Duration( days: 7))
    );

    List<FolderModel> folders = [];

    for (var item in res.data['folders']) {
      folders.add(FolderModel.fromJson(item));
    }

    return folders;
  }
}
