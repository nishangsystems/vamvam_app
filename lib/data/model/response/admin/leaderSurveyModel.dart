class LeaderSurveyModel {
  String? code;
  String? message;
  List<LeaderSurveyModelData>? data;

  LeaderSurveyModel({this.code, this.message, this.data});

  LeaderSurveyModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LeaderSurveyModelData>[];
      json['data'].forEach((v) {
        data!.add(LeaderSurveyModelData.fromJson(v));
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

class LeaderSurveyModelData {
  String? id;
  String? question;
  List<OptionData>? optionData;

  LeaderSurveyModelData({this.id, this.question, this.optionData});

  LeaderSurveyModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    if (json['optionData'] != null) {
      optionData = <OptionData>[];
      json['optionData'].forEach((v) {
        optionData!.add(OptionData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    if (optionData != null) {
      data['optionData'] = optionData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OptionData {
  String? id;
  String? option;
  String? ansCount;

  OptionData({this.id, this.option, this.ansCount});

  OptionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    option = json['option'];
    ansCount = json['ans_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['option'] = option;
    data['ans_count'] = ansCount;
    return data;
  }
}
