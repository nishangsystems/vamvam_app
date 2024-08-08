class SurveyModelParams {
  String question;
  String weekDate;
  List<String> answer;

  SurveyModelParams(
      {required this.question, required this.weekDate, required this.answer});

  SurveyModelParams.fromJson(
      Map<String, dynamic> json, this.question, this.weekDate, this.answer) {
    question = json['question'];
    weekDate = json['week_date'];
    answer = json['answer'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['week_date'] = weekDate;
    data['answer'] = answer;
    return data;
  }
}
