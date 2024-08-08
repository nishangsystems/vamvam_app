class SurveyModel {
  String? code;
  String? message;
  SurveyModelData? data;

  SurveyModel({this.code, this.message, this.data});

  SurveyModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? SurveyModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SurveyModelData {
  String? id;
  String? question;
  String? isAttempt;
  List<OptionData>? optionData;

  SurveyModelData({this.id, this.question, this.isAttempt, this.optionData});

  SurveyModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    isAttempt = json['is_attempt'];
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
    data['is_attempt'] = isAttempt;
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
