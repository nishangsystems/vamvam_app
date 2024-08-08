// ignore_for_file: unnecessary_this

class BannerModel {
  String? code;
  String? message;
  List<BannerModelData>? data;

  BannerModel({this.code, this.message, this.data});

  BannerModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BannerModelData>[];
      json['data'].forEach((v) {
        data!.add(BannerModelData.fromJson(v));
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

class BannerModelData {
  String? id;
  String? image;

  BannerModelData({this.id, this.image});

  BannerModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}
