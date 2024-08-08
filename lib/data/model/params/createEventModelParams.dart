import 'dart:io';

class CreateEventParamsModel {
  String? leaderId;
  String? title;
  String? description;
  String? address;
  String? startDateTime;
  String? endDateTime;
  List<File> image;
  List<String> video;
  String? lat;
  String? lng;

  CreateEventParamsModel({
    required this.leaderId,
    required this.title,
    required this.description,
    required this.address,
    required this.startDateTime,
    required this.endDateTime,
    required this.image,
    required this.video,
    required this.lat,
    required this.lng,
  });

  CreateEventParamsModel.fromJson(
      Map<String, dynamic> json,
      this.leaderId,
      this.title,
      this.description,
      this.address,
      this.startDateTime,
      this.endDateTime,
      this.image,
      this.video,
      this.lat,
      this.lng) {
    leaderId = json['leader_id'];
    title = json['title'];
    description = json['description'];
    address = json['address'];
    startDateTime = json['start_date_time'];
    endDateTime = json['end_date_time'];
    image = json['image'];
    video = json['video'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['leader_id'] = leaderId;
    data['title'] = title;
    data['description'] = description;
    data['address'] = address;
    data['start_date_time'] = startDateTime;
    data['end_date_time'] = endDateTime;
    data['image'] = image;
    data['video'] = video;
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}
