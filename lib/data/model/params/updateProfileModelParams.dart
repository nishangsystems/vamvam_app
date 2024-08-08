class UpdateProfileModelParams {
  String? voterId;
  String? aadhaarCard;
  String? name;
  String? gender;
  String? dob;
  String? guardianName;
  String? relation;
  String? mobile;
  String? email;
  String? stateId;
  String? districtId;
  String? tehsilId;
  String? area;
  String? parliamentaryId;
  String? assemblyId;
  String? townVillageId;
  String? panchayatWardId;
  String? blockId;
  String? thanaId;
  String? postOfficeId;
  String? locality;
  String? houseNo;
  String? landMark;
  String? pincode;
  String? userId;

  UpdateProfileModelParams(
      {this.voterId,
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
      this.area,
      this.parliamentaryId,
      this.assemblyId,
      this.townVillageId,
      this.panchayatWardId,
      this.blockId,
      this.thanaId,
      this.postOfficeId,
      this.locality,
      this.houseNo,
      this.landMark,
      this.pincode,
      this.userId});

  UpdateProfileModelParams.fromJson(Map<String, dynamic> json) {
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
    area = json['area'];
    parliamentaryId = json['parliamentary_id'];
    assemblyId = json['assembly_id'];
    townVillageId = json['town_village_id'];
    panchayatWardId = json['panchayat_ward_id'];
    blockId = json['block_id'];
    thanaId = json['thana_id'];
    postOfficeId = json['post_office_id'];
    locality = json['locality'];
    houseNo = json['house_no'];
    landMark = json['land_mark'];
    pincode = json['pincode'];
    userId = json['user_id'];
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
    data['area'] = area;
    data['parliamentary_id'] = parliamentaryId;
    data['assembly_id'] = assemblyId;
    data['town_village_id'] = townVillageId;
    data['panchayat_ward_id'] = panchayatWardId;
    data['block_id'] = blockId;
    data['thana_id'] = thanaId;
    data['post_office_id'] = postOfficeId;
    data['locality'] = locality;
    data['house_no'] = houseNo;
    data['land_mark'] = landMark;
    data['pincode'] = pincode;
    data['user_id'] = userId;
    return data;
  }
}
