class RegisterModelParams {
  String voterId;
  String aadhaarCard;
  String name;
  String gender;
  String dob;
  String guardianName;
  String relation;
  String mobile;
  String email;
  String stateId;
  String districtId;
  String tehsilId;
  String blockId;
  String area;
  String parliamentaryId;
  String assemblyId;
  String cityVillage;
  String ward;
  String locality;
  String houseNo;
  // String landMark;
  String pincode;
  String municipalityId;

  RegisterModelParams(
      {required this.voterId,
      required this.aadhaarCard,
      required this.name,
      required this.gender,
      required this.dob,
      required this.guardianName,
      required this.relation,
      required this.mobile,
      required this.email,
      required this.stateId,
      required this.districtId,
      required this.tehsilId,
      required this.blockId,
      required this.area,
      required this.parliamentaryId,
      required this.assemblyId,
      required this.cityVillage,
      required this.ward,
      required this.locality,
      required this.houseNo,
      // required this.landMark,
      required this.pincode,
      required this.municipalityId});

  RegisterModelParams.fromJson(
      Map<String, dynamic> json,
      this.voterId,
      this.aadhaarCard,
      this.name,
      this.gender,
      this.dob,
      this.guardianName,
      this.relation,
      this.mobile,
      this.email,
      this.stateId,
      this.districtId,
      this.tehsilId,
      this.blockId,
      this.area,
      this.parliamentaryId,
      this.assemblyId,
      this.cityVillage,
      this.ward,
      this.locality,
      this.houseNo,
      this.municipalityId,
      // this.landMark,
      this.pincode) {
    voterId = json['voter_id'];
    aadhaarCard = json['aadhaar_card'];
    name = json['name'];
    gender = json['gender'];
    dob = json['dob'];
    guardianName = json['guardian_name'];
    relation = json['relation'];
    mobile = json['mobile'];
    email = json['email'];
    stateId = json['state_id'];
    districtId = json['district_id'];
    tehsilId = json['tehsil_id'];
    blockId = json['block_id'];
    area = json['area'];
    parliamentaryId = json['parliamentary_id'];
    assemblyId = json['assembly_id'];
    cityVillage = json['city_village'];
    ward = json['ward'];
    locality = json['locality'];
    houseNo = json['house_no'];
    // landMark = json['land_mark'];
    pincode = json['pincode'];
    municipalityId = json['municipalityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['voter_id'] = voterId;
    data['aadhaar_card'] = aadhaarCard;
    data['name'] = name;
    data['gender'] = gender;
    data['dob'] = dob;
    data['guardian_name'] = guardianName;
    data['relation'] = relation;
    data['mobile'] = mobile;
    data['email'] = email;
    data['state_id'] = stateId;
    data['district_id'] = districtId;
    data['tehsil_id'] = tehsilId;
    data['block_id'] = blockId;
    data['area'] = area;
    data['parliamentary_id'] = parliamentaryId;
    data['assembly_id'] = assemblyId;
    data['city_village'] = cityVillage;
    data['ward'] = ward;
    data['locality'] = locality;
    data['house_no'] = houseNo;
    // data['land_mark'] = landMark;
    data['pincode'] = pincode;
    data['municipality_id'] = municipalityId;
    return data;
  }
}
