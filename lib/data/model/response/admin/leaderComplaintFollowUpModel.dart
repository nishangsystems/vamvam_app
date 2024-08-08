class LeaderComplaintFollowUpModel {
  String? code;
  String? message;
  List<LeaderComplaintFollowUpModelData>? data;

  LeaderComplaintFollowUpModel({this.code, this.message, this.data});

  LeaderComplaintFollowUpModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LeaderComplaintFollowUpModelData>[];
      json['data'].forEach((v) {
        data!.add(LeaderComplaintFollowUpModelData.fromJson(v));
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

class LeaderComplaintFollowUpModelData {
  String? complaintId;
  String? executiveId;
  String? executiveName;
  String? date;
  String? time;
  String? remarks;
  List<MediaFile>? mediaFile;
  String? status;
  String? statusString;

  LeaderComplaintFollowUpModelData(
      {this.complaintId,
      this.executiveId,
      this.executiveName,
      this.date,
      this.time,
      this.remarks,
      this.mediaFile,
      this.status,
      this.statusString});

  LeaderComplaintFollowUpModelData.fromJson(Map<String, dynamic> json) {
    complaintId = json['complaint_id'];
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
    data['complaint_id'] = complaintId;
    data['executive_id'] = executiveId;
    data['executive_name'] = executiveName;
    data['date'] = date;
    data['time'] = time;
    data['remarks'] = remarks;
    if (mediaFile != null) {
      data['media_file'] = mediaFile!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['status_string'] = statusString;
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
    data['file_path'] = filePath;
    data['file_type'] = fileType;
    return data;
  }
}
