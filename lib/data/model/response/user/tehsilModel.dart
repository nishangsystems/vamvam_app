class TehsilModel {
  String? code;
  String? message;
  List<TehsilModelData>? data;

  TehsilModel({this.code, this.message, this.data});

  TehsilModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TehsilModelData>[];
      json['data'].forEach((v) {
        data!.add(TehsilModelData.fromJson(v));
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

class TehsilModelData {
  String? id;
  String? stateId;
  String? districtId;
  String? name;

  TehsilModelData({this.id, this.stateId, this.districtId, this.name});

  TehsilModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stateId = json['state_id'];
    districtId = json['district_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['state_id'] = stateId;
    data['district_id'] = districtId;
    data['name'] = name;
    return data;
  }
}
