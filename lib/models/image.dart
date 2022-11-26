class ImageModel{
  String url;
  String secureUrl;
  String folder;

  ImageModel({
    required this.url,
    required this.secureUrl,
    required this.folder
  });

  factory ImageModel.fromJson(Map<String, dynamic> json){
    return ImageModel(
      url: json['url'],
      secureUrl: json['secure_url'],
      folder: json['folder'],
    );
  }
}
