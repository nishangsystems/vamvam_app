// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:vam_vam/data/repo/surveyRepo.dart';

import '../data/model/base/apiResponse.dart';
import '../data/model/base/responseModel.dart';
import '../data/model/params/surveyModelParams.dart';
import '../data/model/response/admin/leaderSurveyModel.dart';
import '../data/model/response/user/surveyModel.dart';
import '../helpers/dialogHelper.dart';
import '../utils/apiConstant.dart';
import '../utils/stringResources.dart';

class SurveyProvider extends ChangeNotifier {
  final SurveyRepo surveyRepo;

  SurveyProvider({required this.surveyRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  SurveyModelData _surveyData = SurveyModelData();
  SurveyModelData get surveyData => _surveyData;

  final List<LeaderSurveyModelData> _leaderSurveyList = [];
  List<LeaderSurveyModelData> get leaderSurveyList => _leaderSurveyList;

  startLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //----------------------------- Apis Section -----------------------------
  // Get Survey Data
  Future<ResponseModel> getSurvey(String userId, BuildContext context) async {
    startLoader(true);
    ApiResponse apiResponse = await surveyRepo.getSurvey(userId: userId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        if (map['message'] == unAuthonticated) {
          unAuthenticatedPopUp(context: context);
        }
        responseModel = ResponseModel(false, map['message']);
      } else {
        _surveyData = SurveyModelData();
        notifyListeners();
        _surveyData = SurveyModelData.fromJson(map['data']);
        notifyListeners();
        responseModel = ResponseModel(true, map['message']);
      }
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      responseModel = ResponseModel(false, errorMessage);
    }
    notifyListeners();
    startLoader(false);
    return responseModel;
  }

  // Submit Survey
  Future<ResponseModel> submitSurvey(String userId, String questionId,
      String answerId, BuildContext context) async {
    startLoader(true);
    ApiResponse apiResponse = await surveyRepo.submitSurvery(
        userId: userId, answerId: answerId, questionId: questionId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        if (map['message'] == unAuthonticated) {
          unAuthenticatedPopUp(context: context);
        }
        responseModel = ResponseModel(false, map['message']);
      } else {
        getSurvey(userId, context);
        responseModel = ResponseModel(true, map['message']);
      }
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      responseModel = ResponseModel(false, errorMessage);
    }
    notifyListeners();
    startLoader(false);
    return responseModel;
  }

  // Store Leader Survey
  Future<ResponseModel> leaderStoreSurvey(
      SurveyModelParams surveyModelParams, BuildContext context) async {
    startLoader(true);
    ApiResponse apiResponse = await surveyRepo.leaderStoreSurvey(
        surveyModelParams: surveyModelParams);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        if (map['message'] == unAuthonticated) {
          unAuthenticatedPopUp(context: context);
        }
        responseModel = ResponseModel(false, map['message']);
      } else {
        responseModel = ResponseModel(true, map['message']);
      }
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      responseModel = ResponseModel(false, errorMessage);
    }
    notifyListeners();
    startLoader(false);
    return responseModel;
  }

  // Store Leader Get Survey
  Future<ResponseModel> leaderGetSurvey(BuildContext context) async {
    startLoader(true);
    _leaderSurveyList.clear();
    notifyListeners();
    ApiResponse apiResponse = await surveyRepo.leaderGetSurvey();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        if (map['message'] == unAuthonticated) {
          unAuthenticatedPopUp(context: context);
        }
        responseModel = ResponseModel(false, map['message']);
      } else {
        map['data'].forEach((item) {
          LeaderSurveyModelData model = LeaderSurveyModelData.fromJson(item);
          _leaderSurveyList.add(model);
          notifyListeners();
        });
        responseModel = ResponseModel(true, map['message']);
      }
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      responseModel = ResponseModel(false, errorMessage);
    }
    notifyListeners();
    startLoader(false);
    return responseModel;
  }
}
