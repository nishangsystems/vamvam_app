// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class RepCompaintModel {
  String? code;
  String? message;
  List<RepCompaintModelData>? data;

  RepCompaintModel({this.code, this.message, this.data});

  RepCompaintModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <RepCompaintModelData>[];
      json['data'].forEach((v) {
        data!.add(new RepCompaintModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RepCompaintModelData {
  String? assignComplaintId;
  String? complaintId;
  String? complaintCode;
  String? userId;
  String? userName;
  String? userMobile;
  String? departmentId;
  String? departmentName;
  String? issueTypeId;
  String? issueTypeName;
  String? message;
  List<ComplaintFile>? complaintFile;
  String? complaintDate;
  String? latitude;
  String? longitude;
  String? address;
  String? status;
  String? statusString;

  RepCompaintModelData(
      {this.assignComplaintId,
      this.complaintId,
      this.complaintCode,
      this.userId,
      this.userName,
      this.userMobile,
      this.departmentId,
      this.departmentName,
      this.issueTypeId,
      this.issueTypeName,
      this.message,
      this.complaintFile,
      this.complaintDate,
      this.latitude,
      this.longitude,
      this.address,
      this.status,
      this.statusString});

  RepCompaintModelData.fromJson(Map<String, dynamic> json) {
    assignComplaintId = json['assign_complaint_id'];
    complaintId = json['complaint_id'];
    complaintCode = json['complaint_code'];
    userId = json['user_id'];
    userName = json['user_name'];
    userMobile = json['user_mobile'];
    departmentId = json['department_id'];
    departmentName = json['department_name'];
    issueTypeId = json['issue_type_id'];
    issueTypeName = json['issue_type_name'];
    message = json['message'];
    if (json['complaint_file'] != null) {
      complaintFile = <ComplaintFile>[];
      json['complaint_file'].forEach((v) {
        complaintFile!.add(new ComplaintFile.fromJson(v));
      });
    }
    complaintDate = json['complaint_date'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    status = json['status'];
    statusString = json['status_string'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assign_complaint_id'] = this.assignComplaintId;
    data['complaint_id'] = this.complaintId;
    data['complaint_code'] = this.complaintCode;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_mobile'] = this.userMobile;
    data['department_id'] = this.departmentId;
    data['department_name'] = this.departmentName;
    data['issue_type_id'] = this.issueTypeId;
    data['issue_type_name'] = this.issueTypeName;
    data['message'] = this.message;
    if (this.complaintFile != null) {
      data['complaint_file'] =
          this.complaintFile!.map((v) => v.toJson()).toList();
    }
    data['complaint_date'] = this.complaintDate;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['status'] = this.status;
    data['status_string'] = this.statusString;
    return data;
  }
}

class ComplaintFile {
  String? filePath;
  String? fileType;

  ComplaintFile({this.filePath, this.fileType});

  ComplaintFile.fromJson(Map<String, dynamic> json) {
    filePath = json['file_path'];
    fileType = json['file_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file_path'] = this.filePath;
    data['file_type'] = this.fileType;
    return data;
  }
}
