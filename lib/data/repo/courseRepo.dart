import 'package:vam_vam/data/remote/dio/dioClient1.dart';
import 'package:dio/dio.dart';

import '../../utils/apiConstant.dart';
import '../model/base/apiResponse.dart';
import '../remote/exception/apiErrorHandler.dart';

class CourseRepo {
  final DioClient1 dioClient1;

  CourseRepo({
    required this.dioClient1,
  });

  Future<ApiResponse> getCoursesForRegistration() async {
    try {
      Response response =
          await dioClient1.get(ApiConstant.getCoursesForRegistration);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getClassCourses({required String levelId}) async {
    try {
      Response response =
          await dioClient1.get("${ApiConstant.getClassCourses}$levelId");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> registerCourse({required List<int?> coursesIds}) async {
    try {
      Response response =
          await dioClient1.get("${ApiConstant.registerCourse}$coursesIds");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getRegisteredCourse(
      {required String semesterId, required String batchId}) async {
    try {
      Response response = await dioClient1
          .get("${ApiConstant.getRegisteredCourse}$semesterId&year=$batchId");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> downloadForm(
      {required String semesterId, required String batchId}) async {
    try {
      Response response = await dioClient1
          .post("${ApiConstant.downloadForm}$semesterId&year=$batchId");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> registrationPossibilities() async {
    try {
      Response response =
          await dioClient1.get(ApiConstant.registrationPossibilities);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
