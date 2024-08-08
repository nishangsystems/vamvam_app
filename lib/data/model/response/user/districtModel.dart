class DistrictModel {
  String? code;
  String? message;
  List<DistrictModelData>? data;

  DistrictModel({this.code, this.message, this.data});

  DistrictModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DistrictModelData>[];
      json['data'].forEach((v) {
        data!.add(DistrictModelData.fromJson(v));
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

class DistrictModelData {
  String? id;
  String? stateId;
  String? name;

  DistrictModelData({this.id, this.stateId, this.name});

  DistrictModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stateId = json['state_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['state_id'] = stateId;
    data['name'] = name;
    return data;
  }
}
