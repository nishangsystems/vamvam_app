class UserProfileModelData {
  String? executiveId;
  String? executiveUniqueId;
  String? leaderId;
  String? leaderUniqueId;
  String? userId;
  String? isProfileComplete;
  String? userUniqueId;
  String? apiToken;
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
  String? stateName;
  String? districtId;
  String? districtName;
  String? tehsilId;
  String? tehsilName;
  String? area;
  String? parliamentaryId;
  String? parliamentaryName;
  String? assemblyId;
  String? assemblyName;
  String? townVillageId;
  String? townVillageName;
  String? panchayatWardId;
  String? panchayatWardName;
  String? blockId;
  String? blockName;
  String? thanaId;
  String? thanaName;
  String? postOfficeId;
  String? postOfficeName;
  String? locality;
  String? houseNo;
  String? landMark;
  String? pincode;

  UserProfileModelData({
    this.userId,
    this.isProfileComplete,
    this.userUniqueId,
    this.apiToken,
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
    this.stateName,
    this.districtId,
    this.districtName,
    this.tehsilId,
    this.tehsilName,
    this.area,
    this.parliamentaryId,
    this.parliamentaryName,
    this.assemblyId,
    this.assemblyName,
    this.townVillageId,
    this.townVillageName,
    this.panchayatWardId,
    this.panchayatWardName,
    this.blockId,
    this.blockName,
    this.thanaId,
    this.thanaName,
    this.postOfficeId,
    this.postOfficeName,
    this.locality,
    this.houseNo,
    this.landMark,
    this.pincode,
    this.executiveId,
    this.executiveUniqueId,
    this.leaderId,
    this.leaderUniqueId,
  });

  UserProfileModelData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    isProfileComplete = json['is_profile_complete'];
    userUniqueId = json['user_unique_id'];
    apiToken = json['api_token'];
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
    stateName = json['state_name'];
    districtId = json['district_id'];
    districtName = json['district_name'];
    tehsilId = json['tehsil_id'];
    tehsilName = json['tehsil_name'];
    area = json['area'];
    parliamentaryId = json['parliamentary_id'];
    parliamentaryName = json['parliamentary_name'];
    assemblyId = json['assembly_id'];
    assemblyName = json['assembly_name'];
    townVillageId = json['town_village_id'];
    townVillageName = json['town_village_name'];
    panchayatWardId = json['panchayat_ward_id'];
    panchayatWardName = json['panchayat_ward_name'];
    blockId = json['block_id'];
    blockName = json['block_name'];
    thanaId = json['thana_id'];
    thanaName = json['thana_name'];
    postOfficeId = json['post_office_id'];
    postOfficeName = json['post_office_name'];
    locality = json['locality'];
    houseNo = json['house_no'];
    landMark = json['land_mark'];
    pincode = json['pincode'];
    executiveId = json['executive_id'];
    executiveUniqueId = json['executive_unique_id'];
    leaderId = json['leader_id'];
    leaderUniqueId = json['leader_unique_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['is_profile_complete'] = this.isProfileComplete;
    data['user_unique_id'] = this.userUniqueId;
    data['api_token'] = this.apiToken;
    data['voter_id'] = this.voterId;
    data['aadhaar_card'] = this.aadhaarCard;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['guardian_name'] = this.guardianName;
    data['relation'] = this.relation;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['state_id'] = this.stateId;
    data['state_name'] = this.stateName;
    data['district_id'] = this.districtId;
    data['district_name'] = this.districtName;
    data['tehsil_id'] = this.tehsilId;
    data['tehsil_name'] = this.tehsilName;
    data['area'] = this.area;
    data['parliamentary_id'] = this.parliamentaryId;
    data['parliamentary_name'] = this.parliamentaryName;
    data['assembly_id'] = this.assemblyId;
    data['assembly_name'] = this.assemblyName;
    data['town_village_id'] = this.townVillageId;
    data['town_village_name'] = this.townVillageName;
    data['panchayat_ward_id'] = this.panchayatWardId;
    data['panchayat_ward_name'] = this.panchayatWardName;
    data['block_id'] = this.blockId;
    data['block_name'] = this.blockName;
    data['thana_id'] = this.thanaId;
    data['thana_name'] = this.thanaName;
    data['post_office_id'] = this.postOfficeId;
    data['post_office_name'] = this.postOfficeName;
    data['locality'] = this.locality;
    data['house_no'] = this.houseNo;
    data['land_mark'] = this.landMark;
    data['pincode'] = this.pincode;
    data['executive_id'] = executiveId;
    data['executive_unique_id'] = executiveUniqueId;
    data['leader_id'] = leaderId;
    data['leader_unique_id'] = leaderUniqueId;
    return data;
  }
}
