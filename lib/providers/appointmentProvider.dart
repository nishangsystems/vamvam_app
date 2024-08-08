// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:vam_vam/data/model/params/RepAppointmentModelParams.dart';
import 'package:vam_vam/data/model/params/UserAppointmentModelParams.dart';
import 'package:vam_vam/data/model/response/admin/leaderAppointmentModel.dart';
import 'package:vam_vam/data/repo/appointmentRepo.dart';
import '../data/model/base/apiResponse.dart';
import '../data/model/base/responseModel.dart';
import '../data/model/params/leaderAppointmentModelParams.dart';
import '../helpers/dialogHelper.dart';
import '../utils/apiConstant.dart';
import '../utils/stringResources.dart';

class AppointmentProvider extends ChangeNotifier {
  final AppointmentRepo appoinmentRepo;

  AppointmentProvider({required this.appoinmentRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<LeaderAppointmentModelData> _leaderAppointmentList = [];
  List<LeaderAppointmentModelData> get leaderAppointmentList =>
      _leaderAppointmentList;

  startLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

// leader
  bool _issLoading = false;
  bool get issLoading => _issLoading;

  final List<UserAppointmentModelData> _userAppointmentList = [];
  List<UserAppointmentModelData> get userAppointmentList =>
      _userAppointmentList;

  startsLoader(bool value) {
    _issLoading = value;
    notifyListeners();
  }
// representative

  bool _isssLoading = false;
  bool get isssLoading => _isssLoading;

  final List<RepAppointmentModelData> _repAppointmentList = [];
  List<RepAppointmentModelData> get repAppointmentList => _repAppointmentList;

  startsssLoader(bool value) {
    _isssLoading = value;
    notifyListeners();
  }

  // Store Leader Store Appointment
  Future<ResponseModel> leaderBookAppointment(
      LeaderAppointmentModelParams leaderAppointmentModelParams,
      BuildContext context) async {
    startLoader(true);
    ApiResponse apiResponse = await appoinmentRepo.leaderBookAppointment(
        leaderAppointmentModelParams: leaderAppointmentModelParams);
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
    startLoader(false);
    return responseModel;
  }

  // Get Leader Appointment
  Future<ResponseModel> leaderGetAppointment(
      String filterBy, String userId) async {
    startLoader(true);
    _leaderAppointmentList.clear();
    notifyListeners();
    ApiResponse apiResponse = await appoinmentRepo.leaderGetAppointment(
        filterBy: filterBy, userId: userId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        if (map['message'] == unAuthonticated) {
          //  unAuthenticatedPopUp(context: context);
        }
        responseModel = ResponseModel(false, map['message']);
      } else {
        map['data'].forEach((item) {
          LeaderAppointmentModelData model =
              LeaderAppointmentModelData.fromJson(item);
          _leaderAppointmentList.add(model);
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
      responseModel = ResponseModel(false, errorMessage);
    }
    notifyListeners();
    startLoader(false);
    return responseModel;
  }

//   Store User Appointment
  Future<ResponseModel> userBookAppointment(
      UserAppointmentModelData userAppointmentModelParams,
      BuildContext context) async {
    startsLoader(true);
    ApiResponse apiResponse = await appoinmentRepo.userBookAppointment(
        userAppointmentModelParams: userAppointmentModelParams);
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
    startsLoader(false);
    return responseModel;
  }

  // Get User Appointment
  Future<ResponseModel> userGetAppointment(
      String filterBy, String userId, BuildContext context) async {
    startsLoader(true);
    _userAppointmentList.clear();
    notifyListeners();
    ApiResponse apiResponse = await appoinmentRepo.userGetAppointment(
        filterBy: filterBy, userId: userId);
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
        map['data'].forEach((item) {
          UserAppointmentModelData model =
              UserAppointmentModelData.fromJson(item);
          _userAppointmentList.add(model);
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
      responseModel = ResponseModel(false, errorMessage);
    }
    notifyListeners();
    startsLoader(false);
    return responseModel;
  }

//   Store Representative Appointment
  Future<ResponseModel> repBookAppointment(
      RepAppointmentModelData repAppointmentModelParams,
      BuildContext context) async {
    startLoader(true);
    ApiResponse apiResponse = await appoinmentRepo.repBookAppointment(
        repAppointmentModelParams: repAppointmentModelParams);
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
    startLoader(false);
    return responseModel;
  }

  // Get Representative Appointment
  Future<ResponseModel> repGetAppointment(
      String filterBy, String executiveId) async {
    startsssLoader(true);
    _repAppointmentList.clear();
    notifyListeners();
    ApiResponse apiResponse = await appoinmentRepo.repGetAppointment(
        filterBy: filterBy, executiveId: executiveId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        if (map['message'] == unAuthonticated) {
          // unAuthenticatedPopUp(context: context);
        }
        responseModel = ResponseModel(false, map['message']);
      } else {
        map['data'].forEach((item) {
          RepAppointmentModelData model =
              RepAppointmentModelData.fromJson(item);
          _repAppointmentList.add(model);
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
      responseModel = ResponseModel(false, errorMessage);
    }
    notifyListeners();
    startsssLoader(false);
    return responseModel;
  }

  // delete representative BookAppointment
  Future<ResponseModel> deleteBookAppointment(
      String executiveId, String appointmentId) async {
    startLoader(true);
    notifyListeners();
    ApiResponse apiResponse = await appoinmentRepo.deleterepBookAppointment(
        executiveId: executiveId, appointmentId: appointmentId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
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
    startLoader(false);
    return responseModel;
  }

  // delete user BookAppointment
  Future<ResponseModel> deleteuserBookAppointment(
      String userId, String appointmentId) async {
    startLoader(true);
    notifyListeners();
    ApiResponse apiResponse = await appoinmentRepo.deleteuserBookAppointment(
        userId: userId, appointmentId: appointmentId);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
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
    startLoader(false);
    return responseModel;
  }

// // Notification list getting
//   Future<ResponseModel> getnotificationList(String userId) async {
//     startsLoader(true);
//     _notificationList.clear();
//     notifyListeners();
//     ApiResponse apiResponse =
//         await appoinmentRepo.getnotificationList(userId: userId);
//     ResponseModel responseModel;
//     if (apiResponse.response != null &&
//         apiResponse.response!.statusCode == 200) {
//       Map map = apiResponse.response!.data;
//       if (map['code'] != successCode) {
//         if (map['message'] == unAuthonticated) {
//           // unAuthenticatedPopUp(context: context);
//         }
//         responseModel = ResponseModel(false, map['message']);
//       } else {
//         map['data'].forEach((item) {
//           NotificationListData model = NotificationListData.fromJson(item);
//           _notificationList.add(model);
//           notifyListeners();
//         });
//         responseModel = ResponseModel(true, map['message']);
//       }
//     } else {
//       String errorMessage;
//       if (apiResponse.error is String) {
//         errorMessage = apiResponse.error.toString();
//       } else {
//         errorMessage = apiResponse.error.errors[0].message;
//       }
//       responseModel = ResponseModel(false, errorMessage);
//     }
//     notifyListeners();
//     notificationLoader(false);
//     return responseModel;
//   }
}
