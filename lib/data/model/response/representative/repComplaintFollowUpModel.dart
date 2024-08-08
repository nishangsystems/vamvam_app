// ignore_for_file: unnecessary_this

class RepComplaintFollowUpModel {
  String? code;
  String? message;
  List<RepComplaintFollowUpModelData>? data;

  RepComplaintFollowUpModel({this.code, this.message, this.data});

  RepComplaintFollowUpModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <RepComplaintFollowUpModelData>[];
      json['data'].forEach((v) {
        data!.add(RepComplaintFollowUpModelData.fromJson(v));
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

class RepComplaintFollowUpModelData {
  String? complaintId;
  String? userId;
  String? userName;
  String? userMobile;
  String? executiveId;
  String? executiveName;
  String? date;
  String? time;
  String? remarks;
  List<MediaFile>? mediaFile;
  String? status;
  String? statusString;

  RepComplaintFollowUpModelData(
      {this.complaintId,
      this.userId,
      this.userName,
      this.userMobile,
      this.executiveId,
      this.executiveName,
      this.date,
      this.time,
      this.remarks,
      this.mediaFile,
      this.status,
      this.statusString});

  RepComplaintFollowUpModelData.fromJson(Map<String, dynamic> json) {
    complaintId = json['complaint_id'];
    userId = json['user_id'];
    userName = json['user_name'];
    userMobile = json['user_mobile'];
    executiveId = json['executive_id'];
    executiveName = json['executive_name'];
    date = json['date'];
    time = json['time'];
    remarks = json['remarks'];
    if (json['media_file'] != null) {
      mediaFile = <MediaFile>[];
      json['media_file'].forEach((v) {
        mediaFile!.add(MediaFile.fromJson(v));
      });
    }
    status = json['status'];
    statusString = json['status_string'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['complaint_id'] = this.complaintId;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_mobile'] = this.userMobile;
    data['executive_id'] = this.executiveId;
    data['executive_name'] = this.executiveName;
    data['date'] = this.date;
    data['time'] = this.time;
    data['remarks'] = this.remarks;
    if (this.mediaFile != null) {
      data['media_file'] = this.mediaFile!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['status_string'] = this.statusString;
    return data;
  }
}

class MediaFile {
  String? filePath;
  String? fileType;

  MediaFile({this.filePath, this.fileType});

  MediaFile.fromJson(Map<String, dynamic> json) {
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
