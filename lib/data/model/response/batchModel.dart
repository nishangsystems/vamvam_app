class BatchModel {
  int? id;
  String? name;
  String? payChannel;
  int? payCharges;
  String? createdAt;
  String? updatedAt;

  BatchModel(
      {this.id,
      this.name,
      this.payChannel,
      this.payCharges,
      this.createdAt,
      this.updatedAt});

  BatchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    payChannel = json['pay_channel'];
    payCharges = json['pay_charges'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['pay_channel'] = payChannel;
    data['pay_charges'] = payCharges;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
