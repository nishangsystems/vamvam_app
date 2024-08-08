class RegisterComplaintModelParams {
  String userId;
  String departmentId;
  String issueTypeId;
  String message;
  String latitude;
  String longitude;
  String address;
  List<String> complaintFile;

  RegisterComplaintModelParams(
      {required this.userId,
      required this.departmentId,
      required this.issueTypeId,
      required this.message,
      required this.latitude,
      required this.longitude,
      required this.address,
      required this.complaintFile});

  RegisterComplaintModelParams.fromJson(
      Map<String, dynamic> json,
      this.userId,
      this.departmentId,
      this.issueTypeId,
      this.message,
      this.latitude,
      this.longitude,
      this.address,
      this.complaintFile) {
    userId = json['user_id'];
    departmentId = json['department_id'];
    issueTypeId = json['issue_type_id'];
    message = json['message'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    complaintFile = json['complaint_file'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['department_id'] = departmentId;
    data['issue_type_id'] = issueTypeId;
    data['message'] = message;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['address'] = address;
    data['complaint_file'] = complaintFile;
    return data;
  }
}
