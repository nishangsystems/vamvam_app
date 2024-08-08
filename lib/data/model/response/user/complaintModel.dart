// ignore_for_file: unnecessary_this, unnecessary_new

class ComplaintModel {
  String? code;
  String? message;
  List<ComplaintModelData>? data;

  ComplaintModel({this.code, this.message, this.data});

  ComplaintModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ComplaintModelData>[];
      json['data'].forEach((v) {
        data!.add(new ComplaintModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ComplaintModelData {
  String? id;
  String? complaintCode;
  String? userId;
  String? departmentId;
  String? departmentInfo;
  String? issueTypeId;
  String? issueInfo;
  String? message;
  List<ComplaintFile>? complaintFile;
  String? complaintDate;
  String? status;
  String? statusString;
  String? latitude;
  String? longitude;
  String? address;

  ComplaintModelData(
      {this.id,
      this.complaintCode,
      this.userId,
      this.departmentId,
      this.departmentInfo,
      this.issueTypeId,
      this.issueInfo,
      this.message,
      this.complaintFile,
      this.complaintDate,
      this.status,
      this.statusString,
      this.latitude,
      this.longitude,
      this.address});

  ComplaintModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    complaintCode = json['complaint_code'];
    userId = json['user_id'];
    departmentId = json['department_id'];
    departmentInfo = json['departmentInfo'];
    issueTypeId = json['issue_type_id'];
    issueInfo = json['issueInfo'];
    message = json['message'];
    if (json['complaint_file'] != null) {
      complaintFile = <ComplaintFile>[];
      json['complaint_file'].forEach((v) {
        complaintFile!.add(new ComplaintFile.fromJson(v));
      });
    }
    complaintDate = json['complaint_date'];
    status = json['status'];
    statusString = json['status_string'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['complaint_code'] = this.complaintCode;
    data['user_id'] = this.userId;
    data['department_id'] = this.departmentId;
    data['departmentInfo'] = this.departmentInfo;
    data['issue_type_id'] = this.issueTypeId;
    data['issueInfo'] = this.issueInfo;
    data['message'] = this.message;
    if (this.complaintFile != null) {
      data['complaint_file'] =
          this.complaintFile!.map((v) => v.toJson()).toList();
    }
    data['complaint_date'] = this.complaintDate;
    data['status'] = this.status;
    data['status_string'] = this.statusString;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['file_path'] = this.filePath;
    data['file_type'] = this.fileType;
    return data;
  }
}
