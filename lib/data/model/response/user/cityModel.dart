class CityModel {
  String? code;
  String? message;
  List<CityModelData>? data;

  CityModel({this.code, this.message, this.data});

  CityModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CityModelData>[];
      json['data'].forEach((v) {
        data!.add(CityModelData.fromJson(v));
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

class CityModelData {
  String? id;
  String? stateId;
  String? districtId;
  String? tehsilId;
  String? blockId;
  String? name;

  CityModelData(
      {this.id,
      this.stateId,
      this.districtId,
      this.tehsilId,
      this.blockId,
      this.name});

  CityModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stateId = json['state_id'];
    districtId = json['district_id'];
    tehsilId = json['tehsil_id'];
    blockId = json['block_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['state_id'] = stateId;
    data['district_id'] = districtId;
    data['tehsil_id'] = tehsilId;
    data['block_id'] = blockId;
    data['name'] = name;
    return data;
  }
}
