// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:vam_vam/data/model/params/updateProfileModelParams.dart';
import 'package:vam_vam/data/repo/profileRepo.dart';
import 'package:vam_vam/helpers/dialogHelper.dart';
import 'package:vam_vam/helpers/enumHelper.dart';
import 'package:vam_vam/providers/registerProvider.dart';
import 'package:vam_vam/utils/stringResources.dart';

import '../data/model/base/apiResponse.dart';
import '../data/model/base/responseModel.dart';
import '../data/model/response/student/studentProfileModel.dart';
import '../data/model/response/user/userProfileModel.dart';
import '../utils/apiConstant.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRepo profileRepo;

  ProfileProvider({required this.profileRepo});

  UserProfileModelData _userProfileInfo = UserProfileModelData();
  UserProfileModelData get userProfileInfo => _userProfileInfo;

  StudentProfileModel _studentProfileModel = StudentProfileModel();
  StudentProfileModel get studentProfileModel => _studentProfileModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  startLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  clearUserDetails() {
    _userProfileInfo = UserProfileModelData();
    notifyListeners();
  }

  saveUserProfileData(var data) {
    _userProfileInfo = UserProfileModelData.fromJson(data);
    notifyListeners();
  }

  setUserDetails(RegisterProvider register, int roleType, BuildContext role,
      {String? isFirst}) {
    if (_userProfileInfo.voterId != null &&
        _userProfileInfo.voterId!.isNotEmpty) {
      register.setVoterId('${_userProfileInfo.voterId}');
    }
    if (_userProfileInfo.aadhaarCard != null &&
        _userProfileInfo.aadhaarCard!.isNotEmpty) {
      register.setAadharNo('${_userProfileInfo.aadhaarCard}');
    }
    if (_userProfileInfo.name != null && _userProfileInfo.name!.isNotEmpty) {
      register.setName('${_userProfileInfo.name}');
    }
    if (_userProfileInfo.dob != null) {
      register.setDob('${_userProfileInfo.dob}');
    }
    if (_userProfileInfo.gender != null &&
        _userProfileInfo.gender!.isNotEmpty) {
      register.setSelectedGender('${_userProfileInfo.gender}');
    }
    if (_userProfileInfo.guardianName != null &&
        _userProfileInfo.guardianName!.isNotEmpty) {
      register.setGuardianName('${_userProfileInfo.guardianName}');
    }
    if (_userProfileInfo.mobile != null &&
        _userProfileInfo.mobile!.isNotEmpty) {
      register.setMobileNo('${_userProfileInfo.mobile}');
    }
    if (_userProfileInfo.email != null && _userProfileInfo.email!.isNotEmpty) {
      register.setEmailId('${_userProfileInfo.email}');
    }
    if (_userProfileInfo.locality != null &&
        _userProfileInfo.locality!.isNotEmpty) {
      register.setStreet('${_userProfileInfo.locality}');
    }
    if (_userProfileInfo.houseNo != null &&
        _userProfileInfo.houseNo!.isNotEmpty) {
      register.setHouseNo('${_userProfileInfo.houseNo}');
    }
    if (_userProfileInfo.pincode != null &&
        _userProfileInfo.pincode!.isNotEmpty) {
      register.setPinCode('${_userProfileInfo.pincode}');
    }
    if (_userProfileInfo.relation != 'null') {
      register.setSelectedRelation(_userProfileInfo.relation);
    }
    if (roleType == getRoleType(RoleEnum.student)) {
      if (_userProfileInfo.stateName != null &&
          _userProfileInfo.stateName!.isNotEmpty) {
        register.setSelectedState(_userProfileInfo.stateName, _userProfileInfo,
            isFirstTime: isFirst);
      }
    }

    if (_userProfileInfo.area != null && _userProfileInfo.area!.isNotEmpty) {
      register.setSelectedArea(_userProfileInfo.area);
    }
    // print("Town Or Village NAme: ");
    // print(_userProfileInfo.townVillageName);
    if (_userProfileInfo.townVillageName != null &&
        _userProfileInfo.townVillageName!.isNotEmpty) {
      register.setSelectedTownOrVillage(_userProfileInfo.townVillageName);
    }
    if (_userProfileInfo.panchayatWardName != null &&
        _userProfileInfo.panchayatWardName!.isNotEmpty) {
      register.setSelectedPanchayatWard(_userProfileInfo.panchayatWardName);
    }
    if (_userProfileInfo.thanaName != null &&
        _userProfileInfo.thanaName!.isNotEmpty) {
      register.setSelectedThana(_userProfileInfo.thanaName);
    }
    if (_userProfileInfo.postOfficeName != null &&
        _userProfileInfo.postOfficeName!.isNotEmpty) {
      register.setSelectedPostOffice(_userProfileInfo.postOfficeName);
    }
  }

  //----------------------------- Apis Section -----------------------------
  Future<ResponseModel> getProfile(String userId, RegisterProvider register,
      int roleType, BuildContext context,
      {String? isFirst}) async {
    startLoader(true);
    ApiResponse apiResponse =
        await profileRepo.getProfile(userId: userId, roleType: roleType);
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
        _userProfileInfo = UserProfileModelData.fromJson(map['data']);
        notifyListeners();
        setUserDetails(register, roleType, context, isFirst: isFirst);
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

  // Get Student Profile
  Future<ResponseModel> getStudentProfile(BuildContext context,
      {String? isFirst}) async {
    startLoader(true);
    ApiResponse apiResponse = await profileRepo.getStudentProfile();
    ResponseModel responseModel;

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['data'] == null) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong');
      } else {
        if (map['data'] != null) {
          _studentProfileModel = StudentProfileModel.fromJson(map['data']);
        }
        responseModel = ResponseModel(true, 'Success');
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

  // Update Profile
  Future<ResponseModel> updateProfile(
      UpdateProfileModelParams updateProfileModelParams,
      String userId,
      RegisterProvider register,
      BuildContext context) async {
    startLoader(true);
    ApiResponse apiResponse = await profileRepo.updateProfile(
        updateProfileModelParams: updateProfileModelParams);
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
        getProfile(userId, register, getRoleType(RoleEnum.student), context);
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
