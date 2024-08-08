import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/data/model/params/updateProfileModelParams.dart';
import 'package:vam_vam/helpers/regexHelper.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/profileprovider.dart';
import 'package:vam_vam/providers/registerProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';

import '../../../../../helpers/responsiveHelper.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/imageResources.dart';
import '../../../../../utils/paddingConstant.dart';
import '../../../../../widgets/commonWidgets/commonWidgets.dart';
import '../../../../../widgets/commonWidgets/customTextFormField.dart';
import '../../../../../widgets/commonWidgets/textStyle.dart';
import '../../data/model/response/user/stateModel.dart';
import '../../helpers/dateTimeHelper.dart';
import '../../helpers/mockHelper.dart';
import '../../utils/stringResources.dart';
import '../../widgets/commonWidgets/appDesign.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  int pageNo = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (pageNo == 1) {
          setState(() {
            pageNo = 0;
          });
        }
        return pageNo == 0;
      },
      child: Consumer3<ProfileProvider, RegisterProvider, AuthProvider>(
        builder: (context, data, reg, auth, child) => LoadingOverlay(
          isLoading: reg.isLoading,
          child: Scaffold(
            backgroundColor: primaryDark,
            body: SafeArea(
              top: false,
              child: Column(
                children: [
                  appBarHeaderContainer(
                      context: context,
                      title: 'Edit Profile',
                      color: black,
                      onBack: () {
                        if (pageNo == 0) {
                          context.pop();
                        } else {
                          setState(() {
                            pageNo = 0;
                          });
                        }
                      }),
                  SizedBox(height: 15),
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
                            if (pageNo == 0) ...[
                              Form(
                                key: formKey1,
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

                                    // Name
                                    Text('${StringResources.name}*',
                                        style: commonTextStyle14(color: white)),
                                    SizedBox(height: 10),
                                    customTextFormField5(
                                        textRegex: addressReg,
                                        controller:
                                            reg.nameTextEditingController,
                                        title: StringResources.name,
                                        isRead: true,
                                        //length: 25,
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
                                          Text('Gender* : ',
                                              style: commonTextStyle14(
                                                  color: white)),
                                          Expanded(
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                padding: EdgeInsets.zero,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: MockHelper
                                                    .genderList.length,
                                                physics:
                                                    const AlwaysScrollableScrollPhysics(),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  var item = MockHelper
                                                      .genderList[index];
                                                  return GestureDetector(
                                                    onTap: () =>
                                                        reg.setSelectedGender(
                                                            item['title']),
                                                    child: Row(
                                                      children: [
                                                        reg.selectedGender ==
                                                                item['title']
                                                            ? const Icon(
                                                                Icons
                                                                    .radio_button_checked,
                                                                color: white)
                                                            : const Icon(
                                                                Icons
                                                                    .radio_button_off,
                                                                color: white),
                                                        const SizedBox(
                                                            width: 10),
                                                        Text(item['title'],
                                                            style:
                                                                commonTextStyle14(
                                                                    color:
                                                                        white)),
                                                        const SizedBox(
                                                            width: 10),
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
                                    SizedBox(
                                      width: ResponsiveHelper.width(context),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('DOB*',
                                                  style: commonTextStyle14(
                                                      color: white)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              commonContainer(
                                                width: ResponsiveHelper.width(
                                                        context) *
                                                    0.4,
                                                height: 45,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: PaddingConstant
                                                              .xs,
                                                          right: PaddingConstant
                                                              .xs),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: TextFormField(
                                                          controller: reg
                                                              .dobTextEditingController,
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .done,
                                                          maxLength: 10,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                          ),
                                                          decoration: const InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              counterText: '',
                                                              hintText:
                                                                  'DD/MM/YYYY',
                                                              hintStyle: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: black,
                                                                  fontSize: 10),
                                                              border:
                                                                  InputBorder
                                                                      .none),
                                                          readOnly: true,
                                                          onTap: () =>
                                                              selectDob(reg),
                                                        ),
                                                      ),
                                                      // if(ResponsiveHelper
                                                      //               .width(
                                                      //                   context) >
                                                      //           340)...[
                                                      GestureDetector(
                                                        onTap: () =>
                                                            selectDob(reg),
                                                        child: Image.asset(
                                                            IconResource
                                                                .calenderIcon,
                                                            height: 18),
                                                      )
                                                      // ]
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Age',
                                                  style: commonTextStyle14(
                                                      color: white)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              commonContainer(
                                                width: ResponsiveHelper.width(
                                                        context) *
                                                    0.4,
                                                height: 45,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: PaddingConstant
                                                              .xs,
                                                          right: PaddingConstant
                                                              .xs),
                                                  child: commonContainer(
                                                    height: 50,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .only(
                                                          left:
                                                              PaddingConstant.l,
                                                          right: PaddingConstant
                                                              .l),
                                                      child: customTextFormField(
                                                          isMendatory: false,
                                                          readOnly: true,
                                                          textRegex: nameRegex,
                                                          controller: reg
                                                              .ageTextEditingController,
                                                          title: 'Enter Age',
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
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
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 15),

                                    // Guardian Name
                                    Text('${StringResources.guradianName}*',
                                        style: commonTextStyle14(color: white)),
                                    SizedBox(height: 10),
                                    customTextFormField2(
                                        textRegex: nameRegex,
                                        controller: reg
                                            .guardianNameTextEditingController,
                                        title: StringResources.guradianName,
                                        length: 25,
                                        color: black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        keyboardType: TextInputType.name),
                                    SizedBox(height: 15),

                                    // Relation
                                    Text("Relation*",
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
                                            value: reg.selectedReleation,
                                            isExpanded: true,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            hint: const Text('Select Relation',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: black,
                                                    fontSize: 12)),
                                            items:
                                                reg.relationList.map((items) {
                                              return DropdownMenuItem(
                                                value: items.name,
                                                child: Text('${items.name}',
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              );
                                            }).toList(),
                                            onChanged: (newValue) => reg
                                                .setSelectedRelation(newValue),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15),

                                    // Mobile No
                                    Text("Mobile No",
                                        style: commonTextStyle14(color: white)),
                                    SizedBox(height: 10),
                                    customTextFormField2(
                                        textRegex: mobileRegex,
                                        isRead: true,
                                        controller:
                                            reg.mobileNoTextEditingController,
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
                                        controller:
                                            reg.emailTextEditingController,
                                        title: 'Email Id',
                                        color: black,
                                        fontSize: 12,
                                        isRead: true,
                                        fontWeight: FontWeight.w400,
                                        keyboardType:
                                            TextInputType.emailAddress),
                                    SizedBox(
                                      height: 15,
                                    ),

                                    // Voter ID
                                    // Text(StringResources.voterId,
                                    //     style: commonTextStyle14(color: white)),
                                    // SizedBox(height: 10),
                                    // customTextFormField2(
                                    //     textRegex: voterIdExpression,
                                    //     controller:
                                    //         reg.voterIdTextEditingController,
                                    //     title: StringResources.voterId,
                                    //     inputFormatter: [
                                    //       LengthLimitingTextInputFormatter(10)
                                    //     ],
                                    //     length: 10,
                                    //     color: black,
                                    //     hintText: 'ABC1234567',
                                    //     fontSize: 12,
                                    //     isMendatory: false,
                                    //     fontWeight: FontWeight.w400,
                                    //     keyboardType: TextInputType.text),
                                    // SizedBox(height: 15),

                                    // Aadhar NO
                                    // Text(StringResources.aadharNo,
                                    //     style: commonTextStyle14(color: white)),
                                    // SizedBox(height: 10),
                                    // customTextFormField2(
                                    //     textRegex: aadhaarRegex,
                                    //     controller:
                                    //         reg.aadharNoTextEditingController,
                                    //     title: StringResources.aadharNo,
                                    //     inputFormatter: [
                                    //       LengthLimitingTextInputFormatter(12)
                                    //     ],
                                    //     length: 12,
                                    //     color: black,
                                    //     fontSize: 12,
                                    //     isMendatory: false,
                                    //     fontWeight: FontWeight.w400,
                                    //     keyboardType: TextInputType.number),
                                    // SizedBox(height: 15),
                                  ],
                                ),
                              )
                            ] else ...[
                              Form(
                                key: formKey2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Address Details
                                    SizedBox(
                                        height:
                                            ResponsiveHelper.height(context) *
                                                0.05),
                                    const Text("Address Details",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: white,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    SizedBox(height: 15),

                                    // State
                                    Text("State",
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
                                      height: ResponsiveHelper.height(context) *
                                          0.05,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: PaddingConstant.l,
                                            right: PaddingConstant.l),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            value: reg.selectedState,
                                            isExpanded: true,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            hint: const Text('Select State',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: black,
                                                    fontSize: 12)),
                                            items: reg.stateList
                                                .map((StateModelData items) {
                                              return DropdownMenuItem(
                                                value: items.name,
                                                child: Text('${items.name}',
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              reg.setSelectedState(
                                                  value, data.userProfileInfo);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15),

                                    // District
                                    Text("District",
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
                                      height: ResponsiveHelper.height(context) *
                                          0.05,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: PaddingConstant.l,
                                            right: PaddingConstant.l),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            value: reg.selectedDistrict,
                                            isExpanded: true,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            hint: const Text('Select District',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: black,
                                                    fontSize: 12)),
                                            items:
                                                reg.districtList.map((items) {
                                              return DropdownMenuItem(
                                                value: items.name,
                                                child: Text('${items.name}',
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) =>
                                                reg.setSelectedDistrict(
                                                    newValue,
                                                    data.userProfileInfo),
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 15),
                                    // Parliamentary Constituency
                                    Text("Parliamentary Constituency",
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
                                      height: ResponsiveHelper.height(context) *
                                          0.05,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: PaddingConstant.l,
                                            right: PaddingConstant.l),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            value: reg.selectedParliamentry,
                                            isExpanded: true,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            hint: const Text(
                                                'Select Parliamentary Constituency',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: black,
                                                    fontSize: 12)),
                                            items: reg.parliamentryList
                                                .map((items) {
                                              return DropdownMenuItem(
                                                value: items.name,
                                                child: Text('${items.name}',
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) =>
                                                reg.setSelectedParliamentry(
                                                    newValue),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15),

                                    // Assembly Constituency
                                    Text("Assembly Constituency",
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
                                      height: ResponsiveHelper.height(context) *
                                          0.05,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: PaddingConstant.l,
                                            right: PaddingConstant.l),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            value: reg.selectedAssembly,
                                            isExpanded: true,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            hint: const Text(
                                                'Select Assembly Constituency',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: black,
                                                    fontSize: 12)),
                                            items:
                                                reg.assemblyList.map((items) {
                                              return DropdownMenuItem(
                                                value: items.name,
                                                child: Text('${items.name}',
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) => reg
                                                .setSelectedAssembly(newValue),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15),

                                    // Area
                                    Text("Area",
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
                                      height: ResponsiveHelper.height(context) *
                                          0.05,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: PaddingConstant.l,
                                            right: PaddingConstant.l),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                              value: reg.selectedArea,
                                              isExpanded: true,
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),
                                              hint: const Text('Select Area',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: black,
                                                      fontSize: 12)),
                                              items: reg.areaList.map((items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        color: black,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                reg.setSelectedArea(newValue);
                                              }),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15),

                                    // Sub-District
                                    Text("Sub-District",
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
                                      height: ResponsiveHelper.height(context) *
                                          0.05,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: PaddingConstant.l,
                                            right: PaddingConstant.l),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            value: reg.selectedTehsil,
                                            isExpanded: true,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            hint: const Text(
                                                'Select Sub-District',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: black,
                                                    fontSize: 12)),
                                            items: reg.tehsilList.map((items) {
                                              return DropdownMenuItem(
                                                value: items.name,
                                                child: Text('${items.name}',
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) =>
                                                reg.setSelectedTehsil(newValue,
                                                    data.userProfileInfo),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15),

                                    // Town/Village
                                    Text("Town/Village",
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
                                      height: ResponsiveHelper.height(context) *
                                          0.05,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: PaddingConstant.l,
                                            right: PaddingConstant.l),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            value: reg.selectedTownOrVillage,
                                            isExpanded: true,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            hint: const Text(
                                                'Select Town/Village',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: black,
                                                    fontSize: 12)),
                                            items: reg.townOrVillageList
                                                .map((items) {
                                              return DropdownMenuItem(
                                                value: items.name,
                                                child: Text('${items.name}',
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              );
                                            }).toList(),
                                            onChanged: (newValue) =>
                                                reg.setSelectedTownOrVillage(
                                                    newValue),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15),

                                    // Panchayat/Ward
                                    Text("Panchayat/Ward",
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
                                      height: ResponsiveHelper.height(context) *
                                          0.05,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: PaddingConstant.l,
                                            right: PaddingConstant.l),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            value: reg.selectedPanchayatWard,
                                            isExpanded: true,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            hint: const Text(
                                                'Select Panchayat/Ward',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: black,
                                                    fontSize: 12)),
                                            items: reg.panchayatWardList
                                                .map((items) {
                                              return DropdownMenuItem(
                                                value: items.name,
                                                child: Text('${items.name}',
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) =>
                                                reg.setSelectedPanchayatWard(
                                                    newValue),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15),

                                    // Block
                                    Text("Block",
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
                                      height: ResponsiveHelper.height(context) *
                                          0.05,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: PaddingConstant.l,
                                            right: PaddingConstant.l),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            value: reg.selectedBlock,
                                            isExpanded: true,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            hint: const Text('Select Block',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: black,
                                                    fontSize: 12)),
                                            items: reg.blockList.map((items) {
                                              return DropdownMenuItem(
                                                value: items.name,
                                                child: Text('${items.name}',
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) =>
                                                reg.setSelectedBlock(newValue,
                                                    data.userProfileInfo),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15),

                                    // Block
                                    Text("Thana",
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
                                      height: ResponsiveHelper.height(context) *
                                          0.05,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: PaddingConstant.l,
                                            right: PaddingConstant.l),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            value: reg.selectedThana,
                                            isExpanded: true,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            hint: const Text('Select Thana',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: black,
                                                    fontSize: 12)),
                                            items: reg.thanaList.map((items) {
                                              return DropdownMenuItem(
                                                value: items.name,
                                                child: Text('${items.name}',
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) =>
                                                reg.setSelectedThana(newValue),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15),

                                    // Block
                                    Text("Post Office",
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
                                      height: ResponsiveHelper.height(context) *
                                          0.05,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: PaddingConstant.l,
                                            right: PaddingConstant.l),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            value: reg.selectedPostOffice,
                                            isExpanded: true,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            hint: const Text(
                                                'Select Post Office',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: black,
                                                    fontSize: 12)),
                                            items:
                                                reg.postOfficeList.map((items) {
                                              return DropdownMenuItem(
                                                value: items.name,
                                                child: Text('${items.name}',
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) =>
                                                reg.setSelectedPostOffice(
                                              newValue,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15),

                                    // Street/Locality
                                    Text("Street/Locality ",
                                        style: commonTextStyle14(color: white)),
                                    SizedBox(height: 10),
                                    customTextFormField2(
                                        isMendatory: false,
                                        textRegex: addressReg,
                                        controller:
                                            reg.streetTextEditingController,
                                        title: 'Street/Locality ',
                                        //length: 50,
                                        color: black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        keyboardType: TextInputType.name),
                                    SizedBox(height: 15),

                                    // Building /House No
                                    Text("Building /House No",
                                        style: commonTextStyle14(color: white)),
                                    SizedBox(height: 10),
                                    customTextFormField2(
                                        isMendatory: false,
                                        textRegex: addressReg,
                                        controller:
                                            reg.houseNoTextEditingController,
                                        title: 'Building /House No.',
                                        length: 50,
                                        color: black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        keyboardType: TextInputType.name),
                                    SizedBox(height: 15),

                                    // Pin Code
                                    Text("Pin Code",
                                        style: commonTextStyle14(color: white)),
                                    SizedBox(height: 10),
                                    customTextFormField2(
                                        isMendatory: false,
                                        textRegex: pinCodeReg,
                                        controller:
                                            reg.pinCodeTextEditingController,
                                        title: 'Pin Code',
                                        inputFormatter: [
                                          LengthLimitingTextInputFormatter(6)
                                        ],
                                        length: 6,
                                        color: black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        keyboardType: TextInputType.number),
                                  ],
                                ),
                              )
                            ],

                            // Submit Button
                            SizedBox(
                                height:
                                    ResponsiveHelper.height(context) * 0.04),
                            Bounce(
                              duration: const Duration(milliseconds: 110),
                              onPressed: () {
                                if (pageNo == 0) {
                                  if (formKey1.currentState!.validate()) {
                                    if (reg.selectedGender == null) {
                                      errorToast('Please Select Gender');
                                    } else if (reg.dobTextEditingController.text
                                        .isEmpty) {
                                      errorToast('Please Select D-O-B');
                                    } else if (reg.selectedReleation == null) {
                                      errorToast('Please Select Relation');
                                    } else {
                                      setState(() {
                                        pageNo = 1;
                                      });
                                    }
                                  }
                                } else {
                                  if (formKey2.currentState!.validate()) {
                                    if (reg.selectedState == null) {
                                      errorToast('Please Select State');
                                    } else if (reg.selectedDistrict == null) {
                                      errorToast('Please Select District');
                                    } else if (reg.selectedParliamentry ==
                                        null) {
                                      errorToast(
                                          'Please Select Parliamentary Constituency');
                                    } else if (reg.selectedAssembly == null) {
                                      errorToast(
                                          'Please Select Assembly Constituency');
                                    } else if (reg.selectedArea == null) {
                                      errorToast('Please Select Area');
                                    } else if (reg.selectedTehsil == null) {
                                      errorToast('Please Select Sub-District');
                                    } else if (reg.selectedTownOrVillage ==
                                        null) {
                                      errorToast('Please Select Town/Village');
                                    } else if (reg.selectedPanchayatWard ==
                                        null) {
                                      errorToast(
                                          'Please Select Panchayat/Ward');
                                    } else if (reg.selectedBlock == null) {
                                      errorToast('Please Select Block');
                                    } else if (reg.selectedThana == null) {
                                      errorToast('Please Select Thana');
                                    } else if (reg.selectedPostOffice == null) {
                                      errorToast('Please Select Post Office');
                                    } else {
                                      UpdateProfileModelParams updateProfileModelParams = UpdateProfileModelParams(
                                          userId: auth.getUserId(),
                                          voterId: reg
                                              .voterIdTextEditingController.text
                                              .toString(),
                                          aadhaarCard: reg
                                              .aadharNoTextEditingController
                                              .text
                                              .toString(),
                                          name: reg.nameTextEditingController.text
                                              .toString(),
                                          gender: '${reg.selectedGender}',
                                          dob: reg.dobTextEditingController.text
                                              .toString(),
                                          guardianName: reg
                                              .guardianNameTextEditingController
                                              .text
                                              .toString(),
                                          relation:
                                              reg.selectedReleation.toString(),
                                          mobile: reg
                                              .mobileNoTextEditingController
                                              .text
                                              .toString(),
                                          email: reg
                                              .emailTextEditingController.text
                                              .toString(),
                                          stateId: reg.getStateId(
                                              '${reg.selectedState}'),
                                          districtId:
                                              reg.getDistrictId('${reg.selectedDistrict}'),
                                          tehsilId: reg.getTehsilId('${reg.selectedTehsil}'),
                                          blockId: reg.selectedArea == 'Rural' ? reg.getBlockId('${reg.selectedBlock}') : '',
                                          area: reg.selectedArea ?? '',
                                          parliamentaryId: reg.getParliamentryId('${reg.selectedParliamentry}'),
                                          assemblyId: reg.getAssemblyId('${reg.selectedAssembly}'),
                                          locality: reg.streetTextEditingController.text.toString(),
                                          houseNo: reg.houseNoTextEditingController.text.toString(),
                                          pincode: reg.pinCodeTextEditingController.text.toString(),
                                          landMark: '',
                                          panchayatWardId: reg.getPanchayatWardId('${reg.selectedPanchayatWard}'),
                                          postOfficeId: reg.getPostOfficeId('${reg.selectedPostOffice}'),
                                          thanaId: reg.getThanaId('${reg.selectedThana}'),
                                          townVillageId: reg.getTownOrVillageId('${reg.selectedTownOrVillage}'));
                                      data
                                          .updateProfile(
                                              updateProfileModelParams,
                                              auth.getUserId(),
                                              reg,
                                              context)
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
                                        color: primaryDark.withOpacity(0.1)),
                                    color: colorRed),
                                margin: const EdgeInsets.only(left: 5),
                                child: Center(
                                    child: Text(pageNo == 0 ? 'Next' : 'Submit',
                                        style:
                                            commonTextStyle13(color: white))),
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
        ),
      ),
    );
  }

  selectDob(RegisterProvider data) async {
    await showDatePicker(
            context: context,
            currentDate: DateTime.now(),
            initialDate: data.dobInitialDate,
            lastDate: DateTime.now().subtract(Duration(days: (365 * 18) + 4)),
            firstDate: DateTime(1950))
        .then((value) {
      if (value != null) {
        // if (DateTimeHelper.calculateAge(value) >= 18) {
        data.setDonInitialDate(value);
        data.setDOBTextEditingController(DateTimeHelper.formattedDate(value));
        data.setAge(DateTimeHelper.calculateAge(value).toString());
        // } else {
        //   customToast(msg: 'Age must be greater than 18', color: errorColor);
        // }
      }
      return null;
    });
  }

  errorToast(String msg) {
    customToast(msg: msg, color: errorColor);
  }
}
