// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/data/model/params/registerModelParams.dart';
import 'package:vam_vam/helpers/dateTimeHelper.dart';
import 'package:vam_vam/helpers/regexHelper.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/providers/profileprovider.dart';
import 'package:vam_vam/providers/registerProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/utils/stringResources.dart';
import 'package:vam_vam/widgets/commonWidgets/textStyle.dart';
import '../../helpers/mockHelper.dart';
import '../../utils/colors.dart';
import '../../utils/imageResources.dart';
import '../../utils/paddingConstant.dart';
import '../../widgets/commonWidgets/appDesign.dart';
import '../../widgets/commonWidgets/commonWidgets.dart';
import '../../widgets/commonWidgets/customTextFormField.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300)).then((value) =>
        Provider.of<RegisterProvider>(context, listen: false).getRelation());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<RegisterProvider, ProfileProvider>(
      builder: (context, data, profile, child) => LoadingOverlay(
        isLoading: data.isLoading,
        child: Scaffold(
            backgroundColor: primaryDark,
            body: SafeArea(
              top: false,
              child: blueBackContainer(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      appBarHeaderContainer(
                          context: context,
                          title: 'Registration',
                          color: black),
                      // SizedBox(height: 15),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: PaddingConstant.l,
                              right: PaddingConstant.l,
                              top: PaddingConstant.xxl),
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Personal Details",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: white,
                                      fontWeight: FontWeight.w500,
                                    )),
                                SizedBox(height: 15),

                                // Voter ID
                                Text(StringResources.voterId,
                                    style: commonTextStyle14(color: white)),
                                SizedBox(height: 10),
                                customTextFormField2(
                                    textRegex: voterIdExpression,
                                    isMendatory: false,
                                    controller:
                                        data.voterIdTextEditingController,
                                    title: StringResources.voterId,
                                    inputFormatter: [
                                      LengthLimitingTextInputFormatter(10)
                                    ],
                                    length: 10,
                                    color: black,
                                    hintText: 'ABC1234567',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    keyboardType: TextInputType.text),
                                SizedBox(height: 15),

                                // Aadhar NO
                                Text(StringResources.aadharNo,
                                    style: commonTextStyle14(color: white)),
                                SizedBox(height: 10),
                                customTextFormField2(
                                    isMendatory: false,
                                    textRegex: aadhaarRegex,
                                    controller:
                                        data.aadharNoTextEditingController,
                                    title: StringResources.aadharNo,
                                    inputFormatter: [
                                      LengthLimitingTextInputFormatter(12)
                                    ],
                                    length: 12,
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    keyboardType: TextInputType.number),
                                SizedBox(height: 15),

                                // Name
                                Text('${StringResources.name}*',
                                    style: commonTextStyle14(color: white)),
                                SizedBox(height: 10),
                                customTextFormField2(
                                    textRegex: nameRegex,
                                    controller: data.nameTextEditingController,
                                    title: StringResources.name,
                                    length: 25,
                                    isMendatory: true,
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    keyboardType: TextInputType.name),

                                // Gender
                                SizedBox(
                                  height: 50,
                                  width: ResponsiveHelper.width(context),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Gender : ',
                                          style:
                                              commonTextStyle14(color: white)),
                                      Expanded(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                MockHelper.genderList.length,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              var item =
                                                  MockHelper.genderList[index];
                                              return GestureDetector(
                                                onTap: () =>
                                                    data.setSelectedGender(
                                                        item['title']),
                                                child: Row(
                                                  children: [
                                                    data.selectedGender ==
                                                            item['title']
                                                        ? const Icon(
                                                            Icons
                                                                .radio_button_checked,
                                                            color: white)
                                                        : const Icon(
                                                            Icons
                                                                .radio_button_off,
                                                            color: white),
                                                    const SizedBox(width: 10),
                                                    Text(item['title'],
                                                        style:
                                                            commonTextStyle14(
                                                                color: white)),
                                                    const SizedBox(width: 10),
                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15),

                                // DOB
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Text('D-O-B : ',
                                              style: commonTextStyle14(
                                                  color: white)),
                                          commonContainer(
                                            width: ResponsiveHelper.width(
                                                    context) *
                                                0.3,
                                            height: 45,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: PaddingConstant.xs,
                                                  right: PaddingConstant.xs),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller: data
                                                          .dobTextEditingController,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      textInputAction:
                                                          TextInputAction.done,
                                                      maxLength: 10,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                      decoration:
                                                          const InputDecoration(
                                                              counterText: '',
                                                              hintText:
                                                                  'DD/MM/YYYY ',
                                                              hintStyle: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: black,
                                                                  fontSize: 12),
                                                              border:
                                                                  InputBorder
                                                                      .none),
                                                      readOnly: true,
                                                      onTap: () =>
                                                          selectDob(data),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () =>
                                                        selectDob(data),
                                                    child: Image.asset(
                                                        IconResource
                                                            .calenderIcon,
                                                        height: 18),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Text('Age : ',
                                              style: commonTextStyle14(
                                                  color: white)),
                                          commonContainer(
                                            width: ResponsiveHelper.width(
                                                    context) *
                                                0.3,
                                            height: 45,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: PaddingConstant.xs,
                                                  right: PaddingConstant.xs),
                                              child: commonContainer(
                                                height: 50,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .only(
                                                      left: PaddingConstant.l,
                                                      right: PaddingConstant.l),
                                                  child: customTextFormField(
                                                      textRegex: nameRegex,
                                                      isMendatory: false,
                                                      controller: data
                                                          .ageTextEditingController,
                                                      title: 'Enter Age',
                                                      keyboardType:
                                                          TextInputType.number,
                                                      length: 3,
                                                      color: black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),

                                // Guardian Name
                                Text('${StringResources.guradianName}*',
                                    style: commonTextStyle14(color: white)),
                                SizedBox(height: 10),
                                customTextFormField2(
                                    textRegex: nameRegex,
                                    controller:
                                        data.guardianNameTextEditingController,
                                    title: StringResources.guradianName,
                                    length: 25,
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    keyboardType: TextInputType.name),
                                SizedBox(height: 15),

                                // Relation
                                Text("Relation",
                                    style: commonTextStyle14(color: white)),
                                SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  width: ResponsiveHelper.width(context),
                                  height: 45,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: PaddingConstant.l,
                                        right: PaddingConstant.l),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        value: data.selectedReleation,
                                        isExpanded: true,
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        hint: const Text('Select Relation',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: black,
                                                fontSize: 12)),
                                        items: data.relationList.map((items) {
                                          return DropdownMenuItem(
                                            value: items.name,
                                            child: Text('${items.name}',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  color: black,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) =>
                                            data.setSelectedRelation(newValue),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),

                                // Mobile No
                                Text("Mobile No*",
                                    style: commonTextStyle14(color: white)),
                                SizedBox(height: 10),
                                customTextFormField2(
                                    textRegex: mobileRegex,
                                    controller:
                                        data.mobileNoTextEditingController,
                                    title: 'Mobile No.',
                                    length: 10,
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    keyboardType: TextInputType.number),
                                SizedBox(height: 15),

                                // E-mail ID
                                Text("Email Id*",
                                    style: commonTextStyle14(color: white)),
                                SizedBox(height: 10),
                                customTextFormField2(
                                    textRegex: emailExpression,
                                    controller: data.emailTextEditingController,
                                    title: 'Email Id',
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    keyboardType: TextInputType.emailAddress),

                                // Address Details
                                // SizedBox(
                                //     height: ResponsiveHelper.height(context) *
                                //         0.05),
                                // const Text("Address Details",
                                //     style: TextStyle(
                                //       fontSize: 17,
                                //       color: white,
                                //       fontWeight: FontWeight.w500,
                                //     )),
                                // SizedBox(height: 15),

                                // State
                                // Text("State",
                                //     style: commonTextStyle14(color: white)),
                                // SizedBox(height: 10),
                                // Container(
                                //   decoration: BoxDecoration(
                                //     color: Colors.white,
                                //     border: Border.all(
                                //         color: Colors.white, width: 1),
                                //     borderRadius: BorderRadius.circular(8),
                                //   ),
                                //   width: ResponsiveHelper.width(context),
                                //   height:
                                //       ResponsiveHelper.height(context) * 0.05,
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(
                                //         left: PaddingConstant.l,
                                //         right: PaddingConstant.l),
                                //     child: DropdownButtonHideUnderline(
                                //       child: DropdownButton(
                                //         value: data.selectedState,
                                //         isExpanded: true,
                                //         icon: const Icon(
                                //             Icons.keyboard_arrow_down),
                                //         hint: const Text('Select State',
                                //             style: TextStyle(
                                //                 fontWeight: FontWeight.w400,
                                //                 color: black,
                                //                 fontSize: 12)),
                                //         items: data.stateList
                                //             .map((StateModelData items) {
                                //           return DropdownMenuItem(
                                //             value: items.name,
                                //             child: Text('${items.name}',
                                //                 style: const TextStyle(
                                //                   fontSize: 12,
                                //                   color: black,
                                //                   fontWeight: FontWeight.w400,
                                //                 )),
                                //           );
                                //         }).toList(),
                                //         onChanged: (value) {
                                //           data.setSelectedState(
                                //               value, profile.userProfileInfo);
                                //         },
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // SizedBox(height: 15),

                                // District
                                // Text("District",
                                //     style: commonTextStyle14(color: white)),
                                // SizedBox(height: 10),
                                // Container(
                                //   decoration: BoxDecoration(
                                //     color: Colors.white,
                                //     border: Border.all(
                                //         color: Colors.white, width: 1),
                                //     borderRadius: BorderRadius.circular(8),
                                //   ),
                                //   width: ResponsiveHelper.width(context),
                                //   height:
                                //       ResponsiveHelper.height(context) * 0.05,
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(
                                //         left: PaddingConstant.l,
                                //         right: PaddingConstant.l),
                                //     child: DropdownButtonHideUnderline(
                                //       child: DropdownButton(
                                //         value: data.selectedDistrict,
                                //         isExpanded: true,
                                //         icon: const Icon(
                                //             Icons.keyboard_arrow_down),
                                //         hint: const Text('Select District',
                                //             style: TextStyle(
                                //                 fontWeight: FontWeight.w400,
                                //                 color: black,
                                //                 fontSize: 12)),
                                //         items: data.districtList.map((items) {
                                //           return DropdownMenuItem(
                                //             value: items.name,
                                //             child: Text('${items.name}',
                                //                 style: const TextStyle(
                                //                   fontSize: 12,
                                //                   color: black,
                                //                   fontWeight: FontWeight.w400,
                                //                 )),
                                //           );
                                //         }).toList(),
                                //         onChanged: (String? newValue) =>
                                //             data.setSelectedDistrict(newValue,
                                //                 profile.userProfileInfo),
                                //       ),
                                //     ),
                                //   ),
                                // ),

                                // // Area
                                // SizedBox(
                                //   height:
                                //       ResponsiveHelper.height(context) * 0.07,
                                //   width: ResponsiveHelper.width(context),
                                //   child: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Text('Area : ',
                                //           style:
                                //               commonTextStyle14(color: white)),
                                //       Expanded(
                                //         child: ListView.builder(
                                //             shrinkWrap: true,
                                //             padding: EdgeInsets.zero,
                                //             scrollDirection: Axis.horizontal,
                                //             itemCount:
                                //                 MockHelper.areaList.length,
                                //             physics:
                                //                 const NeverScrollableScrollPhysics(),
                                //             itemBuilder: (BuildContext context,
                                //                 int index) {
                                //               var item =
                                //                   MockHelper.areaList[index];
                                //               return GestureDetector(
                                //                 onTap: () =>
                                //                     data.setSelectedArea(
                                //                         item['title']),
                                //                 child: Row(
                                //                   children: [
                                //                     item['title'] ==
                                //                             data.selectedArea
                                //                         ? const Icon(
                                //                             Icons
                                //                                 .radio_button_checked,
                                //                             color: white)
                                //                         : const Icon(
                                //                             Icons
                                //                                 .radio_button_off,
                                //                             color: white),
                                //                     const SizedBox(width: 10),
                                //                     Text(item['title'],
                                //                         style:
                                //                             commonTextStyle14(
                                //                                 color: white)),
                                //                     const SizedBox(width: 10),
                                //                   ],
                                //                 ),
                                //               );
                                //             }),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // SizedBox(height: 15),

                                // Sub-District
                                // Text("Sub-District",
                                //     style: commonTextStyle14(color: white)),
                                // SizedBox(height: 10),
                                // Container(
                                //   decoration: BoxDecoration(
                                //     color: Colors.white,
                                //     border: Border.all(
                                //         color: Colors.white, width: 1),
                                //     borderRadius: BorderRadius.circular(8),
                                //   ),
                                //   width: ResponsiveHelper.width(context),
                                //   height:
                                //       ResponsiveHelper.height(context) * 0.05,
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(
                                //         left: PaddingConstant.l,
                                //         right: PaddingConstant.l),
                                //     child: DropdownButtonHideUnderline(
                                //       child: DropdownButton(
                                //         value: data.selectedTehsil,
                                //         isExpanded: true,
                                //         icon: const Icon(
                                //             Icons.keyboard_arrow_down),
                                //         hint: const Text('Select Sub-District',
                                //             style: TextStyle(
                                //                 fontWeight: FontWeight.w400,
                                //                 color: black,
                                //                 fontSize: 12)),
                                //         items: data.tehsilList.map((items) {
                                //           return DropdownMenuItem(
                                //             value: items.name,
                                //             child: Text('${items.name}',
                                //                 style: const TextStyle(
                                //                   fontSize: 12,
                                //                   color: black,
                                //                   fontWeight: FontWeight.w400,
                                //                 )),
                                //           );
                                //         }).toList(),
                                //         onChanged: (String? newValue) =>
                                //             data.setSelectedTehsil(newValue,
                                //                 profile.userProfileInfo),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // SizedBox(height: 15),

                                // Area
                                // Text("Area",
                                //     style: commonTextStyle14(color: white)),
                                // SizedBox(height: 10),
                                // Container(
                                //   decoration: BoxDecoration(
                                //     color: Colors.white,
                                //     border: Border.all(
                                //         color: Colors.white, width: 1),
                                //     borderRadius: BorderRadius.circular(8),
                                //   ),
                                //   width: ResponsiveHelper.width(context),
                                //   height:
                                //       ResponsiveHelper.height(context) * 0.05,
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(
                                //         left: PaddingConstant.l,
                                //         right: PaddingConstant.l),
                                //     child: DropdownButtonHideUnderline(
                                //       child: DropdownButton(
                                //           value: data.selectedArea,
                                //           isExpanded: true,
                                //           icon: const Icon(
                                //               Icons.keyboard_arrow_down),
                                //           hint: const Text('Select Area',
                                //               style: TextStyle(
                                //                   fontWeight: FontWeight.w400,
                                //                   color: black,
                                //                   fontSize: 12)),
                                //           items: data.areaList.map((items) {
                                //             return DropdownMenuItem(
                                //               value: items,
                                //               child: Text(items,
                                //                   style: const TextStyle(
                                //                     fontSize: 12,
                                //                     color: black,
                                //                     fontWeight: FontWeight.w400,
                                //                   )),
                                //             );
                                //           }).toList(),
                                //           onChanged: (String? newValue) {
                                //             data.setSelectedArea(newValue);
                                //           }),
                                //     ),
                                //   ),
                                // ),
                                // SizedBox(height: 15),

                                // if (data.selectedArea == 'Rural') ...[
                                //   // Gram Panchayat
                                //   Text("Gram Panchayat",
                                //       style: commonTextStyle14(color: white)),
                                //   SizedBox(height: 10),
                                //   Container(
                                //     decoration: BoxDecoration(
                                //       color: Colors.white,
                                //       border: Border.all(
                                //           color: Colors.white, width: 1),
                                //       borderRadius: BorderRadius.circular(8),
                                //     ),
                                //     width: ResponsiveHelper.width(context),
                                //     height:
                                //         ResponsiveHelper.height(context) * 0.05,
                                //     child: Padding(
                                //       padding: const EdgeInsets.only(
                                //           left: PaddingConstant.l,
                                //           right: PaddingConstant.l),
                                //       child: DropdownButtonHideUnderline(
                                //         child: DropdownButton(
                                //           value: data.selectedBlock,
                                //           isExpanded: true,
                                //           icon: const Icon(
                                //               Icons.keyboard_arrow_down),
                                //           hint: const Text(
                                //               'Select Gram Panchayat',
                                //               style: TextStyle(
                                //                   fontWeight: FontWeight.w400,
                                //                   color: black,
                                //                   fontSize: 12)),
                                //           items: data.blockList.map((items) {
                                //             return DropdownMenuItem(
                                //               value: items.name,
                                //               child: Text('${items.name}',
                                //                   style: const TextStyle(
                                //                     fontSize: 12,
                                //                     color: black,
                                //                     fontWeight: FontWeight.w400,
                                //                   )),
                                //             );
                                //           }).toList(),
                                //           onChanged: (String? newValue) =>
                                //               data.setSelectedBlock(newValue,
                                //                   profile.userProfileInfo),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                //   SizedBox(height: 15),

                                //   // City/Town/Village
                                //   Text("City/Town/Village",
                                //       style: commonTextStyle14(color: white)),
                                //   SizedBox(height: 10),
                                //   Container(
                                //     decoration: BoxDecoration(
                                //       color: Colors.white,
                                //       border: Border.all(
                                //           color: Colors.white, width: 1),
                                //       borderRadius: BorderRadius.circular(8),
                                //     ),
                                //     width: ResponsiveHelper.width(context),
                                //     height:
                                //         ResponsiveHelper.height(context) * 0.05,
                                //     child: Padding(
                                //       padding: const EdgeInsets.only(
                                //           left: PaddingConstant.l,
                                //           right: PaddingConstant.l),
                                //       child: DropdownButtonHideUnderline(
                                //         child: DropdownButton(
                                //           value: data.selectedCity,
                                //           isExpanded: true,
                                //           icon: const Icon(
                                //               Icons.keyboard_arrow_down),
                                //           hint: const Text(
                                //               'Select City/Town/Village',
                                //               style: TextStyle(
                                //                   fontWeight: FontWeight.w400,
                                //                   color: black,
                                //                   fontSize: 12)),
                                //           items: data.cityList.map((items) {
                                //             return DropdownMenuItem(
                                //               value: items.name,
                                //               child: Text('${items.name}',
                                //                   style: const TextStyle(
                                //                     fontSize: 12,
                                //                     color: black,
                                //                     fontWeight: FontWeight.w400,
                                //                   )),
                                //             );
                                //           }).toList(),
                                //           onChanged: (String? newValue) =>
                                //               data.setSelectedCity(newValue),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                //   SizedBox(height: 15),
                                // ] else if (data.selectedArea == 'Urban') ...[
                                //   // Municipality
                                //   Text("Municipality",
                                //       style: commonTextStyle14(color: white)),
                                //   SizedBox(height: 10),
                                //   Container(
                                //     decoration: BoxDecoration(
                                //       color: Colors.white,
                                //       border: Border.all(
                                //           color: Colors.white, width: 1),
                                //       borderRadius: BorderRadius.circular(8),
                                //     ),
                                //     width: ResponsiveHelper.width(context),
                                //     height:
                                //         ResponsiveHelper.height(context) * 0.05,
                                //     child: Padding(
                                //       padding: const EdgeInsets.only(
                                //           left: PaddingConstant.l,
                                //           right: PaddingConstant.l),
                                //       child: DropdownButtonHideUnderline(
                                //         child: DropdownButton(
                                //           value: data.selectedMunicipality,
                                //           isExpanded: true,
                                //           icon: const Icon(
                                //               Icons.keyboard_arrow_down),
                                //           hint: const Text(
                                //               'Select Municipality',
                                //               style: TextStyle(
                                //                   fontWeight: FontWeight.w400,
                                //                   color: black,
                                //                   fontSize: 12)),
                                //           items: data.municipalityList
                                //               .map((items) {
                                //             return DropdownMenuItem(
                                //               value: items.name,
                                //               child: Text('${items.name}',
                                //                   style: const TextStyle(
                                //                     fontSize: 12,
                                //                     color: black,
                                //                     fontWeight: FontWeight.w400,
                                //                   )),
                                //             );
                                //           }).toList(),
                                //           onChanged: (String? newValue) =>
                                //               data.setSelectedMunicipality(
                                //                   newValue,
                                //                   profile.userProfileInfo),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                //   SizedBox(height: 15),

                                //   // Ward
                                //   Text("Ward",
                                //       style: commonTextStyle14(color: white)),
                                //   SizedBox(height: 10),
                                //   Container(
                                //     decoration: BoxDecoration(
                                //       color: Colors.white,
                                //       border: Border.all(
                                //           color: Colors.white, width: 1),
                                //       borderRadius: BorderRadius.circular(8),
                                //     ),
                                //     width: ResponsiveHelper.width(context),
                                //     height:
                                //         ResponsiveHelper.height(context) * 0.05,
                                //     child: Padding(
                                //       padding: const EdgeInsets.only(
                                //           left: PaddingConstant.l,
                                //           right: PaddingConstant.l),
                                //       child: DropdownButtonHideUnderline(
                                //         child: DropdownButton(
                                //           value: data.selectedWard,
                                //           isExpanded: true,
                                //           icon: const Icon(
                                //               Icons.keyboard_arrow_down),
                                //           hint: const Text('Select Ward',
                                //               style: TextStyle(
                                //                   fontWeight: FontWeight.w400,
                                //                   color: black,
                                //                   fontSize: 12)),
                                //           items: data.wardList.map((items) {
                                //             return DropdownMenuItem(
                                //               value: items.name,
                                //               child: Text('${items.name}',
                                //                   style: const TextStyle(
                                //                     fontSize: 12,
                                //                     color: black,
                                //                     fontWeight: FontWeight.w400,
                                //                   )),
                                //             );
                                //           }).toList(),
                                //           onChanged: (String? newValue) =>
                                //               data.setSelectedWard(newValue),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                //   SizedBox(height: 15),
                                // ],

                                // Parliamentary Constituency
                                // Text("Parliamentary Constituency",
                                //     style: commonTextStyle14(color: white)),
                                // SizedBox(height: 10),
                                // Container(
                                //   decoration: BoxDecoration(
                                //     color: Colors.white,
                                //     border: Border.all(
                                //         color: Colors.white, width: 1),
                                //     borderRadius: BorderRadius.circular(8),
                                //   ),
                                //   width: ResponsiveHelper.width(context),
                                //   height:
                                //       ResponsiveHelper.height(context) * 0.05,
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(
                                //         left: PaddingConstant.l,
                                //         right: PaddingConstant.l),
                                //     child: DropdownButtonHideUnderline(
                                //       child: DropdownButton(
                                //         value: data.selectedParliamentry,
                                //         isExpanded: true,
                                //         icon: const Icon(
                                //             Icons.keyboard_arrow_down),
                                //         hint: const Text(
                                //             'Select Parliamentary Constituency',
                                //             style: TextStyle(
                                //                 fontWeight: FontWeight.w400,
                                //                 color: black,
                                //                 fontSize: 12)),
                                //         items:
                                //             data.parliamentryList.map((items) {
                                //           return DropdownMenuItem(
                                //             value: items.name,
                                //             child: Text('${items.name}',
                                //                 style: const TextStyle(
                                //                   fontSize: 12,
                                //                   color: black,
                                //                   fontWeight: FontWeight.w400,
                                //                 )),
                                //           );
                                //         }).toList(),
                                //         onChanged: (String? newValue) => data
                                //             .setSelectedParliamentry(newValue),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // SizedBox(height: 15),

                                // Assembly Constituency
                                // Text("Assembly Constituency",
                                //     style: commonTextStyle14(color: white)),
                                // SizedBox(height: 10),
                                // Container(
                                //   decoration: BoxDecoration(
                                //     color: Colors.white,
                                //     border: Border.all(
                                //         color: Colors.white, width: 1),
                                //     borderRadius: BorderRadius.circular(8),
                                //   ),
                                //   width: ResponsiveHelper.width(context),
                                //   height:
                                //       ResponsiveHelper.height(context) * 0.05,
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(
                                //         left: PaddingConstant.l,
                                //         right: PaddingConstant.l),
                                //     child: DropdownButtonHideUnderline(
                                //       child: DropdownButton(
                                //         value: data.selectedAssembly,
                                //         isExpanded: true,
                                //         icon: const Icon(
                                //             Icons.keyboard_arrow_down),
                                //         hint: const Text(
                                //             'Select Assembly Constituency',
                                //             style: TextStyle(
                                //                 fontWeight: FontWeight.w400,
                                //                 color: black,
                                //                 fontSize: 12)),
                                //         items: data.assemblyList.map((items) {
                                //           return DropdownMenuItem(
                                //             value: items.name,
                                //             child: Text('${items.name}',
                                //                 style: const TextStyle(
                                //                   fontSize: 12,
                                //                   color: black,
                                //                   fontWeight: FontWeight.w400,
                                //                 )),
                                //           );
                                //         }).toList(),
                                //         onChanged: (String? newValue) =>
                                //             data.setSelectedAssembly(newValue),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // SizedBox(height: 15),

                                // // Ward No./Mohalla
                                // Text("Ward No./Mohalla",
                                //     style: commonTextStyle14(color: white)),
                                // SizedBox(height: 10),
                                // customTextFormField2(
                                //     textRegex: addressReg,
                                //     controller:
                                //         data.wardNoTextEditingController,
                                //     title: 'Ward No./Mohalla',
                                //     length: 50,
                                //     isMendatory: false,
                                //     color: black,
                                //     fontSize: 12,
                                //     fontWeight: FontWeight.w400,
                                //     keyboardType: TextInputType.name),
                                // SizedBox(height: 15),

                                // Street /Area Locality
                                // Text("Street /Area Locality",
                                //     style: commonTextStyle14(color: white)),
                                // SizedBox(height: 10),
                                // customTextFormField2(
                                //     textRegex: addressReg,
                                //     controller:
                                //         data.streetTextEditingController,
                                //     title: 'Street /Area Locality ',
                                //     length: 50,
                                //     isMendatory: false,
                                //     color: black,
                                //     fontSize: 12,
                                //     fontWeight: FontWeight.w400,
                                //     keyboardType: TextInputType.name),
                                // SizedBox(height: 15),

                                // Building /House No
                                // Text("Building /House No",
                                //     style: commonTextStyle14(color: white)),
                                // SizedBox(height: 10),
                                // customTextFormField2(
                                //     textRegex: addressReg,
                                //     controller:
                                //         data.houseNoTextEditingController,
                                //     title: 'Building /House No.',
                                //     length: 50,
                                //     color: black,
                                //     isMendatory: false,
                                //     fontSize: 12,
                                //     fontWeight: FontWeight.w400,
                                //     keyboardType: TextInputType.name),
                                // SizedBox(height: 15),

                                // // Landmark
                                // Text("Landmark",
                                //     style: commonTextStyle14(color: white)),
                                // SizedBox(height: 10),
                                // customTextFormField2(
                                //     textRegex: addressReg,
                                //     controller:
                                //         data.landmarkTextEditingController,
                                //     title: 'Landmark',
                                //     length: 50,
                                //     color: black,
                                //     isMendatory: false,
                                //     fontSize: 12,
                                //     fontWeight: FontWeight.w400,
                                //     keyboardType: TextInputType.name),
                                // SizedBox(height: 15),

                                // Pin Code
                                // Text("Pin Code",
                                //     style: commonTextStyle14(color: white)),
                                // SizedBox(height: 10),
                                // customTextFormField2(
                                //     textRegex: pinCodeReg,
                                //     controller:
                                //         data.pinCodeTextEditingController,
                                //     title: 'Pin Code',
                                //     isMendatory: false,
                                //     inputFormatter: [
                                //       LengthLimitingTextInputFormatter(6)
                                //     ],
                                //     length: 6,
                                //     color: black,
                                //     fontSize: 12,
                                //     fontWeight: FontWeight.w400,
                                //     keyboardType: TextInputType.number),

                                // Submit Button
                                SizedBox(
                                    height: ResponsiveHelper.height(context) *
                                        0.04),
                                Bounce(
                                  duration: const Duration(milliseconds: 110),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      if (data.selectedGender == null) {
                                        errorToast('Select Gender');
                                      } else if (data.dobTextEditingController
                                          .text.isEmpty) {
                                        errorToast('Select D-O-B');
                                      } else if (data.selectedReleation ==
                                          null) {
                                        errorToast('Select Relation');
                                      }
                                      // else if (data.selectedState == null) {
                                      //   errorToast('Select State');
                                      // } else if (data.selectedDistrict ==
                                      //     null) {
                                      //   errorToast('Select District');
                                      // } else if (data.selectedArea == null) {
                                      //   errorToast('Select Area');
                                      // } else if (data.selectedTehsil == null) {
                                      //   errorToast('Select Sub-District');
                                      // } else if (data.selectedBlock == null) {
                                      //   errorToast('Select Block');
                                      // } else if (data.selectedParliamentry ==
                                      //     null) {
                                      //   errorToast(
                                      //       'Select Parliamentary Constituency');
                                      // } else if (data.selectedAssembly ==
                                      //     null) {
                                      //   errorToast(
                                      //       'Select Assembly Constituency');
                                      // } else if (data.selectedCity == null) {
                                      //   errorToast('Select City');
                                      // }
                                      else {
                                        RegisterModelParams registerModelParams = RegisterModelParams(
                                            voterId: data
                                                .voterIdTextEditingController
                                                .text
                                                .toString(),
                                            aadhaarCard: data
                                                .aadharNoTextEditingController
                                                .text
                                                .toString(),
                                            name: data
                                                .nameTextEditingController.text
                                                .toString(),
                                            gender: '${data.selectedGender}',
                                            dob: data.dobTextEditingController.text
                                                .toString(),
                                            guardianName: data
                                                .guardianNameTextEditingController
                                                .text
                                                .toString(),
                                            relation: data.selectedReleation
                                                .toString(),
                                            mobile: data
                                                .mobileNoTextEditingController
                                                .text
                                                .toString(),
                                            email: data
                                                .emailTextEditingController.text
                                                .toString(),
                                            stateId: data.getStateId(
                                                '${data.selectedState}'),
                                            districtId: data.getDistrictId('${data.selectedDistrict}'),
                                            tehsilId: data.getTehsilId('${data.selectedTehsil}'),
                                            blockId: data.selectedArea == 'Rural' ? data.getBlockId('${data.selectedBlock}') : '',
                                            area: data.selectedArea ?? '',
                                            parliamentaryId: data.getParliamentryId('${data.selectedParliamentry}'),
                                            assemblyId: data.getAssemblyId('${data.selectedAssembly}'),
                                            cityVillage: data.selectedArea == 'Rural' ? data.getCityId('${data.selectedCity}') : '',
                                            ward: data.selectedArea == 'Urban' ? data.getWardId('${data.selectedWard}') : '',
                                            locality: data.streetTextEditingController.text.toString(),
                                            houseNo: data.houseNoTextEditingController.text.toString(),
                                            municipalityId: data.selectedArea == 'Urban' ? data.getMunicipalityId('${data.selectedMunicipality}') : '',
                                            pincode: data.pinCodeTextEditingController.text.toString());
                                        print('Resgister resposnse?>>>>>>');
                                        print(registerModelParams
                                            .toJson()
                                            .toString());
                                        data
                                            .register(registerModelParams)
                                            .then((value) {
                                          if (value.isSuccess) {
                                            customToast(
                                                msg: value.message,
                                                color: successColor);
                                            context.pop();
                                          } else {
                                            errorToast(value.message);
                                          }
                                        });
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 2.0, color: colorRed),
                                        ],
                                        border: Border.all(
                                            color:
                                                primaryDark.withOpacity(0.1)),
                                        color: colorRed),
                                    margin: const EdgeInsets.only(left: 5),
                                    child: Center(
                                        child: Text('Submit',
                                            style: commonTextStyle13(
                                                color: white))),
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }

  selectDob(RegisterProvider data) async {
    try {
      await showDatePicker(
              context: context,
              currentDate: DateTime.now(),
              initialDate: data.dobInitialDate,
              firstDate: DateTime(1950),
              lastDate: DateTimeHelper().subtractYears(DateTime.now(), 18))
          .then((value) {
        if (value != null) {
          if (DateTimeHelper.calculateAge(value) > 17) {
            data.setDonInitialDate(value);
            data.setDOBTextEditingController(
                DateTimeHelper.formattedDate(value));
            data.setAge(DateTimeHelper.calculateAge(value).toString());
          } else {
            customToast(msg: 'Age must be greater than 18', color: errorColor);
          }
        }
        return null;
      });
    } catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }

  errorToast(String msg) {
    customToast(msg: msg, color: errorColor);
  }
}
