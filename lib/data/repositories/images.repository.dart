import 'package:dio_http_cache/dio_http_cache.dart';
import '../../domain/entities/image.dart';
import '/data/repositories/repository.dart';

class ImagesRepository extends Repository {
  Future<List<ImageModel>> getImages({String path = 'motivai/*'}) async {
    var res = await httpClient.post(
      '/resources/search',
      data: {"expression": "folder:$path"},
      options: buildCacheOptions(const Duration(days: 7)),
    );

    List<ImageModel> images = [];

    for (var item in (res.data['resources'] as List)) {
      images.add(ImageModel.fromJson(item));
    }

    return images;
  }
}
