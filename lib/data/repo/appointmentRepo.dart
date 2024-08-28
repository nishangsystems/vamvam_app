import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vam_vam/data/model/params/RepAppointmentModelParams.dart';
import 'package:vam_vam/data/model/params/UserAppointmentModelParams.dart';
import 'package:vam_vam/data/model/params/leaderAppointmentModelParams.dart';
import 'package:vam_vam/data/remote/dio/dioClient.dart';
import 'package:vam_vam/data/remote/dio/dioClient1.dart';

import '../../helpers/enumHelper.dart';
import '../../utils/apiConstant.dart';
import '../model/base/apiResponse.dart';
import '../remote/exception/apiErrorHandler.dart';

class AppointmentRepo {
  final DioClient1 dioClient1;
  final SharedPreferences prefs;

  AppointmentRepo({required this.dioClient1, required this.prefs});

// leader book appointment
  Future<ApiResponse> leaderBookAppointment(
      {required LeaderAppointmentModelParams
          leaderAppointmentModelParams}) async {
    try {
      Response response = await dioClient1.post(
          ApiConstant.leaderStoreAppointment,
          data: leaderAppointmentModelParams.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> leaderGetAppointment(
      {required String userId, required String filterBy}) async {
    try {
      Response response = await dioClient1.post(ApiConstant.leaderGetAppointment,
          data: {'user_id': userId, 'filter_by': filterBy});

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

// user book appointment

  Future<ApiResponse> userBookAppointment(
      {required UserAppointmentModelData userAppointmentModelParams}) async {
    try {
      Response response = await dioClient1.post(ApiConstant.userStoreAppointment,
          data: userAppointmentModelParams.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> userGetAppointment(
      {required String userId, required String filterBy}) async {
    try {
      Response response = await dioClient1.post(ApiConstant.userGetAppointment,
          data: {'user_id': userId, 'filter_by': filterBy});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

//  representative appointment

  Future<ApiResponse> repBookAppointment(
      {required RepAppointmentModelData repAppointmentModelParams}) async {
    try {
      Response response = await dioClient1.post(ApiConstant.repStoreAppointment,
          data: repAppointmentModelParams.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> repGetAppointment(
      {required String executiveId, required String filterBy}) async {
    try {
      Response response = await dioClient1.post(ApiConstant.repGetAppointment,
          data: {'executive_id': executiveId, 'filter_by': filterBy});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

// delete repo appointment
  Future<ApiResponse> deleterepBookAppointment(
      {required String executiveId, required String appointmentId}) async {
    try {
      Response response = await dioClient1.post(
          ApiConstant.deleterepStoreAppointment,
          data: {'executive_id': executiveId, 'appointment_id': appointmentId});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

// delete user appointment
  Future<ApiResponse> deleteuserBookAppointment(
      {required String userId, required String appointmentId}) async {
    try {
      Response response = await dioClient1.post(
          ApiConstant.deleteuserStoreAppointment,
          data: {'user_id': userId, 'appointment_id': appointmentId});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // user notification
  Future<ApiResponse> getusernotificationList({
    required String userId,
  }) async {
    try {
      Response response =
          await dioClient1.post(ApiConstant.usernotificationLists, data: {
        'user_id': userId,
      });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // representative notification
  Future<ApiResponse> getrepnotificationList({
    required String userId,
  }) async {
    try {
      Response response =
          await dioClient1.post(ApiConstant.repnotificationLists, data: {
        'executive_id': userId,
      });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

// leader notification
  Future<ApiResponse> getleadernotificationList({
    required String userId,
  }) async {
    try {
      Response response =
          await dioClient1.post(ApiConstant.leadernotificationLists, data: {
        'leader_id': userId,
      });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateNotification({
    required String userId,
    required int roleType,
    required String type,
    String? notificationId,
  }) async {
    var data = {
      'user_id': userId,
      'type': type,
      'notification_id': notificationId
    };
    if (roleType == getRoleType(RoleEnum.teacher)) {
      data = {
        'executive_id': userId,
        'type': type,
        'notification_id': notificationId
      };
    } else if (roleType == getRoleType(RoleEnum.leader)) {
      data = {
        'leader_id': userId,
        'type': type,
        'notification_id': notificationId
      };
    }
    try {
      Response response = await dioClient1
          .post(ApiConstant.getNotificationUpdate(roleType), data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
