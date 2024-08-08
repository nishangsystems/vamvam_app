class WardModel {
  String? code;
  String? message;
  List<WardModelData>? data;

  WardModel({this.code, this.message, this.data});

  WardModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <WardModelData>[];
      json['data'].forEach((v) {
        data!.add(WardModelData.fromJson(v));
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

class WardModelData {
  String? id;
  String? stateId;
  String? districtId;
  String? tehsilId;
  String? municipalityId;
  String? name;

  WardModelData(
      {this.id,
      this.stateId,
      this.districtId,
      this.tehsilId,
      this.municipalityId,
      this.name});

  WardModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stateId = json['state_id'];
    districtId = json['district_id'];
    tehsilId = json['tehsil_id'];
    municipalityId = json['municipality_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['state_id'] = stateId;
    data['district_id'] = districtId;
    data['tehsil_id'] = tehsilId;
    data['municipality_id'] = municipalityId;
    data['name'] = name;
    return data;
  }
}
