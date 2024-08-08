import 'package:dio/dio.dart';
import 'package:vam_vam/data/model/base/apiResponse.dart';
import 'package:vam_vam/data/remote/dio/dioClient1.dart';

import '../../utils/apiConstant.dart';
import '../remote/exception/apiErrorHandler.dart';

class ParentRepo {
  final DioClient1 dioClient1;

  ParentRepo({required this.dioClient1});

  // Parent get Students -- vam_vam
  Future<ApiResponse> getParentStudents() async {
    try {
      Response response = await dioClient1.get(ApiConstant.getParentStudents);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Get Parent Student Fees History -- vam_vam
  Future<ApiResponse> getParentStudentFeesHistory(
      {required String studentId, required String batchId}) async {
    try {
      Response response = await dioClient1.get(
          '${ApiConstant.getParentStudentFeesHistory}$studentId&year=$batchId');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Get Parent Student Result -- vam_vam
  Future<ApiResponse> getParentStudentResult(
      {required String studentId,
      required String batchId,
      required String semesterId}) async {
    try {
      Response response = await dioClient1.get(
          '${ApiConstant.getParentStudentResult}$studentId&year=$batchId&semester=$semesterId');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Get Parent Registered Courses -- vam_vam
  Future<ApiResponse> getParentRegisteredCourses(
      {required String studentId,
      required String batchId,
      required String semesterId}) async {
    try {
      Response response = await dioClient1.get(
          '${ApiConstant.getParentRegisteredCourses}$studentId&year=$batchId&semester=$semesterId');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Get Parent LogOut -- vam_vam
  Future<ApiResponse> parentLogout() async {
    try {
      Response response = await dioClient1.get(ApiConstant.parentLogout);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
