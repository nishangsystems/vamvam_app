class ToDoModel {
  String? code;
  String? message;
  List<ToDoModelData>? data;

  ToDoModel({this.code, this.message, this.data});

  ToDoModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ToDoModelData>[];
      json['data'].forEach((v) {
        data!.add(ToDoModelData.fromJson(v));
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

class ToDoModelData {
  String? id;
  String? executiveId;
  String? title;
  String? message;
  String? todoDate;
  String? status;

  ToDoModelData(
      {this.id,
      this.executiveId,
      this.title,
      this.message,
      this.todoDate,
      this.status});

  ToDoModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    executiveId = json['executive_id'];
    title = json['title'];
    message = json['message'];
    todoDate = json['todo_date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['executive_id'] = executiveId;
    data['title'] = title;
    data['message'] = message;
    data['todo_date'] = todoDate;
    data['status'] = status;
    return data;
  }
}
