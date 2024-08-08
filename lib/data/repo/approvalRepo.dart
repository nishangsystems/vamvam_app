import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vam_vam/data/model/base/apiResponse.dart';
import 'package:vam_vam/data/remote/dio/dioClient.dart';
import 'package:vam_vam/data/remote/exception/apiErrorHandler.dart';
import 'package:vam_vam/utils/apiConstant.dart';

class ApprovalRepo {
  final DioClient dioClient;
  final SharedPreferences prefs;

  ApprovalRepo({required this.dioClient, required this.prefs});

  Future<ApiResponse> repRequestApproval(
      {required String executiveId,
      required String compalintId,
      required String message}) async {
    try {
      Response response = await dioClient.post(ApiConstant.repRequestApproval,
          data: {
            'executive_id': executiveId,
            'complaint_id': compalintId,
            'message': message
          });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getRequestApproval(
      {required String executiveId,
      required int roleType,
      required String filterBy}) async {
    try {
      Response response = await dioClient.post(
          ApiConstant.getRequestApproval(roleType),
          data: {'executive_id': executiveId, 'filter_by': filterBy});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> changeApprovalStatus(
      {required String leaderId,
      required String status,
      required String message,
      required String id}) async {
    try {
      Response response = await dioClient
          .post(ApiConstant.leaderApprovalStatusChange, data: {
        'leader_id': leaderId,
        'status': status,
        'reply_message': message,
        'id': id
      });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
