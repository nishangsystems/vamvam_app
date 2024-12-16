import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/providers/ParentAuthProvider.dart';
import '../../../utils/colors.dart';
import '../../../utils/fontConstant.dart';
import '../../../utils/imageResources.dart';
import '../../../widgets/commonWidgets/commonWidgets.dart';
import '../../loader/loaderOverlay.dart';

class ParentLoginScreen extends StatefulWidget {
  final String schoolName;

  ParentLoginScreen({super.key, required this.schoolName});

  @override
  State<ParentLoginScreen> createState() => _ParentLoginScreenState();
}

class _ParentLoginScreenState extends State<ParentLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ParentAuthProvider>(
        builder: (context, controller, child) => LoadingOverlay(
            isLoading: controller.isSubmitLoading,
            child: Scaffold(
                body: SafeArea(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: double.infinity,
                        width: double.infinity,
                        child: ListView(children: [

                          const SizedBox(height: 20),
                          const Text(
                            "Welcome Back",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: primaryDark,
                            ),
                          ),
                          const SizedBox(height: 10),
                           Text(
                            "Login as parent in ${widget.schoolName}",
                            style: TextStyle(
                              fontSize: 15,
                              color: primaryDark,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 40),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3.0, horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              color: const Color(0xFFEDE8E8),
                            ),
                            child: Row(
                              children: [
                                CountryCodePicker(
                                  onChanged: (element) {
                                    controller
                                        .setCountryCode(element.dialCode!);
                                  },
                                  initialSelection: 'CM',
                                  showCountryOnly: false,
                                  // enabled: false,
                                  showOnlyCountryWhenClosed: false,
                                  alignLeft: false,
                                ),
                                Expanded(
                                    child: TextFormField(
                                  controller: controller.phoneController,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                  decoration: const InputDecoration(
                                    hintText: "123 456 7890",
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 2),
                                  ),
                                  keyboardType: TextInputType.number,
                                ))
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1),
                          SizedBox(height: 50),
                          Column(children: [
                            Center(
                                child: commonButtonWhite(
                                    width: double.infinity,
                                    bgColors: [primaryLight, primaryLight],
                                    title: 'Log In',
                                    txtColor: white,
                                    fontSize: FontConstant.m,
                                    onTap: () {
                                      if (!controller.isSubmitLoading) {
                                        controller.gotToNext(context);
                                      }
                                    })),
                            const SizedBox(height: 16),
                          ]),
                        ]))))));
  }
}
