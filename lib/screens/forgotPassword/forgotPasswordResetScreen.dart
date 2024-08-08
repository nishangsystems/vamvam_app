import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/utils/constant.dart';

import '../../helpers/regexHelper.dart';
import '../../providers/AuthProvider.dart';
import '../../providers/forgotPasswordProvider.dart';
import '../../utils/colors.dart';
import '../../utils/fontConstant.dart';
import '../../widgets/commonWidgets/commonWidgets.dart';
import '../../widgets/commonWidgets/customTextFormField.dart';
import '../loader/loaderOverlay.dart';

class ForgotPasswordResetScreen extends StatefulWidget {
  const ForgotPasswordResetScreen({super.key});

  @override
  State<ForgotPasswordResetScreen> createState() =>
      _ForgotPasswordResetScreenState();
}

class _ForgotPasswordResetScreenState extends State<ForgotPasswordResetScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer3<ForgotPasswordProvider, AuthProvider, RoleProvider>(
      builder: (context, data, auth, role, child) => LoadingOverlay(
        isLoading: data.isLoading,
        child: Scaffold(
            backgroundColor: primaryDark,
            body: SafeArea(
              top: false,
              child: blueBackContainer(
                child: Column(
                  children: [
                    appBarHeaderContainer(
                        context: context,
                        title: 'Reset Password',
                        color: black),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            SizedBox(height: 30),
                            const Center(
                              child: Text("Reset Password",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      // decoration: TextDecoration.underline,
                                      decorationColor: Colors.white)),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(height: 30),
                            customTextFormField1(
                                textRegex: regex,
                                controller: data.passwordTextEditingController,
                                title: 'Password',
                                length: 25,
                                isPassword: true,
                                keyboardType: TextInputType.text,
                                isVisible: !data.isShowPwd,
                                onSuffixTap: () =>
                                    data.setShowPwd(!data.isShowPwd)),
                            SizedBox(
                              height: 20,
                            ),
                            customTextFormField1(
                                textRegex: regex,
                                controller:
                                    data.conPasswordTextEditingController,
                                title: 'Confirm Password',
                                length: 25,
                                keyboardType: TextInputType.text,
                                isPassword: true,
                                isVisible: !data.isShowConPwd,
                                onSuffixTap: () =>
                                    data.setShowConPwd(!data.isShowConPwd)),
                            SizedBox(
                              height: 50,
                            ),
                            commonButtonWhite(
                                width: double.infinity,
                                bgColors: [Colors.white, Colors.white70],
                                title: 'Reset Password',
                                txtColor: textColorButton,
                                fontSize: FontConstant.m,
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    if (data.passwordTextEditingController
                                            .text !=
                                        data.conPasswordTextEditingController
                                            .text) {
                                      customToast(
                                          msg:
                                              'Password and Confirm Password should be same',
                                          color: errorColor);
                                    } else {
                                      data
                                          .resetPassword(
                                              data.passwordTextEditingController
                                                  .text,
                                              auth.userId,
                                              role.roleType)
                                          .then((value) {
                                        if (value.isSuccess) {
                                          customToast(
                                              msg: value.message,
                                              color: successColor);
                                          context.go(login);
                                        } else {
                                          customToast(
                                              msg: value.message,
                                              color: errorColor);
                                        }
                                      });
                                    }
                                  }
                                })
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
