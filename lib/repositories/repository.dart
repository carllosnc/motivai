import 'package:dio/dio.dart';
import 'package:motivai/services/cloudinary.service.dart';

class Repository {
  final Dio dio = Dio();
  final cloudinary = Cloudinary();

  Repository(){
    dio.options.baseUrl = cloudinary.baseUrl;
  }
}
