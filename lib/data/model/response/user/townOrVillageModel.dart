class TownOrVillageModel {
  String? code;
  String? message;
  List<TownOrVillageModelData>? data;

  TownOrVillageModel({this.code, this.message, this.data});

  TownOrVillageModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TownOrVillageModelData>[];
      json['data'].forEach((v) {
        data!.add(TownOrVillageModelData.fromJson(v));
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

class TownOrVillageModelData {
  String? id;
  String? stateId;
  String? districtId;
  String? tehsilId;
  String? name;

  TownOrVillageModelData(
      {this.id, this.stateId, this.districtId, this.tehsilId, this.name});

  TownOrVillageModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stateId = json['state_id'];
    districtId = json['district_id'];
    tehsilId = json['tehsil_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['state_id'] = stateId;
    data['district_id'] = districtId;
    data['tehsil_id'] = tehsilId;
    data['name'] = name;
    return data;
  }
}
