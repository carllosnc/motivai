import 'package:dio_http_cache/dio_http_cache.dart';
import '/domain/domain.dart';
import '/data/data.dart';

class ImagesRepository extends Repository {
  Future<List<ImageEntity>> getImages({String path = 'motivai/*'}) async {
    var res = await httpClient.post(
      '/resources/search',
      data: {"expression": "folder:$path"},
      options: buildCacheOptions(const Duration(days: 7)),
    );

    return (res.data['resources'] as List)
        .map((e) => ImageEntity.fromJson(e))
        .toList();
  }
}
