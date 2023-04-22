class Folder {
  String path;
  String name;

  Folder({
    required this.path,
    required this.name,
  });

  factory Folder.fromJson(Map<String, dynamic> json) {
    return Folder(
      path: json['path'],
      name: json['name'],
    );
  }
}
