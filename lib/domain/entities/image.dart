class ImageEntity {
  String url;
  String secureUrl;
  String folder;

  ImageEntity({
    required this.url,
    required this.secureUrl,
    required this.folder,
  });

  factory ImageEntity.fromJson(Map<String, dynamic> json) {
    return ImageEntity(
      url: json['url'],
      secureUrl: json['secure_url'],
      folder: json['folder'],
    );
  }
}
