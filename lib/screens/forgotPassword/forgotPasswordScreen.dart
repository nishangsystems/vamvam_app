import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/forgotPasswordProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/utils/constant.dart';

import '../../helpers/regexHelper.dart';
import '../../utils/colors.dart';
import '../../utils/fontConstant.dart';
import '../../widgets/commonWidgets/commonWidgets.dart';
import '../../widgets/commonWidgets/customTextFormField.dart';
import '../loader/loaderOverlay.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Provider.of<ForgotPasswordProvider>(context, listen: false).disposeMethod();
  }

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
                        title: 'Forgot Password',
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
                              child: Text("Forgot Password",
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
                              textRegex: emailExpression,
                              controller: data.emailTextEditingController,
                              keyboardType: TextInputType.emailAddress,
                              title: 'Email Id',
                              length: 35,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            commonButtonWhite(
                                width: double.infinity,
                                bgColors: [Colors.white, Colors.white70],
                                title: 'SEND OTP',
                                txtColor: textColorButton,
                                fontSize: FontConstant.m,
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    data
                                        .forgetPassword(
                                            data.emailTextEditingController.text
                                                .toString(),
                                            auth,
                                            role.roleType)
                                        .then((value) {
                                      if (value.isSuccess) {
                                        auth.clearMobileText();
                                        context.push(verifyOTP);
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
