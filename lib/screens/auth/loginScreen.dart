import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/data/model/params/loginModelParams.dart';
import 'package:vam_vam/data/model/response/schoolModel.dart';
import 'package:vam_vam/helpers/enumHelper.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/profileprovider.dart';
import 'package:vam_vam/providers/registerProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/providers/schoolsProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/utils/fontConstant.dart';
import 'package:vam_vam/utils/schoolPreference.dart';
import 'package:vam_vam/widgets/commonWidgets/customTextFormField.dart';

import '../../helpers/regexHelper.dart';
import '../../utils/colors.dart';
import '../../utils/constant.dart';
import '../../utils/paddingConstant.dart';
import '../../widgets/commonWidgets/commonWidgets.dart';

class LoginScreen extends StatefulWidget {
  final String schoolName;

  LoginScreen({super.key, required this.schoolName});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  // late SchoolRepo schoolRepo;

  @override
  void initState() {
    // schoolRepo = SchoolRepo(
    //   dioClient3: sl<DioClient3>(),
    //   dioClient1: sl<DioClient1>(),
    //   prefs: sl<SharedPreferences>(),
    // );
    Future.microtask(
        () => Provider.of<AuthProvider>(context, listen: false).disposeAuth());
    super.initState();
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Consumer5<AuthProvider, RoleProvider, ProfileProvider,
        RegisterProvider, SchoolsProvider>(
      builder: (context, data, role, profile, reg, schools, child) =>
          LoadingOverlay(
        isLoading: data.isLoading || loading,
        child: Scaffold(
          body: SafeArea(
            top: false,
            child: blueBackContainer(
              color: white,
              child: SingleChildScrollView(
                  child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    loginHeaderContainer(context),
                    SizedBox(height: height * 0.08),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Text(
                        widget.schoolName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            decorationColor: textColor),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          commonBackButton(
                              context: context,
                              title: '',
                              backBtnColor: textColor),
                          Center(
                            child: Text(
                                "Login as ${role.roleType == getRoleType(RoleEnum.student) ? 'Student' : role.roleType == getRoleType(RoleEnum.teacher) ? 'Teacher' : role.roleType == getRoleType(RoleEnum.leader) ? 'Executive' : 'Parent'}",
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    // decoration: TextDecoration.underline,
                                    decorationColor: textColor)),
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Student
                    if (role.roleType == getRoleType(RoleEnum.student)) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: customTextFormField1(
                          controller: data.emailTextEditingController,
                          title: 'Username',
                          keyboardType: TextInputType.text,
                          length: 50,
                        ),
                      ),

                      // Teacher
                    ] else if (role.roleType ==
                        getRoleType(RoleEnum.teacher)) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: customTextFormField1(
                          controller: data.emailTextEditingController,
                          title: "Email",
                          textRegex: emailExpression,
                          keyboardType: TextInputType.emailAddress,
                          length: 50,
                        ),
                      ),

                      // Parent
                    ] else if (role.roleType == getRoleType(RoleEnum.parent) ||
                        role.roleType == getRoleType(RoleEnum.leader)) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: customTextFormField1(
                          controller:
                              role.roleType == getRoleType(RoleEnum.parent)
                                  ? data.emailTextEditingController
                                  : data.mobileTextEditingController,
                          title: 'Phone',
                          inputFormatter: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          textRegex: mobileRegex,
                          keyboardType: TextInputType.phone,
                          length: role.roleType == getRoleType(RoleEnum.leader)
                              ? 10
                              : 9,
                        ),
                      ),
                    ],
                    if (role.roleType != getRoleType(RoleEnum.leader))
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 14, right: 14, top: 20, bottom: 10),
                        child: customTextFormField1(
                            textRegex: regex,
                            controller: data.passwordTextEditingController,
                            title: 'Password',
                            length: 25,
                            keyboardType: TextInputType.text,
                            isPassword: true,
                            isVisible: !data.isShowPwd,
                            onSuffixTap: () => data.setIsShow(!data.isShowPwd)),
                      ),
                    // ] else ...[
                    //   data.type == 'mobile'
                    //       ? Container(
                    //           margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    //           width: double.infinity,
                    //           decoration: BoxDecoration(
                    //             borderRadius:
                    //                 const BorderRadius.all(Radius.circular(8)),
                    //             border: Border.all(color: textColor),
                    //           ),
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               const Padding(
                    //                 padding: EdgeInsets.only(
                    //                     left: 20, top: 4.0, bottom: 4.0),
                    //               ),
                    //               IntrinsicHeight(
                    //                 child: Row(
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.stretch,
                    //                   children: [
                    //                     data.type == 'mobile'
                    //                         ? CountryCodePicker(
                    //                             padding: EdgeInsets.zero,
                    //                             onChanged: (value) =>
                    //                                 data.onCountryChange,
                    //                             textStyle: const TextStyle(
                    //                                 color: textColor,
                    //                                 fontWeight:
                    //                                     FontWeight.w800),
                    //                             showFlag: false,
                    //                             showFlagDialog: true,
                    //                             showDropDownButton: false,
                    //                             hideSearch: false,
                    //                             dialogSize:
                    //                                 const Size.square(350),
                    //                             dialogTextStyle:
                    //                                 const TextStyle(
                    //                                     color: black,
                    //                                     fontWeight:
                    //                                         FontWeight.w800),
                    //                             // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                    //                             initialSelection:
                    //                                 data.pickedCountryCode,
                    //                             favorite: const ['+91'],
                    //                           )
                    //                         : Container(),
                    //                     data.type == 'mobile'
                    //                         ? const Icon(
                    //                             Icons.keyboard_arrow_down,
                    //                             color: textColor)
                    //                         : Container(),
                    //                     data.type == 'mobile'
                    //                         ? const Padding(
                    //                             padding: EdgeInsets.symmetric(
                    //                                 vertical: 8.0),
                    //                             child: VerticalDivider(
                    //                                 color: textColor),
                    //                           )
                    //                         : Container(),
                    //                     data.type == 'mobile'
                    //                         ? const SizedBox(width: 0)
                    //                         : const SizedBox(width: 20),
                    //                     Expanded(
                    //                         child: TextFormField(
                    //                             controller: data
                    //                                 .mobileTextEditingController,
                    //                             keyboardType:
                    //                                 TextInputType.number,
                    //                             autovalidateMode:
                    //                                 AutovalidateMode
                    //                                     .onUserInteraction,
                    //                             autofocus: false,
                    //                             cursorColor: textColor,
                    //                             inputFormatters: [
                    //                               FilteringTextInputFormatter
                    //                                   .digitsOnly
                    //                             ],
                    //                             textInputAction:
                    //                                 TextInputAction.done,
                    //                             maxLength: 10,
                    //                             maxLines: null,
                    //                             onChanged: (value) {
                    //                               if (value.isEmpty) {
                    //                                 data.setMobileErrorText(
                    //                                     'Please enter mobile number');
                    //                               } else if (!mobileRegex
                    //                                   .hasMatch(value)) {
                    //                                 data.setMobileErrorText(
                    //                                     'Please enter valid mobile');
                    //                               } else if (value.length !=
                    //                                   10) {
                    //                                 data.setMobileErrorText(
                    //                                     'Please enter valid mobile');
                    //                               } else {
                    //                                 data.setMobileErrorText('');
                    //                               }
                    //                             },
                    //                             style: TextStyle(
                    //                                 color: textColor,
                    //                                 fontSize: 14,
                    //                                 fontWeight:
                    //                                     FontWeight.w500),
                    //                             decoration: InputDecoration(
                    //                                 counterText: '',
                    //                                 hintText: 'Enter Mobile No',
                    //                                 hintStyle: TextStyle(
                    //                                     color: textColor,
                    //                                     fontSize: 14,
                    //                                     fontWeight:
                    //                                         FontWeight.w500),
                    //                                 border: InputBorder.none)))
                    //                   ],
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         )
                    //       : Padding(
                    //           padding: const EdgeInsets.only(
                    //               left: 14, right: 14, top: 20, bottom: 10),
                    //           child: customTextFormField1(
                    //             textRegex: emailExpression,
                    //             controller: data.emailTextEditingController,
                    //             title: 'Email Id',
                    //             keyboardType: TextInputType.emailAddress,
                    //             length: 35,
                    //           ),
                    //         ),
                    // ],
                    Visibility(
                        visible:
                            data.mobileErrorText != '' && data.type == 'mobile',
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            data.mobileErrorText,
                            style: TextStyle(color: errorColor),
                          ),
                        )),
                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(right: 20.0),
                    //     child: Bounce(
                    //       duration: const Duration(microseconds: 110),
                    //       onPressed: () {
                    //         FocusScope.of(context).unfocus();
                    //         if (data.type == 'mobile') {
                    //           data.setType('email');
                    //         } else {
                    //           data.setType('mobile');
                    //         }
                    //       },
                    //       child: Text(
                    //         data.type == 'mobile'
                    //             ? 'Use Email ID'
                    //             : 'Use Mobile No',
                    //         style: const TextStyle(
                    //             color: textColor,
                    //             fontWeight: FontWeight.w900,
                    //             decoration: TextDecoration.underline,
                    //             decorationColor: textColor,
                    //             fontSize: 12),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     SizedBox(
                    //       width: 15,
                    //     ),
                    //     Checkbox(
                    //       value:
                    //           Provider.of<AuthProvider>(context, listen: true)
                    //               .isCheck,
                    //       onChanged: (value) {
                    //         data.setIsCheck();
                    //         setState(() {});
                    //       },
                    //       activeColor: primaryLight,
                    //       checkColor: white,
                    //     ),
                    //     Expanded(
                    //       child: RichText(
                    //         maxLines: 2,
                    //         text: TextSpan(
                    //           children: <TextSpan>[
                    //             TextSpan(
                    //               text: 'I accept the ',
                    //               style: TextStyle(
                    //                 color: textColor.withOpacity(0.8),
                    //                 decorationColor: textColor.withOpacity(0.8),
                    //               ),
                    //             ),
                    //             TextSpan(
                    //                 text: 'Terms of service',
                    //                 style: TextStyle(
                    //                     color: textColor,
                    //                     decorationColor: textColor,
                    //                     fontWeight: FontWeight.w600,
                    //                     decoration: TextDecoration.underline),
                    //                 recognizer: TapGestureRecognizer()
                    //                   ..onTap = () => Navigator.push(
                    //                       context,
                    //                       MaterialPageRoute(
                    //                           builder: (context) =>
                    //                               WebViewScreen(
                    //                                 status:
                    //                                     PrivacyTermsEnum.terms,
                    //                               )))),
                    //             TextSpan(
                    //               text: ' and ',
                    //               style: TextStyle(
                    //                 color: textColor.withOpacity(0.8),
                    //                 fontSize: 12,
                    //               ),
                    //             ),
                    //             TextSpan(
                    //                 text: 'Privacy policy',
                    //                 style: TextStyle(
                    //                     color: textColor,
                    //                     decorationColor: textColor,
                    //                     fontWeight: FontWeight.w600,
                    //                     decoration: TextDecoration.underline),
                    //                 recognizer: TapGestureRecognizer()
                    //                   ..onTap = () => Navigator.push(
                    //                       context,
                    //                       MaterialPageRoute(
                    //                           builder: (context) =>
                    //                               WebViewScreen(
                    //                                 status: PrivacyTermsEnum
                    //                                     .privacy,
                    //                               )))),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //   ],
                    // ),

                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 50),
                      child: commonButtonWhite(
                          width: double.infinity,
                          bgColors: [primaryLight, primaryLight],
                          title: 'Log In',
                          txtColor: white,
                          fontSize: FontConstant.m,
                          onTap: () {
                            // if (role.roleType != getRoleType(RoleEnum.parent)) {
                            if (formKey.currentState!.validate()) {
                              // if (!data.isCheck) {
                              //   showPrivacyError();
                              // } else {
                              //  _login(data, profile, reg, role, schools);
                              // }

                              _login(data, profile, reg, role, schools);
                            }
                            // }
                            // else {
                            //   if (data.type == 'mobile') {
                            //     if (data
                            //         .mobileTextEditingController.text.isEmpty) {
                            //       data.setMobileErrorText(
                            //           "Please enter mobile number");
                            //     } else if (data.mobileTextEditingController.text
                            //             .length !=
                            //         10) {
                            //       data.setMobileErrorText(
                            //           "Please enter valid mobile number");
                            //     } else if (!data.isCheck) {
                            //       showPrivacyError();
                            //     } else {
                            //       _login(data, profile, reg, role);
                            //     }
                            //   }
                            // }
                          }),
                    ),
                    const SizedBox(height: 15),
                    Visibility(
                      visible: data.type == 'email' ? true : false,
                      child: Padding(
                        padding: EdgeInsets.only(right: PaddingConstant.xxl),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Bounce(
                            duration: Duration(milliseconds: 300),
                            onPressed: () => context.push(forgotPassword),
                            child: Text("Forgot Password ?",
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    decorationColor: textColor)),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    // Center(
                    //   child: Bounce(
                    //     duration: Duration(milliseconds: 100),
                    //     onPressed: () {
                    //       data.setIsSkip(true);
                    //       // context.push('$locationMapScreen/0');
                    //       if (role.roleType == getRoleType(RoleEnum.student)) {
                    //         context.push(userBottomHomeBar);
                    //       } else if (role.roleType ==
                    //           getRoleType(RoleEnum.parent)) {
                    //         context.push(adminBottomHomeBar);
                    //       } else if (role.roleType ==
                    //           getRoleType(RoleEnum.teacher)) {
                    //         context.push(represantativeBottomHomeBar);
                    //       } else {
                    //         context.push(represantativeBottomHomeBar);
                    //       }
                    //     },
                    //     child: Text('Skip',
                    //         style: TextStyle(
                    //           fontSize: 14,
                    //           color: textColor.withOpacity(0.5),
                    //           fontWeight: FontWeight.w600,
                    //         )),
                    //   ),
                    // )
                  ],
                ),
              )),
            ),
          ),
        ),
      ),
    );
  }

  _login(AuthProvider data, ProfileProvider profile, RegisterProvider register,
      RoleProvider role, SchoolsProvider schools) {

    setState(() {
      loading = true;
    });
    data.setIsSkip(false);
    LoginModelParams loginModelParams = LoginModelParams(
        mobileEmail: data.type == 'mobile'
            ? data.mobileTextEditingController.text.toString()
            : data.emailTextEditingController.text.toString(),
        password: data.passwordTextEditingController.text,
        loginType: data.type,
        deviceType: Platform.isAndroid ? 'android' : 'ios',
        // deviceType: 'android',
        deviceToken: data.deviceToken ?? 'dfsafdfs');

    if (role.roleType == getRoleType(RoleEnum.student)) {
      data
          .login1(data.emailTextEditingController.text.toString(),
              data.passwordTextEditingController.text, context)
          .then((value) async {
              if (value.isSuccess) {
                School? school = await schools.getSchoolByName(widget.schoolName);
                SchoolPreference.saveSchool(school);
                customToast(msg: value.message, color: successColor);
                context.pushReplacement(userBottomHomeBar);
              } else {
                customToast(msg: value.message, color: errorColor);
              }
              setState(() {
                loading = false;
              });
      });
    } else if (role.roleType == getRoleType(RoleEnum.teacher)) {
      data
          .teacherLogin(data.emailTextEditingController.text.toString(),
              data.passwordTextEditingController.text, context)
          .then((value) async {
        if (value.isSuccess) {
          School? school = await schools.getSchoolByName(widget.schoolName);
          SchoolPreference.saveSchool(school);

          customToast(msg: value.message, color: successColor);
          context.push(represantativeBottomHomeBar);
        } else {
          customToast(msg: value.message, color: errorColor);
        }
        setState(() {
          loading = false;
        });
      });
    } else {

      data
          .login(loginModelParams, profile, register, role.roleType, context)
          .then((value) async {
        if (value.isSuccess) {
          customToast(msg: value.message, color: successColor);
          if (data.type == 'mobile') {
            context.push(verifyOTP);
          } else {
            if (role.roleType == getRoleType(RoleEnum.student)) {
              School? school = await schools.getSchoolByName(widget.schoolName);
              SchoolPreference.saveSchool(school);

              context.push(userBottomHomeBar);
            } else if (role.roleType == getRoleType(RoleEnum.parent)) {
              School? school = await schools.getSchoolByName(widget.schoolName);
              SchoolPreference.saveSchool(school);

              context.push(adminBottomHomeBar);
            } else if (role.roleType == getRoleType(RoleEnum.teacher)) {
              School? school = await schools.getSchoolByName(widget.schoolName);
              SchoolPreference.saveSchool(school);

              context.push(represantativeBottomHomeBar);
            } else {
              School? school = await schools.getSchoolByName(widget.schoolName);
              SchoolPreference.saveSchool(school);

              context.push(represantativeBottomHomeBar);
            }
          }
        } else {
          customToast(
              msg: value.message == 'Sorry, this mobile number not register'
                  ? 'Sorry, this is an unregistered number'
                  : value.message,
              color: errorColor);
        }
        loading = false;
      });
    }
  }

  showPrivacyError() {
    customToast(
        msg: 'Select terms of service and privacy policy', color: errorColor);
  }
}
