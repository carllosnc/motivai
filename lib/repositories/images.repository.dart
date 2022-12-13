import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:motivai/models/image.model.dart';
import 'package:motivai/utils/api.dart';

class ImagesRepository {
  final Dio _dio = Dio();

  Future<List<ImageModel>> getImages({ String path = 'motivai/*' }) async{
    var res = await _dio.post(
      Api.url('/resources/search'),
      options: buildCacheOptions(const Duration( days: 7 )),
      data: {
        "expression": "folder:$path"
      }
    );

    List<ImageModel> images = (res.data['resources'] as List).map((item) => ImageModel.fromJson(item)).toList();

    return images;
  }
}