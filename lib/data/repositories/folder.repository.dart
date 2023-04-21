import 'package:dio_http_cache/dio_http_cache.dart';
import '../../domain/entities/folder.dart';
import '/data/repositories/repository.dart';

class FolderRepository extends Repository {
  Future<List<FolderModel>> getFolders() async {
    var res = await httpClient.get(
      '/folders/motivai',
      options: buildCacheOptions(
        const Duration(days: 7),
      ),
    );

    List<FolderModel> folders = [];

    for (var item in res.data['folders']) {
      folders.add(FolderModel.fromJson(item));
    }

    return folders;
  }
}
