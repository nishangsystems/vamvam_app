class DepartmentModel {
  String? code;
  String? message;
  List<DepartmentModelData>? data;

  DepartmentModel({this.code, this.message, this.data});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DepartmentModelData>[];
      json['data'].forEach((v) {
        data!.add(DepartmentModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DepartmentModelData {
  String? id;
  String? name;

  DepartmentModelData({this.id, this.name});

  DepartmentModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
