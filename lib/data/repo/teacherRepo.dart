import 'package:dio/dio.dart';
import 'package:vam_vam/data/model/base/apiResponse.dart';
import 'package:vam_vam/data/remote/dio/dioClient1.dart';

import '../../utils/apiConstant.dart';
import '../remote/exception/apiErrorHandler.dart';

class TeacherRepo {
  final DioClient1 dioClient1;

  TeacherRepo({required this.dioClient1});

  // Teacher get Courses -- vam_vam
  Future<ApiResponse> getTeacherCourses() async {
    try {
      Response response = await dioClient1.get(ApiConstant.getTeacherCourses);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Teacher Create Announcement -- vam_vam
  Future<ApiResponse> createAnnouncement(
      {required String courseId,
      required String title,
      required String message,
      required String campusId}) async {
    try {
      Response response = await dioClient1
          .post('${ApiConstant.createAnnouncement}$courseId', data: {
        'title': title,
        'message': message,
        'course_id': courseId,
        'campus_id': campusId
      });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Get Teacher All Annoucenment -- vam_vam
  Future<ApiResponse> getAllAnnouncements() async {
    try {
      Response response = await dioClient1.get(ApiConstant.getAllAnnouncements);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Get Teacher Update Annoucenment -- vam_vam
  Future<ApiResponse> updateAnnouncement({
    required String announcementId,
    required String title,
    required String message,
  }) async {
    try {
      Response response = await dioClient1
          .post('${ApiConstant.updateAnnouncement}$announcementId', data: {
        'title': title,
        'message': message,
      });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Get Teacher Delete Annoucenment -- vam_vam
  Future<ApiResponse> deleteAnnouncement({
    required String announcementId,
  }) async {
    try {
      Response response = await dioClient1.get(
        '${ApiConstant.deleteAnnouncement}$announcementId',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Get Teacher Courses List -- vam_vam
  Future<ApiResponse> getTeacherCourseList({
    required String courseId,
  }) async {
    try {
      Response response =
          await dioClient1.get('${ApiConstant.getTeacherCourseList}$courseId');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Get Teacher Student Profile -- vam_vam
  Future<ApiResponse> getTeacherStudentProfile({
    required String studentId,
  }) async {
    try {
      Response response = await dioClient1
          .get('${ApiConstant.getTeacherStudentProfile}$studentId');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Get Parent LogOut -- vam_vam
  Future<ApiResponse> teacherLogout() async {
    try {
      Response response = await dioClient1.get(ApiConstant.teacherLogout);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
