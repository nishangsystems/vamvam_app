// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/data/model/params/loginModelParams.dart';
import 'package:vam_vam/data/repo/authRepo.dart';
import 'package:vam_vam/helpers/enumHelper.dart';
import 'package:vam_vam/providers/profileprovider.dart';
import 'package:vam_vam/providers/registerProvider.dart';

import '../data/model/base/apiResponse.dart';
import '../data/model/base/responseModel.dart';
import '../data/model/params/verifyOtpModelParams.dart';
import '../utils/apiConstant.dart';
import '../utils/constant.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepo authRepo;

  AuthProvider({required this.authRepo});

  final TextEditingController _mobileTextEditingController =
      TextEditingController();
  TextEditingController get mobileTextEditingController =>
      _mobileTextEditingController;

  final TextEditingController _emailTextEditingController =
      TextEditingController();
  TextEditingController get emailTextEditingController =>
      _emailTextEditingController;

  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  TextEditingController get passwordTextEditingController =>
      _passwordTextEditingController;

  String _pickedCountryCode = '+91';
  String get pickedCountryCode => _pickedCountryCode;

  String _type = 'mobile';
  String get type => _type;

  final TextEditingController _pinPutController = TextEditingController();
  TextEditingController get pinPutController => _pinPutController;

  final TextEditingController _searchTextEditingController =
      TextEditingController();
  TextEditingController get searchTextEditingController =>
      _searchTextEditingController;

  final List<PlacesSearchResult> _searchAddressList = [];
  List<PlacesSearchResult> get searchAddressList => _searchAddressList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _userId = '';
  String get userId => _userId;

  bool _isCheck = false;
  bool get isCheck => _isCheck;

  String _mobileErrorText = '';
  String get mobileErrorText => _mobileErrorText;

  String? _deviceToken;
  String? get deviceToken => _deviceToken;

  bool _isShowPwd = true;
  bool get isShowPwd => _isShowPwd;

  bool _isSkip = false;
  bool get isSkip => _isSkip;

  setIsSkip(bool value) {
    _isSkip = value;
    notifyListeners();
  }

  setIsShow(bool value) {
    _isShowPwd = value;
    notifyListeners();
  }

  setIsCheck() {
    _isCheck = !_isCheck;
    notifyListeners();
  }

  setPinPutController(String value) {
    _pinPutController.text = value;
    _pinPutController.selection = TextSelection.fromPosition(
      TextPosition(offset: _pinPutController.text.length),
    );
    notifyListeners();
  }

  setUserId(String value) {
    _userId = value;
    notifyListeners();
  }

  setMobileErrorText(String value) {
    _mobileErrorText = value;
    notifyListeners();
  }

  setPickedCountryCode(String value) {
    _pickedCountryCode = value;
    notifyListeners();
  }

  setType(String value) {
    _type = value;
    notifyListeners();
  }

  onCountryChange(CountryCode value) {
    setPickedCountryCode('$value');
  }

  onChanged(String value) {
    setPinPut(value);
  }

  setPinPut(String value) {
    _pinPutController.text = value;
    notifyListeners();
  }

  clearMobileTextEditingController() {
    _mobileTextEditingController.text = '';
    _emailTextEditingController.text = '';
    _pinPutController.text = '';
    _searchTextEditingController.text = '';
    notifyListeners();
  }

  startLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  String getUserToken() {
    return authRepo.getUserToken();
  }

  String getUserId() {
    return authRepo.getUserId();
  }

  saveUserIdAndUserToken(token, userId) {
    authRepo.saveUserIdAndToken(token, userId);
  }

  saveUserIdAndUserToken1(token, userId) {
    authRepo.saveUserIdAndToken1(token, userId);
  }

  logout(BuildContext context) {
    authRepo.clearSharedData();
    context.go(splash);
  }

  getDeviceToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();
    debugPrint("DEVICE_TOKEN>>> $token");
    _deviceToken = token;
    notifyListeners();
  }

  //----------------------------- Apis Section -----------------------------
  Future<ResponseModel> login(
      LoginModelParams loginModelParams,
      ProfileProvider profile,
      RegisterProvider registerProvider,
      int roleType,
      BuildContext context) async {
    startLoader(true);
    ApiResponse apiResponse = await authRepo.login(
        loginModelParams: loginModelParams, roleType: roleType);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        String id = roleType == getRoleType(RoleEnum.student)
            ? map['data']['user_id']
            : roleType == getRoleType(RoleEnum.teacher)
                ? map['data']['executive_id']
                : roleType == getRoleType(RoleEnum.parent)
                    ? map['data']['parent_id']
                    : map['data']['leader_id'];
        if (roleType == getRoleType(RoleEnum.leader)) {
          setPinPutController(map['data']['otp']);
          setUserId(id);
        } else {
          saveUserIdAndUserToken(map['data']['api_token'], id);
          clearEmailText();
          clearMobileTextEditingController();
          profile.getProfile(id, registerProvider, roleType, context);
          if (roleType == getRoleType(RoleEnum.student)) {
            profile.getStudentProfile(context);
          }
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
    notifyListeners();
    startLoader(false);
    return responseModel;
  }

  Future<ResponseModel> login1(
      String userName, String password, BuildContext context) async {
    startLoader(true);
    ApiResponse apiResponse =
        await authRepo.login1(userName: userName, password: password);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['status'] != successCode1) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        var data = map['user'];
        saveUserIdAndUserToken1(map['token'].toString(), data['id'].toString());
        await login(
                LoginModelParams(
                    deviceType: Platform.isAndroid ? 'android' : 'ios',
                    deviceToken: _deviceToken,
                    //  email: 'test@gmail.com',
                    // mobile: '995609533',
                    // username: 'test',
                    // name: 'Test'
                    email: data['email'],
                    mobile: data['phone'],
                    username: data['matric'],
                    name: data['name']),
                // authRepo.saveAcademicYear();
                // authRepo.saveSemester();
                Provider.of<ProfileProvider>(context, listen: false),
                Provider.of<RegisterProvider>(context, listen: false),
                getRoleType(RoleEnum.student),
                context)
            .then((value) {
          responseModel = value;
          clearEmailText();
          clearMobileTextEditingController();
          clearPasswordText();
        });
        responseModel = ResponseModel(true, 'Login Successfully');
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

  Future<ResponseModel> teacherLogin(
      String email, String password, BuildContext context) async {
    startLoader(true);
    ApiResponse apiResponse =
        await authRepo.teacherLogin(email: email, password: password);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['status'] != successCode1) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        var data = map['user'];
        saveUserIdAndUserToken1(map['token'].toString(), data['id'].toString());
        await login(
                LoginModelParams(
                    deviceType: Platform.isAndroid ? 'android' : 'ios',
                    deviceToken: _deviceToken,
                    //  email: 'test@gmail.com',
                    // mobile: '995609533',
                    // username: 'test',
                    // name: 'Test'
                    email: data['email'],
                    mobile: data['phone'],
                    username: data['username'],
                    name: data['name'],
                    address: data['address']),
                // authRepo.saveAcademicYear();
                // authRepo.saveSemester();
                Provider.of<ProfileProvider>(context, listen: false),
                Provider.of<RegisterProvider>(context, listen: false),
                getRoleType(RoleEnum.teacher),
                context)
            .then((value) {
          responseModel = value;
          clearEmailText();
          clearMobileTextEditingController();
          clearPasswordText();
        });
        responseModel = ResponseModel(true, 'Login Successfully');
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

  Future<ResponseModel> parentLogin(
      String phone, String password, BuildContext context) async {
    startLoader(true);
    ApiResponse apiResponse =
        await authRepo.parentLogin(phone: phone, password: password);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['status'] != successCode1) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        saveUserIdAndUserToken1('${map['token']}', 'parent_id');
        await getParentProfile(context).then((value) {
          responseModel = value;
        });
        responseModel = ResponseModel(true, 'Login Successfully');
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

  Future<ResponseModel> getParentProfile(BuildContext context) async {
    startLoader(true);
    ApiResponse apiResponse = await authRepo.getParentProfile();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['data'] == null) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        var data = map['data'];
        await login(
                LoginModelParams(
                  deviceType: Platform.isAndroid ? 'android' : 'ios',
                  deviceToken: _deviceToken,
                  mobile: data['phone'],
                  name: data['name'],
                ),
                Provider.of<ProfileProvider>(context, listen: false),
                Provider.of<RegisterProvider>(context, listen: false),
                getRoleType(RoleEnum.parent),
                context)
            .then((value) {
          if (value.isSuccess) {
            clearEmailText();
            clearMobileTextEditingController();
            clearPasswordText();
          }
          responseModel = value;
        });
        responseModel = ResponseModel(true, 'Login Successfully');
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

  Future<ResponseModel> logoutBiaka(BuildContext context) async {
    startLoader(true);
    ApiResponse apiResponse = await authRepo.logout();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['status'] != successCode1) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
      } else {
        logout(context);
        responseModel = ResponseModel(true, 'Logout Successfully');
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
      VerifyOtpModelParams verifyOtpModelParams,
      ProfileProvider profile,
      RegisterProvider register,
      int roleType,
      BuildContext context) async {
    startLoader(true);
    ApiResponse apiResponse = await authRepo.verifyOtp(
        verifyOtpModelParams: verifyOtpModelParams, roleType: roleType);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      if (map['code'] != successCode) {
        responseModel = ResponseModel(false, map['message']);
      } else {
        String id = roleType == getRoleType(RoleEnum.student)
            ? map['data']['user_id']
            : roleType == getRoleType(RoleEnum.teacher)
                ? map['data']['executive_id']
                : map['data']['leader_id'];
        saveUserIdAndUserToken(map['data']['api_token'], id);
        profile.getProfile(id, register, roleType, context, isFirst: '1');
        clearMobileText();
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

  //------------------------- Dispose -----------------------
  clearMobileText() {
    _mobileTextEditingController.clear();
    notifyListeners();
    clearIsCheck();
  }

  clearEmailText() {
    _emailTextEditingController.clear();
    notifyListeners();
    clearIsCheck();
  }

  clearPasswordText() {
    _passwordTextEditingController.clear();
    notifyListeners();
  }

  clearIsCheck() {
    _isCheck = false;
    notifyListeners();
  }

  disposeAuth() {
    clearMobileText();
    clearEmailText();
    clearPasswordText();
    clearIsCheck();
    _mobileErrorText = '';
    notifyListeners();
  }
}
