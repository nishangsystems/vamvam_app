import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vam_vam/data/model/params/surveyModelParams.dart';
import 'package:vam_vam/data/remote/dio/dioClient.dart';
import 'package:vam_vam/data/remote/dio/dioClient1.dart';

import '../../utils/apiConstant.dart';
import '../model/base/apiResponse.dart';
import '../remote/exception/apiErrorHandler.dart';

class SurveyRepo {
  final DioClient1 dioClient1;
  final SharedPreferences prefs;

  SurveyRepo({required this.dioClient1, required this.prefs});

  // Get Survey
  Future<ApiResponse> getSurvey({required String userId}) async {
    try {
      Response response =
          await dioClient1.post(ApiConstant.survey, data: {'user_id': userId});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Submit Survey
  Future<ApiResponse> submitSurvery(
      {required String userId,
      required String questionId,
      required String answerId}) async {
    try {
      Response response = await dioClient1.post(ApiConstant.submitSurvey, data: {
        'user_id': userId,
        'survey_question_id': questionId,
        'survey_answer_id': answerId
      });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Leader Store Survey
  Future<ApiResponse> leaderStoreSurvey(
      {required SurveyModelParams surveyModelParams}) async {
    try {
      Response response = await dioClient1.post(ApiConstant.leaderStoreSurvey,
          data: surveyModelParams.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Leader Get Survey
  Future<ApiResponse> leaderGetSurvey() async {
    try {
      Response response = await dioClient1.get(
        ApiConstant.leaderGetSurvey,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
