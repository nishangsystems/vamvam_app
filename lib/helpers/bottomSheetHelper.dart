import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vam_vam/helpers/regexHelper.dart';

import '../screens/loader/loaderOverlay.dart';
import '../utils/colors.dart';
import '../utils/fontConstant.dart';
import '../utils/paddingConstant.dart';
import '../widgets/commonWidgets/commonWidgets.dart';
import '../widgets/commonWidgets/customTextFormField.dart';

class BottomSheetHelper {
  Future<void> showImageBottomSheet({
    required BuildContext context,
    required Function() onCamera,
    required Function() onGallery,
  }) async {
    showModalBottomSheet(
        context: context,
        builder: (context) => CupertinoActionSheet(
              message: Text('Choose Image'),
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () => onCamera(), child: Text('Camera')),
                CupertinoActionSheetAction(
                    onPressed: () => onGallery(), child: Text('Gallery')),
              ],
            ));
  }

  Future<void> showForgotPasswordBottomSheet(
      {required BuildContext context,
      required TextEditingController controller}) async {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      isScrollControlled: true,
      elevation: 10,
      enableDrag: true,
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            decoration: BoxDecoration(
              color: primaryDark,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(PaddingConstant.m),
              child: LoadingOverlay(
                isLoading: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Forgot Password',
                          style: TextStyle(
                              color: white,
                              fontSize: FontConstant.xxl,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        // Text(
                        //   StringResources.forgotText,
                        //   style: TextStyle(
                        //       color: textColor2, fontFamily: FontFamily.rubik),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 14),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Colors.white),
                      ),
                      child: customTextFormField(
                          textRegex: nameRegex,
                          controller: controller,
                          title: 'Enter Email Id',
                          length: 40,
                          color: white),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20, bottom: 20),
                      child: commonButtonWhite(
                          width: double.infinity,
                          bgColors: [white, Colors.white70],
                          title: 'Log In',
                          txtColor: black,
                          fontSize: FontConstant.m,
                          onTap: () {
                            context.pop();
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    ;
  }

  Future<void> showVideoBottomSheet({
    required BuildContext context,
    required Function() onCamera,
  }) async {
    showModalBottomSheet(
        context: context,
        builder: (context) => CupertinoActionSheet(
              message: Text('Record Video'),
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () => onCamera(), child: Text('Camera')),
              ],
            ));
  }
}
