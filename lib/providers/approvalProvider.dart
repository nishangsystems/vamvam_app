import 'package:flutter/material.dart';
import 'package:vam_vam/data/model/base/apiResponse.dart';
import 'package:vam_vam/data/model/base/responseModel.dart';
import 'package:vam_vam/data/model/response/aprovalModel.dart';
import 'package:vam_vam/data/repo/approvalRepo.dart';
import 'package:vam_vam/utils/apiConstant.dart';

class ApprovalProvider extends ChangeNotifier {
  final ApprovalRepo approvalRepo;

  ApprovalProvider({required this.approvalRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<ApprovalModelData> _approvalList = [];
  List<ApprovalModelData> get approvalList => _approvalList;

  startLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<ResponseModel> repRequestApproval(
      {required String executiveId,
      required String compalintId,
      required String message}) async {
    startLoader(true);
    ApiResponse apiResponse = await approvalRepo.repRequestApproval(
        compalintId: compalintId, executiveId: executiveId, message: message);
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
    startLoader(false);
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> getRequestApproval(
      {required String executiveId,
      required int roleType,
      required String filterBy,
      required String status}) async {
    startLoader(true);
    _approvalList.clear();
    notifyListeners();
    ApiResponse apiResponse = await approvalRepo.getRequestApproval(
        executiveId: executiveId, roleType: roleType, filterBy: filterBy);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        if (status == '') {
          map['data'].forEach((item) {
            ApprovalModelData model = ApprovalModelData.fromJson(item);
            _approvalList.add(model);
          });
          notifyListeners();
        } else {
          map['data'].forEach((item) {
            ApprovalModelData model = ApprovalModelData.fromJson(item);
            if (status == item['status_string']) {
              _approvalList.add(model);
            }
          });
          notifyListeners();
        }
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
    startLoader(false);
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> changeApprovalStatus(
      {required String leaderId,
      required String status,
      required String message,
      required String id}) async {
    startLoader(true);
    _approvalList.clear();
    notifyListeners();
    ApiResponse apiResponse = await approvalRepo.changeApprovalStatus(
        id: id, leaderId: leaderId, message: message, status: status);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        responseModel = ResponseModel(true, map['message']);
        notifyListeners();
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
    startLoader(false);
    notifyListeners();
    return responseModel;
  }
}
