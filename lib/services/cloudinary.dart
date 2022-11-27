import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class Cloudinary {
  final _apiKey = '636848625318424';
  final _apiSecret = '3ycpqRv7RKK3m2dTOG8U4PXedbA';
  final _cloudName = 'c4co';
  final _dio = Dio();

  Cloudinary(){
    var baseUrl = 'https://$_apiKey:$_apiSecret@api.cloudinary.com/v1_1/$_cloudName';

    _dio.options.baseUrl = baseUrl;

    // adding interceptor
    // _dio.interceptors.add(DioCacheManager( CacheConfig(baseUrl: baseUrl)).interceptor);
  }

  getImages() async{
    return _dio.post(
      '/resources/search',
      options: buildCacheOptions(const Duration( days: 7 )),
      data: {
        "expression": "folder:motivai/*"
      }
    );
  }

  getFolder() async {
    return _dio.get(
      '/folders/motivai',
      options: buildCacheOptions(const Duration( days: 7))
    );
  }
}
