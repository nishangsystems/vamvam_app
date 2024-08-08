// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:vam_vam/data/repo/settingRepo.dart';
import 'package:vam_vam/helpers/dialogHelper.dart';
import 'package:vam_vam/utils/stringResources.dart';

import '../data/model/base/apiResponse.dart';
import '../data/model/base/responseModel.dart';
import '../utils/apiConstant.dart';

class SettingProvider extends ChangeNotifier {
  final SettingRepo settingRepo;

  SettingProvider({required this.settingRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  startLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //----------------------------- Apis Section -----------------------------
  Future<ResponseModel> deleteAccount(
      String userId, BuildContext context, int roleType) async {
    startLoader(true);
    ApiResponse apiResponse =
        await settingRepo.deleteAccount(userId: userId, roleType: roleType);
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
}
