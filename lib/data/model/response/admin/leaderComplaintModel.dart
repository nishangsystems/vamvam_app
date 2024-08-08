class LeaderComplaintModel {
  String? code;
  String? message;
  List<LeaderComplaintModelData>? data;

  LeaderComplaintModel({this.code, this.message, this.data});

  LeaderComplaintModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LeaderComplaintModelData>[];
      json['data'].forEach((v) {
        data!.add(LeaderComplaintModelData.fromJson(v));
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

class LeaderComplaintModelData {
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

  LeaderComplaintModelData(
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

  LeaderComplaintModelData.fromJson(Map<String, dynamic> json) {
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
        complaintFile!.add(ComplaintFile.fromJson(v));
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
    data['id'] = id;
    data['complaint_code'] = complaintCode;
    data['user_id'] = userId;
    data['department_id'] = departmentId;
    data['departmentInfo'] = departmentInfo;
    data['issue_type_id'] = issueTypeId;
    data['issueInfo'] = issueInfo;
    data['message'] = message;
    if (complaintFile != null) {
      data['complaint_file'] = complaintFile!.map((v) => v.toJson()).toList();
    }
    data['complaint_date'] = complaintDate;
    data['status'] = status;
    data['status_string'] = statusString;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['address'] = address;
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
    data['file_path'] = filePath;
    data['file_type'] = fileType;
    return data;
  }
}
