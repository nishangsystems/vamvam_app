import 'package:vam_vam/data/model/response/user/courseModel.dart';
import 'package:vam_vam/data/repo/courseRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';

import '../data/model/base/apiResponse.dart';
import '../data/model/base/responseModel.dart';
import '../utils/apiConstant.dart';
import '../widgets/commonWidgets/commonWidgets.dart';

class CourseProvider extends ChangeNotifier {
  final CourseRepo courseRepo;

  CourseProvider({required this.courseRepo});

  bool _loader = false;
  bool get loader => _loader;

  startLoader(bool value) {
    _loader = value;
    notifyListeners();
  }

  // Get Courses For Registration
  CourseModel _courseModel = CourseModel();
  CourseModel get courseModel => _courseModel;

  Future<ResponseModel> getCoursesForRegistration() async {
    _courseModel = CourseModel();
    startLoader(true);
    ApiResponse apiResponse = await courseRepo.getCoursesForRegistration();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      if (map['status'] != null && map['status'] != successCode1) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        _courseModel = CourseModel.fromJson(map);
        responseModel = ResponseModel(true, 'Success!');
      }
    } else {
      startLoader(false);
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

  // Get Class Courses
  final List<CoursesData> _classCoursesList = [];
  List<CoursesData> get classCoursesList => _classCoursesList;

  clearClassCourseList() {
    _classCoursesList.clear();
    notifyListeners();
  }

  Future<ResponseModel> getClassCourses(String levelId) async {
    startLoader(true);
    ApiResponse apiResponse =
        await courseRepo.getClassCourses(levelId: levelId);
    clearClassCourseList();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      if (map['success'] == null || map['success'] != successCode1) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        map['courses'].forEach((element) {
          CoursesData model = CoursesData.fromJson(element);
          _classCoursesList.add(model);
        });
        responseModel = ResponseModel(true, map['message'] ?? 'Success!');
      }
    } else {
      startLoader(false);
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

  // Registration Possibilities APi
  Future<ResponseModel> registrationPossibilities() async {
    startLoader(true);
    ApiResponse apiResponse = await courseRepo.registrationPossibilities();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      if (map['success'] == null || map['success'] != successCode1) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        if (map['eligible'] != null || map['eligible'] == 'YES') {
          responseModel = ResponseModel(true, map['message'] ?? 'Success!');
        } else {
          responseModel =
              ResponseModel(true, map['message'] ?? 'Something Went Wrong!');
        }
      }
    } else {
      startLoader(false);
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

  // Register Course
  Future<ResponseModel> registerCourse(List<int?> coursesIds) async {
    startLoader(true);
    ApiResponse apiResponse =
        await courseRepo.registerCourse(coursesIds: coursesIds);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      if (map['success'] == null || map['success'] != successCode1) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        responseModel = ResponseModel(true, map['message'] ?? 'Success!');
      }
    } else {
      startLoader(false);
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

  // Get Registered Course
  final List<CoursesData> _registeredCourseList = [];
  List<CoursesData> get registeredCourseList => _registeredCourseList;

  clearRegisteredCourseList() {
    _registeredCourseList.clear();
    notifyListeners();
  }

  Future<ResponseModel> getRegisteredCourse(
      {String? semesterId, String? batchId}) async {
    _registeredCourseList.clear();
    notifyListeners();
    startLoader(true);
    ApiResponse apiResponse = await courseRepo.getRegisteredCourse(
        batchId: batchId ?? "", semesterId: semesterId ?? '');

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      if (map['courses'] == null || map['courses'].isEmpty) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        map['courses'].forEach((element) {
          CoursesData model = CoursesData.fromJson(element);
          _registeredCourseList.add(model);
        });
        responseModel = ResponseModel(true, map['message'] ?? 'Success!');
      }
    } else {
      startLoader(false);
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

  // Download Form
  Future<ResponseModel> downloadForm(
      {String? semesterId, String? batchId}) async {
    _courseModel = CourseModel();
    startLoader(true);
    ApiResponse apiResponse = await courseRepo.downloadForm(
        batchId: batchId ?? "", semesterId: semesterId ?? '');
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      if (map['status'] != 'success') {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        downloadPdf(map['url'] ?? '');
        responseModel = ResponseModel(true, map['message'] ?? 'Success!');
      }
    } else {
      startLoader(false);
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

  downloadPdf(String url) async {
    startLoader(true);
    try {
      final directory = await getDownloadsDirectory();
      await FlutterDownloader.enqueue(
        url: url,
        savedDir: directory!.path,
        showNotification: true,
        openFileFromNotification: true,
        requiresStorageNotLow: true,
        saveInPublicStorage: true,
      );
      startLoader(false);
    } catch (e) {
      errorToast(msg: '$e');
      rethrow;
    }
  }
}
