class ParlimentaryModel {
  String? code;
  String? message;
  List<ParlimentaryModelData>? data;

  ParlimentaryModel({this.code, this.message, this.data});

  ParlimentaryModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ParlimentaryModelData>[];
      json['data'].forEach((v) {
        data!.add(ParlimentaryModelData.fromJson(v));
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

class ParlimentaryModelData {
  String? id;
  String? stateId;
  String? name;

  ParlimentaryModelData({this.id, this.stateId, this.name});

  ParlimentaryModelData.fromJson(Map<String, dynamic> json) {
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
