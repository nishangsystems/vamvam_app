import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/providers/profileprovider.dart';
import 'package:vam_vam/providers/registerProvider.dart';
import 'package:vam_vam/utils/constant.dart';
import '../data/model/base/apiResponse.dart';
import '../data/model/base/responseModel.dart';
import '../data/model/params/loginModelParams.dart';
import '../data/repo/authRepo.dart';
import '../helpers/commonHelper.dart';
import '../helpers/enumHelper.dart';
import '../utils/apiConstant.dart';
import '../utils/colors.dart';


class ParentAuthProvider extends ChangeNotifier {
  final AuthRepo authRepo;

  ParentAuthProvider({required this.authRepo});

  bool isSubmitLoading = false;

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  final TextEditingController cPasswordController = TextEditingController();

  String? email;
  String? password;
  String? confirmPassword;
  String? mobileNumber;
  String? userName;
  String? phoneNo;
  String? phoneCode = "+237";

  bool agreeTC = false;

  RegExp regex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  updateAgreeTC() {
    agreeTC = !agreeTC;
    notifyListeners();
  }

  void setCountryCode(String s) {
    phoneCode = s;
    notifyListeners();
  }

  void gotToNext(BuildContext context) {

    if(phoneCode == "" || phoneController.text.length < 6){
      customToast(
          msg:"Invalid phone number",
          color: errorColor);
    }else{
      print("${phoneCode}${phoneController.text}");
      onVerifyPhone(context, "${phoneCode}${phoneController.text}");
    }
  }

  var verificationId = null;
  var forceResendingToken = null;

  onVerifyPhone(BuildContext context, String phone_number) {
    isSubmitLoading = true;
    notifyListeners();
    fb.FirebaseAuth _auth = fb.FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
      phoneNumber: phone_number,
      codeSent: (verificationId, forceResendingToken) {
        isSubmitLoading = false;
        notifyListeners();
        this.verificationId = verificationId;
        this.forceResendingToken = forceResendingToken;
        context.push(verifyPhonePage);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
      verificationCompleted: (fb.AuthCredential authCredential) async {

      },
      verificationFailed: (authException) {
        isSubmitLoading = false;
        notifyListeners();
        customToast(
            msg:authException.message ?? "Verification failed",
            color: errorColor);
      },
    );
  }


  verifyPhone(BuildContext context) {
    isSubmitLoading  = true;
    notifyListeners();
    fb.FirebaseAuth auth = fb.FirebaseAuth.instance;
    fb.AuthCredential credential = fb.PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: code);

    auth.signInWithCredential(credential).catchError((error) {
      isSubmitLoading  = false;
      print("////////////");
      notifyListeners();
      print(error);
      customToast(
          msg:"Invalid Verification code",
          color: errorColor);
      context.pop();
    }).then((value) async {
      parentLogin("${phoneCode}${phoneController.text}", "", context);
    });
  }




  Future<ResponseModel> parentLogin(
      String phone, String password, BuildContext context) async {
    print("here");
    isSubmitLoading  = true;
    notifyListeners();
    ApiResponse apiResponse =
    await authRepo.parentLogin(phone: phone, password: password);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      print(apiResponse.response!.data);
      if (map['status'] != successCode1) {
        responseModel =
            ResponseModel(false, map['message'] ?? 'Something Went Wrong!');
        customToast(
            msg: map['message'] ?? 'Something Went Wrong!',
            color: errorColor);
        context.pop();
      } else {
        saveUserIdAndUserToken1('${map['token']}', 'parent_id');
        context.push(paretnBottomHomeBar);
        responseModel = ResponseModel(true, 'Login Successfully');
      }

    } else {
      String errorMessage;

      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      customToast(
          msg:errorMessage,
          color: errorColor);
      responseModel = ResponseModel(false, errorMessage);
    }
    notifyListeners();
    isSubmitLoading  = false;
    notifyListeners();
    return responseModel;
  }

  String code = "";
  void setVerificationCode(String value) {
    code = value;
    notifyListeners();
  }

  saveUserIdAndUserToken1(token, userId) {
    authRepo.saveUserIdAndToken1(token, userId);
  }


}
