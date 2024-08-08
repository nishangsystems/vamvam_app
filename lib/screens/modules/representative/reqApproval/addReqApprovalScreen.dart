import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/providers/roleProvider.dart';

import '../../../../helpers/regexHelper.dart';
import '../../../../helpers/responsiveHelper.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/imageResources.dart';
import '../../../../utils/paddingConstant.dart';
import '../../../../widgets/commonWidgets/appDesign.dart';
import '../../../../widgets/commonWidgets/commonWidgets.dart';
import '../../../../widgets/commonWidgets/customTextFormField.dart';

class AddReqApprovalScreen extends StatefulWidget {
  const AddReqApprovalScreen({super.key});

  @override
  State<AddReqApprovalScreen> createState() => _AddReqApprovalScreenState();
}

class _AddReqApprovalScreenState extends State<AddReqApprovalScreen> {
  final TextEditingController nameTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<RoleProvider>(
      builder: (context, role, child) => Scaffold(
          backgroundColor: primaryDark,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(appBarHeight),
              child: homeAppbar(
                  context: context,
                  profileImage: ImageResources.profileImage,
                  name: 'deepak',
                  location: 'H 106')),
          body: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: PaddingConstant.l,
                  right: PaddingConstant.l,
                  top: PaddingConstant.xxl),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        commonBackButton(
                            context: context, title: '', backBtnColor: white),
                        const SizedBox(width: 10),
                        const Text("Add Request For Approval",
                            style: TextStyle(
                              fontSize: 17,
                              color: white,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                    SizedBox(height: ResponsiveHelper.height(context) * 0.02),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            color: Colors.grey[100],
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 16),
                              child: Text("Compliance Details",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Text("Enter Ticket Id :",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: commonBorderContainer(
                                    height: 40,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: PaddingConstant.l,
                                          right: PaddingConstant.l),
                                      child: customTextFormField(
                                          textRegex: nameRegex,
                                          controller: nameTextEditingController,
                                          title: '',
                                          length: 100,
                                          color: black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          keyboardType: TextInputType.name),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: ResponsiveHelper.height(context) * 0.01),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Text('Compliance Name:',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: commonBorderContainer(
                                    height: 40,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: PaddingConstant.l,
                                          right: PaddingConstant.l),
                                      child: customTextFormField(
                                          textRegex: nameRegex,
                                          controller: nameTextEditingController,
                                          title: '',
                                          length: 100,
                                          color: black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          keyboardType: TextInputType.name),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: ResponsiveHelper.height(context) * 0.01),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Text("Mobile No:",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: commonBorderContainer(
                                    height: 40,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: PaddingConstant.l,
                                          right: PaddingConstant.l),
                                      child: customTextFormField(
                                          textRegex: nameRegex,
                                          controller: nameTextEditingController,
                                          title: '',
                                          length: 100,
                                          color: black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          keyboardType: TextInputType.name),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: ResponsiveHelper.height(context) * 0.01),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Text("Address:",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: commonBorderContainer(
                                    height: 40,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: PaddingConstant.l,
                                          right: PaddingConstant.l),
                                      child: customTextFormField(
                                          textRegex: nameRegex,
                                          controller: nameTextEditingController,
                                          title: '',
                                          length: 100,
                                          color: black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          keyboardType: TextInputType.name),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: ResponsiveHelper.height(context) * 0.01),
                          Container(
                            width: double.infinity,
                            color: Colors.grey[100],
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              child: Text("Compliance Details",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                          ),
                          SizedBox(
                              height: ResponsiveHelper.height(context) * 0.01),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Text("Department :",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: commonBorderContainer(
                                    height: 40,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: PaddingConstant.l,
                                          right: PaddingConstant.l),
                                      child: customTextFormField(
                                          textRegex: nameRegex,
                                          controller: nameTextEditingController,
                                          title: '',
                                          length: 100,
                                          color: black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          keyboardType: TextInputType.name),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: ResponsiveHelper.height(context) * 0.01),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Text("Issues :",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: commonBorderContainer(
                                    height: 40,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: PaddingConstant.l,
                                          right: PaddingConstant.l),
                                      child: customTextFormField(
                                          textRegex: nameRegex,
                                          controller: nameTextEditingController,
                                          title: '',
                                          length: 100,
                                          color: black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          keyboardType: TextInputType.name),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: ResponsiveHelper.height(context) * 0.01),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Text("Details :",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: commonBorderContainer(
                                    height: 40,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: PaddingConstant.l,
                                          right: PaddingConstant.l),
                                      child: customTextFormField(
                                          textRegex: nameRegex,
                                          controller: nameTextEditingController,
                                          title: '',
                                          length: 100,
                                          color: black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          keyboardType: TextInputType.name),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: ResponsiveHelper.height(context) * 0.01),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Text("Date :",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: commonBorderContainer(
                                    height: 40,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: PaddingConstant.l,
                                          right: PaddingConstant.l),
                                      child: customTextFormField(
                                          textRegex: nameRegex,
                                          controller: nameTextEditingController,
                                          title: '',
                                          length: 100,
                                          color: black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          keyboardType: TextInputType.name),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            color: Colors.grey[100],
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 16),
                              child: Text("Approval Request For ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                          ),
                          SizedBox(
                              height: ResponsiveHelper.height(context) * 0.02),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: commonContainer(
                              height: 100,
                              color: Colors.grey[100],
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                child: customTextFormField(
                                    textRegex: nameRegex,
                                    controller: nameTextEditingController,
                                    keyboardType: TextInputType.name,
                                    title: 'Enter Your Request.......',
                                    length: 100,
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          SizedBox(
                              height: ResponsiveHelper.height(context) * 0.02),
                          Container(
                            width: double.infinity,
                            color: Colors.grey[100],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Center(
                                child: commonButtonWhite(
                                  width: ResponsiveHelper.width(context) * 0.6,
                                  bgColors: [primaryDark, primaryDark],
                                  title: 'Submit',
                                  txtColor: white,
                                  fontSize: 12,
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ResponsiveHelper.height(context) * 0.01),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
