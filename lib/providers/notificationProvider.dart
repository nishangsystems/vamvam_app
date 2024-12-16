// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:vam_vam/data/model/notification/executiveNotificationModel.dart';
import 'package:vam_vam/data/model/notification/leaderNotificationModel.dart';
import 'package:vam_vam/data/model/notification/userNotificationModel.dart';
import 'package:vam_vam/data/repo/appointmentRepo.dart';
import '../data/model/base/apiResponse.dart';
import '../data/model/base/responseModel.dart';
import '../helpers/dialogHelper.dart';
import '../utils/apiConstant.dart';
import '../utils/stringResources.dart';

class NotificationProvider extends ChangeNotifier {
  final AppointmentRepo appoinmentRepo;

  NotificationProvider({required this.appoinmentRepo});

// user notification listing
  bool _notificationLoading = false;

  bool get notificationLoading => _notificationLoading;

  final List<UserNotificationData> _usernotificationList = [];

  List<UserNotificationData> get usernotificationList => _usernotificationList;

  notificationLoader(bool value) {
    _notificationLoading = value;
    notifyListeners();
  }

// Notification list getting
  Future<ResponseModel> getNotificationList(String userId) async {
    notificationLoader(true);

    ApiResponse apiResponse =
        await appoinmentRepo.getusernotificationList(userId: userId);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        if (map['message'] == unAuthonticated) {
          // unAuthenticatedPopUp(context: context);
        }
        _usernotificationList.clear();
        notifyListeners();
        responseModel = ResponseModel(false, map['message']);
      } else {
        _usernotificationList.clear();
        notifyListeners();
        map['data'].forEach((item) {
          UserNotificationData model = UserNotificationData.fromJson(item);
          _usernotificationList.add(model);
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
      _usernotificationList.clear();
      notifyListeners();
      responseModel = ResponseModel(false, errorMessage);
    }
    notifyListeners();
    notificationLoader(false);
    return responseModel;
  }

  Future<ResponseModel> getStudentNotificationList(String userId) async {
    notificationLoader(true);

    ApiResponse apiResponse =
        await appoinmentRepo.getstudentnotificationList(userId: userId);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      _usernotificationList.clear();
      notifyListeners();
      map['notifications'].forEach((item) {
        UserNotificationData model = UserNotificationData.fromJson(item);
        _usernotificationList.add(model);
        notifyListeners();
      });

      responseModel = ResponseModel(true,"");
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      _usernotificationList.clear();
      notifyListeners();
      responseModel = ResponseModel(false, errorMessage);
    }
    notifyListeners();
    notificationLoader(false);
    return responseModel;
  }

// representative notification
  bool _repnotificationLoading = false;

  bool get repnotificationLoading => _repnotificationLoading;

  final List<RepNotificationData> _repnotificationList = [];

  List<RepNotificationData> get repnotificationList => _repnotificationList;

  repnotificationLoader(bool value) {
    _repnotificationLoading = value;
    notifyListeners();
  }

// Notification list getting
  Future<ResponseModel> getrepnotificationList(String userId) async {
    notificationLoader(true);

    ApiResponse apiResponse =
        await appoinmentRepo.getrepnotificationList(userId: userId);
    ResponseModel responseModel;

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {

      Map map = apiResponse.response!.data;
      if (map['success'] != successCode1) {
        if (map['message'] == unAuthonticated) {
          // unAuthenticatedPopUp(context: context);
        }
        _repnotificationList.clear();
        notifyListeners();
        responseModel = ResponseModel(false, "");
      } else {
        _repnotificationList.clear();
        notifyListeners();
        map['notifications'].forEach((item) {
          RepNotificationData model = RepNotificationData.fromJson(item);
          _repnotificationList.add(model);
          notifyListeners();
        });

        responseModel = ResponseModel(true, "");
      }
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      _repnotificationList.clear();
      notifyListeners();
      responseModel = ResponseModel(false, errorMessage);
    }
    notifyListeners();
    notificationLoader(false);
    return responseModel;
  }

// leader notification
  bool _leadernotificationLoading = false;

  bool get leadernotificationLoading => _leadernotificationLoading;

  final List<LeaderNotificationData> _leadernotificationList = [];

  List<LeaderNotificationData> get leadernotificationList =>
      _leadernotificationList;

  leadernotificationLoader(bool value) {
    _leadernotificationLoading = value;
    notifyListeners();
  }

// Notification list getting
  Future<ResponseModel> getleadernotificationList(String userId) async {
    notificationLoader(true);

    ApiResponse apiResponse =
        await appoinmentRepo.getleadernotificationList(userId: userId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        if (map['message'] == unAuthonticated) {
          // unAuthenticatedPopUp(context: context);
        }
        _leadernotificationList.clear();
        notifyListeners();
        responseModel = ResponseModel(false, map['message']);
      } else {
        _leadernotificationList.clear();
        notifyListeners();
        map['data'].forEach((item) {
          LeaderNotificationData model = LeaderNotificationData.fromJson(item);
          _leadernotificationList.add(model);
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
      _leadernotificationList.clear();
      notifyListeners();
      responseModel = ResponseModel(false, errorMessage);
    }
    notifyListeners();
    notificationLoader(false);
    return responseModel;
  }

  Future<ResponseModel> updateNotification(
      {required String userId,
      required int roleType,
      required String type,
      String? notificationId,
      required BuildContext context}) async {
    notificationLoader(true);
    // _usernotificationList.clear();
    // notifyListeners();
    ApiResponse apiResponse = await appoinmentRepo.updateNotification(
        userId: userId,
        roleType: roleType,
        type: type,
        notificationId: notificationId);
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
    notificationLoader(false);
    return responseModel;
  }

  Future<ResponseModel> getnotificationList(String userId) async {
    notificationLoader(true);

    ApiResponse apiResponse =
        await appoinmentRepo.getstudentnotificationList(userId: userId);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        if (map['message'] == unAuthonticated) {
          // unAuthenticatedPopUp(context: context);
        }
        _usernotificationList.clear();
        notifyListeners();
        responseModel = ResponseModel(false, map['message']);
      } else {
        _usernotificationList.clear();
        notifyListeners();
        map['data'].forEach((item) {
          UserNotificationData model = UserNotificationData.fromJson(item);
          _usernotificationList.add(model);
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
      _usernotificationList.clear();
      notifyListeners();
      responseModel = ResponseModel(false, errorMessage);
    }
    notifyListeners();
    notificationLoader(false);
    return responseModel;
  }
}
