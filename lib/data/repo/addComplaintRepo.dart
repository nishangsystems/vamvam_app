import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vam_vam/data/model/params/registerComplaintModelParams.dart';
import 'package:vam_vam/data/model/params/repComplaintFollowUpModelParams.dart';
import 'package:vam_vam/data/remote/dio/dioClient.dart';
import 'package:vam_vam/data/remote/dio/dioClient1.dart';

import '../../utils/apiConstant.dart';
import '../model/base/apiResponse.dart';
import '../remote/exception/apiErrorHandler.dart';

class AddComplaintRepo {
  final DioClient1 dioClient1;
  final SharedPreferences prefs;

  AddComplaintRepo({required this.dioClient1, required this.prefs});

  // Get Department
  Future<ApiResponse> getDepartment() async {
    try {
      Response response = await dioClient1.get(ApiConstant.getDepartment);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Get Complaint Categories
  Future<ApiResponse> getComplaintCategory() async {
    try {
      Response response = await dioClient1.get(ApiConstant.getIssueType);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Register Compaint
  Future<ApiResponse> registerComplaint(
      {required RegisterComplaintModelParams model}) async {
    final multipartImageList = model.complaintFile
        .map((image) => MultipartFile.fromFileSync(image))
        .toList();
    var formData = FormData.fromMap({
      'user_id': model.userId,
      'department_id': model.departmentId,
      'issue_type_id': model.issueTypeId,
      'message': model.message,
      'latitude': model.latitude,
      'longitude': model.longitude,
      'address': model.address,
      'complaint_file[]': multipartImageList
    });

    try {
      Response response =
          await dioClient1.post(ApiConstant.registerComplaint, data: formData);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Get Complaint List
  Future<ApiResponse> getComplaints(
      {required String userId, required String filterBy}) async {
    try {
      print({'user_id': userId, 'filter_by': filterBy});
      Response response = await dioClient1.post(ApiConstant.complaintList,
          data: {'user_id': userId, 'filter_by': filterBy});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Get Complaint Follow-up List
  Future<ApiResponse> getComplaintFollowUp(
      {required String complaintId}) async {
    try {
      Response response = await dioClient1.post(
          ApiConstant.complaintFollowUpList,
          data: {'complaint_id': complaintId});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Withdraw complaint api
  Future<ApiResponse> withdrawComplaint({required String complaintId}) async {
    try {
      Response response = await dioClient1.post(ApiConstant.withdrawComplaint,
          data: {'complaint_id': complaintId});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Reopen Complaint
  Future<ApiResponse> reopenComplaint({required String complaintId}) async {
    try {
      Response response = await dioClient1.post(ApiConstant.reopenComplaint,
          data: {'complaint_id': complaintId});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Follow Complaint User
  Future<ApiResponse> reviewComplaint(
      {required String complaintId,
      required String message,
      required List<String> mediaFiles}) async {
    final multipartImageList =
        mediaFiles.map((image) => MultipartFile.fromFileSync(image)).toList();
    var formData = FormData.fromMap({
      'complaint_id': complaintId,
      'message': message,
      'media_file[]': multipartImageList
    });
    try {
      Response response =
          await dioClient1.post(ApiConstant.followUpComplaint, data: formData);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Get Complaint Follow-up List(Executive)
  Future<ApiResponse> getRepComplaints(
      {required String executiveId, required String filterBy}) async {
    try {
      Response response = await dioClient1.post(ApiConstant.repComplaints,
          data: {'executive_id': executiveId, 'filter_by': filterBy});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Executive Complaint follow up
  Future<ApiResponse> repComplaintFollowUp(
      {required RepComplaintFollowUpModelParams model}) async {
    try {
      final multipartImageList = model.mediaFile
          .map((image) => MultipartFile.fromFileSync(image))
          .toList();
      var formData = FormData.fromMap({
        'assign_complaint_id': model.assignComplaintId,
        'complaint_id': model.complaintId,
        'media_file[]': multipartImageList,
        'status': model.status,
        'remarks': model.remarks,
      });
      Response response = await dioClient1.post(ApiConstant.repComplaintFollowUp,
          data: formData);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Executive Get Complaint follow up
  Future<ApiResponse> repGetComplaintFollowUp(
      {required String executiveId, required String complaintId}) async {
    try {
      Response response = await dioClient1.post(
          ApiConstant.repGetComplaintFollowUp,
          data: {'executive_id': executiveId, 'complaint_id': complaintId});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> leaderGetComplaint() async {
    try {
      Response response = await dioClient1.get(
        ApiConstant.leaderComplaintList,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> leaderGetComplaintFollowUp(
      {required String complaintId}) async {
    try {
      Response response = await dioClient1.post(
          ApiConstant.leaderGetComplaintFollowUp,
          data: {'complaint_id': complaintId});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
