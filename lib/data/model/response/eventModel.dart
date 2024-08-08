class EventModel {
  String? code;
  String? message;
  List<EventModelData>? data;

  EventModel({this.code, this.message, this.data});

  EventModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <EventModelData>[];
      json['data'].forEach((v) {
        data!.add(EventModelData.fromJson(v));
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

class EventModelData {
  String? id;
  String? title;
  String? description;
  String? address;
  String? startDateTime;
  String? endDateTime;
  String? image;
  String? video;
  String? status;

  EventModelData(
      {this.id,
      this.title,
      this.description,
      this.address,
      this.startDateTime,
      this.endDateTime,
      this.image,
      this.video,
      this.status});

  EventModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    address = json['address'];
    startDateTime = json['start_date_time'];
    endDateTime = json['end_date_time'];
    image = json['image'];
    video = json['video'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['address'] = address;
    data['start_date_time'] = startDateTime;
    data['end_date_time'] = endDateTime;
    data['image'] = image;
    data['video'] = video;
    data['status'] = status;
    return data;
  }
}
