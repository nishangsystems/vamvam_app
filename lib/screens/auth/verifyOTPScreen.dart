import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/data/model/params/loginModelParams.dart';
import 'package:vam_vam/data/model/params/verifyOtpModelParams.dart';
import 'package:vam_vam/providers/forgotPasswordProvider.dart';
import 'package:vam_vam/providers/profileprovider.dart';
import 'package:vam_vam/providers/registerProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/widgets/commonWidgets/commonWidgets.dart';

import '../../helpers/enumHelper.dart';
import '../../providers/AuthProvider.dart';
import '../../utils/constant.dart';
import '../../utils/colors.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key});

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  int time = 30;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const duration = Duration(seconds: 1);
    Timer.periodic(duration, (timer) {
      setState(() {
        time--;
      });
      if (time == 0) {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Consumer5<AuthProvider, ProfileProvider, RegisterProvider,
            ForgotPasswordProvider, RoleProvider>(
        builder: (context, data, profile, reg, forget, role, child) =>
            LoadingOverlay(
              isLoading: data.isLoading,
              child: Scaffold(
                  body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.03),
                        commonBackButton(
                            context: context,
                            title: '',
                            backBtnColor: backButton),
                        SizedBox(height: height * 0.03),
                        Text(
                            "Verify with OTP sent to ${data.mobileTextEditingController.text.isNotEmpty ? data.mobileTextEditingController.text : forget.emailTextEditingController.text}",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500)),
                        SizedBox(height: height * 0.05),
                        Center(
                          child: Pinput(
                            androidSmsAutofillMethod:
                                AndroidSmsAutofillMethod.smsRetrieverApi,
                            length: 4,
                            controller: data.pinPutController,
                            keyboardType: TextInputType.phone,
                            defaultPinTheme: PinTheme(
                              width: 56,
                              height: 56,
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: black,
                                  fontWeight: FontWeight.w600),
                              decoration: BoxDecoration(
                                border: Border.all(color: primaryDark),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onChanged: (value) => data.onChanged(value),
                          ),
                        ),
                        SizedBox(height: 45),
                        time == 0
                            ? Center(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      time = 30;
                                      startTimer();
                                    });
                                    if (data.mobileTextEditingController.text
                                        .isNotEmpty) {
                                      LoginModelParams loginModelParams =
                                          LoginModelParams(
                                              mobileEmail: data
                                                  .mobileTextEditingController
                                                  .text
                                                  .trim()
                                                  .toString(),
                                              password: '',
                                              loginType: 'mobile',
                                              deviceType: Platform.isAndroid
                                                  ? 'android'
                                                  : 'ios',
                                              deviceToken:
                                                  data.deviceToken ?? 'sdf');
                                      data
                                          .login(loginModelParams, profile, reg,
                                              role.roleType, context)
                                          .then((value) {
                                        customToast(
                                            msg: value.message,
                                            color: value.isSuccess
                                                ? successColor
                                                : errorColor);
                                      });
                                    } else {
                                      data.startLoader(true);
                                      forget
                                          .forgetPassword(
                                              forget.emailTextEditingController
                                                  .text
                                                  .trim()
                                                  .toString(),
                                              data,
                                              role.roleType)
                                          .then((value) {
                                        data.startLoader(false);
                                        customToast(
                                            msg: value.message,
                                            color: value.isSuccess
                                                ? successColor
                                                : errorColor);
                                      });
                                    }
                                  },
                                  child: Text(
                                    "Resend",
                                    style: TextStyle(
                                        color: primaryDark,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              )
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Resend OTP In ',
                                    style: TextStyle(
                                        color: black.withOpacity(0.7),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '00:$time',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: primaryDark),
                                  ),
                                ],
                              ),
                        SizedBox(height: 45),
                        commonButtonWhite(
                            width: double.infinity,
                            bgColors: data.pinPutController.text.length < 4
                                ? [
                                    otpLightButton.withOpacity(0.3),
                                    otpLightButton.withOpacity(0.4)
                                  ]
                                : [primaryDark, primaryDark],
                            title: 'Continue',
                            txtColor: Colors.white,
                            fontSize: 12,
                            onTap: () {
                              if (data.pinPutController.text.length == 4) {
                                if (data.mobileTextEditingController.text
                                    .isNotEmpty) {
                                  VerifyOtpModelParams verifyOtpModelParams =
                                      VerifyOtpModelParams(
                                          leaderId: data.userId,
                                          executiveId: data.userId,
                                          userId: data.userId,
                                          otp: data.pinPutController.text,
                                          deviceType: Platform.isAndroid
                                              ? 'android'
                                              : 'ios',
                                          // deviceType: 'android',
                                          deviceToken:
                                              data.deviceToken ?? 'sdfds');
                                  data
                                      .verifyOtp(verifyOtpModelParams, profile,
                                          reg, role.roleType, context)
                                      .then((value) {
                                    if (value.isSuccess) {
                                      // profile.getProfile(data.getUserId(), reg,
                                      //     role.roleType, context);
                                      customToast(
                                          msg: value.message,
                                          color: successColor);
                                      if (role.roleType ==
                                          getRoleType(RoleEnum.student)) {
                                        context.push(userBottomHomeBar);
                                      } else if (role.roleType ==
                                          getRoleType(RoleEnum.leader)) {
                                        context.push(adminBottomHomeBar);
                                      } else if (role.roleType ==
                                          getRoleType(RoleEnum.teacher)) {
                                        context
                                            .push(represantativeBottomHomeBar);
                                      } else {
                                        context
                                            .push(represantativeBottomHomeBar);
                                      }

                                      // context.go('$locationMapScreen/0');
                                    } else {
                                      customToast(
                                          msg: value.message,
                                          color: errorColor);
                                    }
                                  });
                                } else {
                                  data.startLoader(true);
                                  forget
                                      .verifyOtp(
                                          forget
                                              .emailTextEditingController.text,
                                          data.pinPutController.text,
                                          data.userId,
                                          role.roleType)
                                      .then((value) {
                                    data.startLoader(false);

                                    if (value.isSuccess) {
                                      context
                                          .pushReplacement(forgotPasswordReset);
                                      customToast(
                                          msg: value.message,
                                          color: successColor);
                                    } else {
                                      customToast(
                                          msg: value.message,
                                          color: errorColor);
                                    }
                                  });
                                }
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              )),
            ));
  }
}
