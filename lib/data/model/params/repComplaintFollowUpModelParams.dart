class RepComplaintFollowUpModelParams {
  String assignComplaintId;
  String complaintId;
  String status;
  List<String> mediaFile;
  String remarks;

  RepComplaintFollowUpModelParams(
      {required this.assignComplaintId,
      required this.complaintId,
      required this.status,
      required this.mediaFile,
      required this.remarks});

  RepComplaintFollowUpModelParams.fromJson(
      Map<String, dynamic> json,
      this.assignComplaintId,
      this.complaintId,
      this.status,
      this.mediaFile,
      this.remarks) {
    assignComplaintId = json['assign_complaint_id'];
    complaintId = json['complaint_id'];
    status = json['status'];
    mediaFile = json['media_file'].cast<String>();
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assign_complaint_id'] = assignComplaintId;
    data['complaint_id'] = complaintId;
    data['status'] = status;
    data['media_file'] = mediaFile;
    data['remarks'] = remarks;
    return data;
  }
}
