class LevelModel {
  int? id;
  String? level;
  String? createAt;
  String? updatedAt;

  LevelModel({this.id, this.level, this.createAt, this.updatedAt});

  LevelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    createAt = json['create_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['level'] = level;
    data['create_at'] = createAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
