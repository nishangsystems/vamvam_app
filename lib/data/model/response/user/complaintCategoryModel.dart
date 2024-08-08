class ComplaintCategoryModel {
  String? code;
  String? message;
  List<ComplaintCategoryModel>? data;

  ComplaintCategoryModel({this.code, this.message, this.data});

  ComplaintCategoryModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ComplaintCategoryModel>[];
      json['data'].forEach((v) {
        data!.add(ComplaintCategoryModel.fromJson(v));
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

class ComplaintCategoryModelData {
  String? id;
  String? name;

  ComplaintCategoryModelData({this.id, this.name});

  ComplaintCategoryModelData.fromJson(Map<String, dynamic> json) {
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
