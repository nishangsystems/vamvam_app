import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/utils/colors.dart';

import '../../../providers/ParentAuthProvider.dart';
class ProfileVerifyPhone extends StatefulWidget {

  const ProfileVerifyPhone();

  @override
  _ProfileVerifyPhoneState createState() => new _ProfileVerifyPhoneState();
}

class _ProfileVerifyPhoneState extends State<ProfileVerifyPhone> {


  _ProfileVerifyPhoneState();

  @override
  void initState() {
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var phoneHeight = mediaQuery.size.height;
    var phoneWidth = mediaQuery.size.width;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Consumer<ParentAuthProvider>(
      builder: (context, controller, child)=> LoadingOverlay(isLoading: controller.isSubmitLoading, child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
              decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .scaffoldBackgroundColor,
              ),
              width: phoneWidth,
              height: phoneHeight,
              alignment: Alignment.center,
              child: Center(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: phoneWidth,
                    padding:
                    EdgeInsets.symmetric(
                        horizontal: phoneWidth * 0.05),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Verify Phone Number",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Enter the 6 - digit verification code we sent to phone number ${ controller.phoneCode }${
                                controller.phoneController.text
                            }',
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 30),
                          PinCodeTextField(
                            appContext: context,
                            pastedTextStyle: const TextStyle(
                              color: primaryDark,
                              fontWeight: FontWeight.bold,
                            ),
                            length: 6,
                            obscureText: false,
                            blinkWhenObscuring: false,
                            animationType: AnimationType.fade,
                            pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(
                                    5),
                                fieldHeight: 50,
                                fieldWidth: 50,
                                selectedColor: primaryDark,
                                inactiveColor: primaryDark,
                                activeColor: primaryDark),
                            animationDuration: Duration(
                                milliseconds: 300),
                            keyboardType: TextInputType.number,
                            onCompleted: (v) {},
                            onChanged: (value) {
                              controller.setVerificationCode(value);
                            },
                            beforeTextPaste: (text) {
                              return true;
                            },
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: phoneWidth * 0.1),
                            child: TextButton(
                              onPressed: () {
                                controller.verifyPhone(context);
                              },
                              style: ButtonStyle(
                                  padding:
                                  MaterialStateProperty.all<
                                      EdgeInsets>(
                                      const EdgeInsets.symmetric(
                                          horizontal: 30.0,
                                          vertical: 10)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius
                                            .circular(30.0),
                                      )),
                                  // alignment: AlignmentGeometry.,

                                  backgroundColor: MaterialStateProperty
                                      .all(controller.isSubmitLoading? primaryLight: primaryDark)),
                              child:  Text(
                                controller.isSubmitLoading? "Loading ...":"Verify",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ))
      ))
    ));
  }
}
