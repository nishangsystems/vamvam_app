class WardModelParams {
  String stateId;
  String districtId;
  String tehsilId;
  String municipalityId;

  WardModelParams(
      {required this.stateId,
      required this.districtId,
      required this.tehsilId,
      required this.municipalityId});

  WardModelParams.fromJson(Map<String, dynamic> json, this.stateId,
      this.districtId, this.tehsilId, this.municipalityId) {
    stateId = json['state_id'];
    districtId = json['district_id'];
    tehsilId = json['tehsil_id'];
    municipalityId = json['municipality_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['state_id'] = stateId;
    data['district_id'] = districtId;
    data['tehsil_id'] = tehsilId;
    data['municipality_id'] = municipalityId;
    return data;
  }
}
