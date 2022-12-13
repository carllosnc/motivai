class Api {
  static const _apiKey = '636848625318424';
  static const _apiSecret = '3ycpqRv7RKK3m2dTOG8U4PXedbA';
  static const _cloudName = 'c4co';

  static url(String path){
    return 'https://$_apiKey:$_apiSecret@api.cloudinary.com/v1_1/$_cloudName$path';
  }
}
