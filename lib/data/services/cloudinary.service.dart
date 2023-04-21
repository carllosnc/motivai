class Cloudinary {
  final _apiKey = '636848625318424';
  final _apiSecret = '3ycpqRv7RKK3m2dTOG8U4PXedbA';
  final _cloudName = 'c4co';
  var baseUrl = '';

  Cloudinary() {
    baseUrl =
        'https://$_apiKey:$_apiSecret@api.cloudinary.com/v1_1/$_cloudName';
  }

  service(String path) {
    return '$baseUrl$path';
  }
}
