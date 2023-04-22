import 'package:dio/dio.dart';

class Repository {
  final _apiKey = '636848625318424';
  final _apiSecret = '3ycpqRv7RKK3m2dTOG8U4PXedbA';
  final _cloudName = 'c4co';
  final Dio httpClient = Dio();

  Repository() {
    httpClient.options.baseUrl =
        'https://$_apiKey:$_apiSecret@api.cloudinary.com/v1_1/$_cloudName';
  }
}
