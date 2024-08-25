class School {
  final String name;
  String? location;
  String? color;
  String? logo_path;
  String? api_root;

  School(
      {required this.name,
      this.location,
      this.color,
      this.logo_path,
      this.api_root});

  factory School.fromJson(Map<String, dynamic> json) {
    return School(
      name: json['name'],
      location: json['location'],
      color: json['color'],
      logo_path: json['logo_path'],
      api_root: json['api_root'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'location': location,
      'color': color,
      'logo_path': logo_path,
      'api_root': api_root,
    };
  }
}
