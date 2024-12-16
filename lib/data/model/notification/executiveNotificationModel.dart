class RepNotificationModel {
  String? code;
  String? message;
  List<RepNotificationData>? data;

  RepNotificationModel({this.code, this.message, this.data});

  RepNotificationModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <RepNotificationData>[];
      json['data'].forEach((v) {
        data!.add(RepNotificationData.fromJson(v));
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

class RepNotificationData {
  String? id;
  String? type;
  String? title;
  String? message;
  String? complaintId;
  String? createdAt;
  String? isRead;

  RepNotificationData(
      {this.id,
      this.type,
      this.title,
      this.message,
      this.complaintId,
      this.createdAt,
      this.isRead});

  RepNotificationData.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    type = json['type'];
    title = json['title'];
    message = json['message'];
    complaintId = json['complaint_id'];
    createdAt = json['created_at'];
    isRead = json['is_read'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['title'] = title;
    data['message'] = message;
    data['complaint_id'] = complaintId;
    data['created_at'] = createdAt;
    data['is_read'] = isRead;
    return data;
  }
}
