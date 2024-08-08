// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:vam_vam/data/repo/bannerRepo.dart';
import 'package:vam_vam/helpers/dialogHelper.dart';

import '../data/model/base/apiResponse.dart';
import '../data/model/base/responseModel.dart';
import '../data/model/response/user/bannerModel.dart';
import '../utils/apiConstant.dart';
import '../utils/stringResources.dart';

class BannerProvider extends ChangeNotifier {
  final BannerRepo bannerRepo;

  BannerProvider({required this.bannerRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<BannerModelData> _bannerList = [];
  List<BannerModelData> get bannertList => _bannerList;

  int _activeIndex = 0;
  int get activeIndex => _activeIndex;

  startLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  setActiveIndex(int value) {
    _activeIndex = value;
    notifyListeners();
  }

  //----------------------------- Apis Section -----------------------------
  Future<ResponseModel> getBanner(int roleType, BuildContext context) async {
    startLoader(true);
    ApiResponse apiResponse = await bannerRepo.getBanner(roleType: roleType);
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
        _bannerList.clear();
        notifyListeners();
        map['data'].forEach((item) {
          BannerModelData model = BannerModelData.fromJson(item);
          _bannerList.add(model);
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
}
