import 'package:dio/dio.dart';
import '../services/cloudinary.service.dart';

class Repository {
  final Dio httpClient = Dio();
  final cloudinary = Cloudinary();

  Repository() {
    httpClient.options.baseUrl = cloudinary.baseUrl;
  }
}
