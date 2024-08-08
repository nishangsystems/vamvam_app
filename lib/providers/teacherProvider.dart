// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vam_vam/data/model/response/teacher/announcementModel.dart';
import 'package:vam_vam/data/model/response/teacher/teacherCourseListModel.dart';
import 'package:vam_vam/data/repo/teacherRepo.dart';

import '../data/model/base/apiResponse.dart';
import '../data/model/base/responseModel.dart';
import '../data/model/response/teacher/teacherCourseModel.dart';
import '../data/model/response/teacher/teacherStudentProfileModel.dart';

class TeacherProvider extends ChangeNotifier {
  final TeacherRepo teacherRepo;

  TeacherProvider({required this.teacherRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  startLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Teacher get Courses -- vam_vam
  final List<Subjects> _courseList = [];
  List<Subjects> get courseList => _courseList;

  Future<ResponseModel> getTeacherCourses() async {
    _courseList.clear();
    startLoader(true);
    ApiResponse apiResponse = await teacherRepo.getTeacherCourses();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['subjects'] == null) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        runZonedGuarded(
            () => map['subjects'].forEach((element) {
                  Subjects model = Subjects.fromJson(element);
                  _courseList.add(model);
                }), (error, stack) {
          print(error);
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

  // Teacher Create Announcement -- vam_vam
  Future<ResponseModel> createAnnouncementx(
      {required String courseId,
      required String title,
      required String message,
      required String campusId}) async {
    startLoader(true);
    ApiResponse apiResponse = await teacherRepo.createAnnouncement(
        courseId: courseId, title: title, message: message, campusId: campusId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      if (map['success'] != 200) {
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

  // Teacher Update Announcement -- vam_vam
  Future<ResponseModel> updateAnnouncement(
      {required String title,
      required String message,
      required String announcementId}) async {
    startLoader(true);
    ApiResponse apiResponse = await teacherRepo.updateAnnouncement(
        title: title, message: message, announcementId: announcementId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      if (map['data'] == null) {
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

  // Teacher Update Announcement -- vam_vam
  Future<ResponseModel> deleteAnnouncement(
      {required String announcementId}) async {
    startLoader(true);
    ApiResponse apiResponse =
        await teacherRepo.deleteAnnouncement(announcementId: announcementId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      if (map['data'] == null) {
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

  // Get Teacher All Announcement -- vam_vam
  final List<AnnouncementModel> _announcementList = [];
  List<AnnouncementModel> get announcementList => _announcementList;

  Future<ResponseModel> getAllAnnouncements() async {
    _announcementList.clear();
    startLoader(true);
    ApiResponse apiResponse = await teacherRepo.getAllAnnouncements();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      if (map['success'] != 200) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        if (map['notifications'] != null) {
          map['notifications'].forEach((element) {
            AnnouncementModel model = AnnouncementModel.fromJson(element);
            _announcementList.add(model);
          });
        }
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
  TeacherCourseListModel _teacherCourseListModel = TeacherCourseListModel();
  TeacherCourseListModel get teacherCourseListModel => _teacherCourseListModel;

  Future<ResponseModel> getTeacherCourseList({
    required String courseId,
  }) async {
    _teacherCourseListModel = TeacherCourseListModel();
    startLoader(true);
    ApiResponse apiResponse = await teacherRepo.getTeacherCourseList(
      courseId: courseId,
    );
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      if (map['success'] != 200) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        runZonedGuarded(
            () => _teacherCourseListModel =
                TeacherCourseListModel.fromJson(map), (error, stack) {
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
  TeacherStudentProfleModel _teacherStudentProfileModel =
      TeacherStudentProfleModel();
  TeacherStudentProfleModel get teacherStudentProfileModel =>
      _teacherStudentProfileModel;

  Future<ResponseModel> getTeacherStudentProfile({
    required String studentId,
  }) async {
    _teacherStudentProfileModel = TeacherStudentProfleModel();
    startLoader(true);
    ApiResponse apiResponse = await teacherRepo.getTeacherStudentProfile(
      studentId: studentId,
    );
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      if (map['success'] != 200) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        runZonedGuarded(
            () => _teacherStudentProfileModel =
                TeacherStudentProfleModel.fromJson(map), (error, stack) {
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

  // Get Teacher Logout -- vam_vam
  Future<ResponseModel> teacherLogout() async {
    startLoader(true);
    ApiResponse apiResponse = await teacherRepo.teacherLogout();
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
