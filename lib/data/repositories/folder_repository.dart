import 'package:dio_http_cache/dio_http_cache.dart';
import '/domain/domain.dart';
import '/data/data.dart';

class FolderRepository extends Repository {
  Future<List<Folder>> getFolders() async {
    var res = await httpClient.get(
      '/folders/motivai',
      options: buildCacheOptions(
        const Duration(days: 7),
      ),
    );

    return res.data['folders']
        .map<Folder>((folder) => Folder.fromJson(folder))
        .toList();
  }
}
