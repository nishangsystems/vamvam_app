// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vam_vam/data/model/response/parent/parentFeesHistoryModel.dart';
import 'package:vam_vam/data/model/response/parent/parentStudentModel.dart';
import 'package:vam_vam/data/model/response/parent/parentStudentResultModel.dart';
import 'package:vam_vam/data/repo/parentRepo.dart';

import '../data/model/base/apiResponse.dart';
import '../data/model/base/responseModel.dart';
import '../data/model/response/parent/parentRegisteredCoursesModel.dart';

class ParentProvider extends ChangeNotifier {
  final ParentRepo parentRepo;

  ParentProvider({required this.parentRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  startLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Parent get Students -- vam_vam
  final List<ParentStudentModel> _studentList = [];
  List<ParentStudentModel> get studentList => _studentList;

  Future<ResponseModel> getParentStudents() async {
    _studentList.clear();
    startLoader(true);
    ApiResponse apiResponse = await parentRepo.getParentStudents();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['data'] == null || map['data'].isEmpty) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        map['data'].forEach((element) {
          ParentStudentModel model = ParentStudentModel.fromJson(element);
          _studentList.add(model);
        });
        responseModel = ResponseModel(true, 'Success!');
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

  // Get Parent Student Fees History -- vam_vam
  ParentFeesHistoryModel _parentFeesHistoryModel = ParentFeesHistoryModel();
  ParentFeesHistoryModel get parentFeesHistoryModel => _parentFeesHistoryModel;

  clearFeesHistoryModel() {
    _parentFeesHistoryModel = ParentFeesHistoryModel();
    notifyListeners();
  }

  Future<ResponseModel> getParentStudentFeesHistory(
      {required String studentId, required String batchId}) async {
    clearFeesHistoryModel();
    startLoader(true);
    ApiResponse apiResponse = await parentRepo.getParentStudentFeesHistory(
        studentId: studentId, batchId: batchId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      if (map['data'] == null || map['data'].isEmpty) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        runZonedGuarded(
            () => _parentFeesHistoryModel =
                ParentFeesHistoryModel.fromJson(map), (error, stack) {
          print(stack);
        });
        responseModel = ResponseModel(true, 'Success!');
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

  // Get Parent Student Result -- vam_vam
  ParentStudentResultModel _parentStudentResultModel =
      ParentStudentResultModel();
  ParentStudentResultModel get parentStudentResultModel =>
      _parentStudentResultModel;

  clearStudentREsultModel() {
    _parentStudentResultModel = ParentStudentResultModel();
    notifyListeners();
  }

  Future<ResponseModel> getParentStudentResult(
      {required String studentId,
      required String batchId,
      required String semesterId}) async {
    clearStudentREsultModel();
    startLoader(true);
    ApiResponse apiResponse = await parentRepo.getParentStudentResult(
        studentId: studentId, batchId: batchId, semesterId: semesterId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      if (map['data'] == null || map['data'].isEmpty) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        runZonedGuarded(
            () => _parentStudentResultModel =
                ParentStudentResultModel.fromJson(map), (error, stack) {
          print(stack);
        });
        responseModel = ResponseModel(true, 'Success!');
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

  // Get Parent Registered Course -- vam_vam
  ParentRegisteredCourseModel _parentRegisteredCourseModel =
      ParentRegisteredCourseModel();
  ParentRegisteredCourseModel get parentRegisteredCourseModel =>
      _parentRegisteredCourseModel;

  Future<ResponseModel> getParentRegisteredCourses(
      {required String studentId,
      required String batchId,
      required String semesterId}) async {
    _parentRegisteredCourseModel = ParentRegisteredCourseModel();
    startLoader(true);
    ApiResponse apiResponse = await parentRepo.getParentRegisteredCourses(
        studentId: studentId, batchId: batchId, semesterId: semesterId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      if (map == null) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        runZonedGuarded(
            () => _parentRegisteredCourseModel =
                ParentRegisteredCourseModel.fromJson(map), (error, stack) {
          print(stack);
        });
        responseModel = ResponseModel(true, 'Success!');
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

  // Get Parent Logout -- vam_vam
  Future<ResponseModel> parentLogout() async {
    startLoader(true);
    ApiResponse apiResponse = await parentRepo.parentLogout();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      if (map['status'] != 200) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        responseModel = ResponseModel(true, 'Success!');
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
