class School {
  final String name;
  final String id;
  String? location;
  String? color;
  String? logo_path;
  String? api_root;

  School(
      {required this.name, required this.id,
      this.location,
      this.color,
      this.logo_path,
      this.api_root});

  factory School.fromJson(Map<String, dynamic> json) {
    return School(
      id: json['id'].toString(),
      name: json['name'],
      location: json['location'],
      color: json['color'],
      logo_path: json['logo_path'],
      api_root: json['api_root'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'color': color,
      'logo_path': logo_path,
      'api_root': api_root,
    };
  }
}
