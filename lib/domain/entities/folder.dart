class FolderModel {
  String path;
  String name;

  FolderModel({
    required this.path,
    required this.name,
  });

  factory FolderModel.fromJson(Map<String, dynamic> json) {
    return FolderModel(
      path: json['path'],
      name: json['name'],
    );
  }
}
