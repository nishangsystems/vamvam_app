import 'package:flutter/material.dart';
import 'package:vam_vam/data/repo/forgotPasswordRepo.dart';
import 'package:vam_vam/helpers/enumHelper.dart';

import '../data/model/base/apiResponse.dart';
import '../data/model/base/responseModel.dart';
import '../utils/apiConstant.dart';
import 'AuthProvider.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  final ForgotPasswordRepo repo;

  ForgotPasswordProvider({required this.repo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final TextEditingController _emailTextEditingController =
      TextEditingController();
  TextEditingController get emailTextEditingController =>
      _emailTextEditingController;

  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  TextEditingController get passwordTextEditingController =>
      _passwordTextEditingController;

  final TextEditingController _conPasswordTextEditingController =
      TextEditingController();
  TextEditingController get conPasswordTextEditingController =>
      _conPasswordTextEditingController;

  bool _isShowPwd = true;
  bool get isShowPwd => _isShowPwd;

  bool _isShowConPwd = true;
  bool get isShowConPwd => _isShowConPwd;

  setShowPwd(bool value) {
    _isShowPwd = value;
    notifyListeners();
  }

  setShowConPwd(bool value) {
    _isShowConPwd = value;
    notifyListeners();
  }

  startLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //----------------------------- Apis Section -----------------------------
  Future<ResponseModel> forgetPassword(
      String email, AuthProvider auth, int roleType) async {
    startLoader(true);
    ApiResponse apiResponse =
        await repo.forgetPassword(email: email, roleType: roleType);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        auth.setUserId(roleType == getRoleType(RoleEnum.student)
            ? map['data']['user_id']
            : roleType == getRoleType(RoleEnum.teacher)
                ? map['data']['executive_id']
                : map['data']['leader_id']);
        auth.setPinPutController(map['data']['otp']);
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

  Future<ResponseModel> verifyOtp(
      String email, String otp, String userId, int roleType) async {
    ApiResponse apiResponse = await repo.verifyOtp(
        email: email, otp: otp, userId: userId, roleType: roleType);
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
    return responseModel;
  }

  Future<ResponseModel> resetPassword(
      String password, String userId, int roleType) async {
    ApiResponse apiResponse = await repo.resetPassword(
        password: password, userId: userId, roleType: roleType);
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
    return responseModel;
  }

  disposeMethod() {
    clearPwd();
    clearConPwd();
    clearEmail();
  }

  clearPwd() {
    _passwordTextEditingController.clear();
    notifyListeners();
  }

  clearConPwd() {
    _conPasswordTextEditingController.clear();
    notifyListeners();
  }

  clearEmail() {
    _emailTextEditingController.clear();
    notifyListeners();
  }
}
