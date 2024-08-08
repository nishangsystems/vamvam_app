class ApprovalModel {
  String? code;
  String? message;
  List<ApprovalModelData>? data;

  ApprovalModel({this.code, this.message, this.data});

  ApprovalModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ApprovalModelData>[];
      json['data'].forEach((v) {
        data!.add(ApprovalModelData.fromJson(v));
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

class ApprovalModelData {
  String? id;
  String? complaintId;
  String? executiveId;
  String? executiveName;
  String? ticketNo;
  String? ticketDate;
  String? message;
  String? leaderId;
  String? leaderName;
  String? replyMessage;
  String? status;
  String? statusString;

  ApprovalModelData(
      {this.id,
      this.complaintId,
      this.executiveId,
      this.ticketNo,
      this.ticketDate,
      this.message,
      this.leaderId,
      this.leaderName,
      this.replyMessage,
      this.status,
      this.statusString});

  ApprovalModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    complaintId = json['complaint_id'];
    executiveId = json['executive_id'];
    ticketNo = json['ticket_no'];
    ticketDate = json['ticket_date'];
    message = json['message'];
    leaderId = json['leader_id'];
    leaderName = json['leader_name'];
    replyMessage = json['reply_message'];
    status = json['status'];
    statusString = json['status_string'];
    executiveName = json['executive_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['complaint_id'] = complaintId;
    data['executive_id'] = executiveId;
    data['ticket_no'] = ticketNo;
    data['ticket_date'] = ticketDate;
    data['message'] = message;
    data['leader_id'] = leaderId;
    data['leader_name'] = leaderName;
    data['reply_message'] = replyMessage;
    data['status'] = status;
    data['status_string'] = statusString;
    data['executive_name'] = executiveName;
    return data;
  }
}
