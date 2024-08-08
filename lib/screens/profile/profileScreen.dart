// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/helpers/commonHelper.dart';
import 'package:vam_vam/helpers/enumHelper.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/profileprovider.dart';
import 'package:vam_vam/providers/registerProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import '../../../../../helpers/responsiveHelper.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/constant.dart';
import '../../../../../utils/imageResources.dart';
import '../../../../../utils/paddingConstant.dart';
import '../../../../../widgets/commonWidgets/commonWidgets.dart';
import '../../../../../widgets/commonWidgets/textStyle.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool microsshow = false;
  bool microsshowdetails = false;
  @override
  Widget build(BuildContext context) {
    return Consumer4<ProfileProvider, RoleProvider, AuthProvider,
        RegisterProvider>(
      builder: (context, data, role, auth, register, child) => LoadingOverlay(
        isLoading: data.isLoading,
        child: Scaffold(
          backgroundColor: primaryDark,
          body: SafeArea(
            top: false,
            child: Column(
              children: [
                appBarHeaderContainer(
                    context: context, title: 'Profile', color: black),
                SizedBox(height: ResponsiveHelper.height(context) * 0.02),
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
                          Container(
                            alignment: Alignment.center,
                            height: ResponsiveHelper.height(context) * 0.2,
                            child: Stack(children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Center(
                                  child: Card(
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Container(
                                      width: ResponsiveHelper.width(context),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: white.withOpacity(0.4),
                                            offset: const Offset(-6.0, -6.0),
                                            blurRadius: 16.0,
                                          ),
                                          BoxShadow(
                                            color: black.withOpacity(0.1),
                                            offset: const Offset(6.0, 6.0),
                                            blurRadius: 16.0,
                                          ),
                                        ],
                                        color: white,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Stack(children: [
                                Center(
                                  child: Column(
                                    children: [
                                      Hero(
                                        tag: 'imageHero',
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: CircleAvatar(
                                            radius: 50.0,
                                            backgroundColor:
                                                const Color(0xffffffff),
                                            child: Container(
                                                alignment: Alignment.topRight,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: white
                                                            .withOpacity(0.4),
                                                        offset: const Offset(
                                                            -6.0, -6.0),
                                                        blurRadius: 16.0,
                                                      ),
                                                      BoxShadow(
                                                        color: white
                                                            .withOpacity(0.1),
                                                        offset: const Offset(
                                                            6.0, 6.0),
                                                        blurRadius: 16.0,
                                                      ),
                                                    ],
                                                    color:
                                                        white.withOpacity(0.4),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60.0),
                                                    image: const DecorationImage(
                                                        image: AssetImage(
                                                            ImageResources
                                                                .profileImage),
                                                        fit: BoxFit.fill)),
                                                width: 90.0,
                                                height: 90.0,
                                                child: role.roleType ==
                                                        getRoleType(
                                                            RoleEnum.student)
                                                    ? GestureDetector(
                                                        onTap: () {
                                                          data
                                                              .getProfile(
                                                                  auth.getUserId(),
                                                                  register,
                                                                  role.roleType,
                                                                  context)
                                                              .then((value) {
                                                            if (value
                                                                .isSuccess) {
                                                              context.push(
                                                                  editProfile);
                                                            } else {
                                                              errorToast(
                                                                  msg: value
                                                                      .message);
                                                            }
                                                          });
                                                        },
                                                        child: ProfilePicture(
                                                          name: Provider.of<
                                                                          AuthProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .isSkip
                                                              ? 'Guest'
                                                              : Provider.of<ProfileProvider>(context, listen: false)
                                                                              .userProfileInfo
                                                                              .name ==
                                                                          null ||
                                                                      Provider.of<ProfileProvider>(context, listen: false)
                                                                              .userProfileInfo
                                                                              .name ==
                                                                          ''
                                                                  ? 'Guest'
                                                                  : '${Provider.of<ProfileProvider>(context, listen: false).userProfileInfo.name}',
                                                          radius: 45,
                                                          fontsize: 24,
                                                        ),
                                                      )
                                                    : SizedBox.shrink()),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                          role.roleType ==
                                                  getRoleType(RoleEnum.student)
                                              ? '#${data.userProfileInfo.userUniqueId ?? '0'}'
                                              : role.roleType ==
                                                      getRoleType(
                                                          RoleEnum.teacher)
                                                  ? '#${data.userProfileInfo.executiveUniqueId ?? ''}'
                                                  : '#${data.userProfileInfo.leaderUniqueId ?? ''}',
                                          style:
                                              commonTextStyle13(color: black)),
                                      const SizedBox(height: 5),
                                      Text(
                                          Provider.of<AuthProvider>(context,
                                                      listen: false)
                                                  .isSkip
                                              ? 'Guest'
                                              : Provider.of<ProfileProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .userProfileInfo
                                                              .name ==
                                                          null ||
                                                      Provider.of<ProfileProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .userProfileInfo
                                                              .name ==
                                                          ''
                                                  ? role.roleType ==
                                                          getRoleType(
                                                              RoleEnum.student)
                                                      ? 'Student'
                                                      : role.roleType ==
                                                              getRoleType(
                                                                  RoleEnum
                                                                      .teacher)
                                                          ? 'Teacher'
                                                          : 'Parent'
                                                  : '${Provider.of<ProfileProvider>(context, listen: false).userProfileInfo.name}',
                                          style: commonTextStyle13(color: black)),
                                    ],
                                  ),
                                ),
                                if (role.roleType ==
                                    getRoleType(RoleEnum.student))
                                  Positioned(
                                    top: 70,
                                    left:
                                        ResponsiveHelper.width(context) * 0.5 -
                                            10,
                                    child: Bounce(
                                      duration: Duration(milliseconds: 500),
                                      onPressed: () {
                                        if (role.roleType ==
                                            getRoleType(RoleEnum.student)) {
                                          data
                                              .getProfile(
                                                  auth.getUserId(),
                                                  register,
                                                  role.roleType,
                                                  context)
                                              .then((value) {
                                            if (value.isSuccess) {
                                              context.push(editProfile);
                                            } else {
                                              errorToast(msg: value.message);
                                            }
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: 32,
                                        width: 32,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              spreadRadius: 2,
                                              blurRadius: 2,
                                              offset: Offset(0, 1),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.edit,
                                            size: 18,
                                            color: primaryLight,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                              ]),
                            ]),
                          ),
                          SizedBox(
                              height: ResponsiveHelper.height(context) * 0.05),
                          InkWell(
                            onTap: (() {
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (microsshow) {
                                setState(() {
                                  microsshow = false;
                                });
                              } else {
                                setState(() {
                                  microsshow = true;
                                });
                              }
                            }),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color:
                                    microsshow ? white.withOpacity(0.6) : white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 3, top: 3, bottom: 3),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Personal Information",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: black,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Icon(microsshow
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          if (microsshow)
                            SizedBox(
                              height: 10,
                            ),
                          if (microsshow)
                            Container(
                              decoration: BoxDecoration(
                                  color: colorcarddetails,
                                  borderRadius: BorderRadius.circular(5)),
                              padding: EdgeInsets.only(
                                  top: 1, bottom: 1, left: 1, right: 1),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    rowText(
                                        'Name', '${data.userProfileInfo.name}'),
                                    rowText('Gender',
                                        '${data.userProfileInfo.gender}'),
                                    rowText(
                                        'DOB', '${data.userProfileInfo.dob}'),
                                    rowText('Guardian Name',
                                        '${data.userProfileInfo.guardianName}'),
                                    rowText('Relation',
                                        '${data.userProfileInfo.relation}'),
                                    rowText('Mobile Number',
                                        '${data.userProfileInfo.mobile}'),
                                    rowText('Email ID',
                                        '${data.userProfileInfo.email}'),
                                    rowText('Aadhar No',
                                        '${data.userProfileInfo.aadhaarCard}',
                                        showDetails: false),
                                    rowText('Voter Id',
                                        '${data.userProfileInfo.voterId}',
                                        showDetails: false),
                                  ],
                                ),
                              ),
                            ),
                          SizedBox(
                            height: 20,
                          ),
                          if (role.roleType ==
                              getRoleType(RoleEnum.student)) ...[
                            if (data.userProfileInfo != null ||
                                data.userProfileInfo.stateName!.isNotEmpty ||
                                data.userProfileInfo.districtName!.isNotEmpty ||
                                data.userProfileInfo.tehsilName!.isNotEmpty ||
                                data.userProfileInfo.blockName!.isNotEmpty ||
                                data.userProfileInfo.parliamentaryName!
                                    .isNotEmpty ||
                                data.userProfileInfo.assemblyName!.isNotEmpty ||
                                data.userProfileInfo.assemblyName!.isNotEmpty ||
                                data.userProfileInfo.stateName!.isNotEmpty ||
                                data.userProfileInfo.houseNo!.isNotEmpty ||
                                data.userProfileInfo.pincode!.isNotEmpty) ...[
                              InkWell(
                                onTap: (() {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  if (microsshowdetails) {
                                    setState(() {
                                      microsshowdetails = false;
                                    });
                                  } else {
                                    setState(() {
                                      microsshowdetails = true;
                                    });
                                  }
                                }),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: microsshowdetails
                                        ? white.withOpacity(0.6)
                                        : white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 3, top: 3, bottom: 3),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Address Details",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: black,
                                              fontWeight: FontWeight.w500,
                                            )),
                                        Icon(microsshowdetails
                                            ? Icons.keyboard_arrow_up
                                            : Icons.keyboard_arrow_down),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              if (microsshowdetails)
                                SizedBox(
                                  height: 10,
                                ),
                              if (microsshowdetails)
                                Container(
                                  decoration: BoxDecoration(
                                      color: colorcarddetails,
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: EdgeInsets.only(
                                      top: 1, bottom: 1, left: 1, right: 1),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        rowText('State',
                                            '${data.userProfileInfo.stateName}'),
                                        rowText('District',
                                            '${data.userProfileInfo.districtName}'),
                                        rowText('Parliamentary Constituency',
                                            '${data.userProfileInfo.parliamentaryName}'),
                                        rowText('Assembly Constituency',
                                            '${data.userProfileInfo.assemblyName}'),
                                        rowText('Area',
                                            '${data.userProfileInfo.area}'),
                                        rowText('Sub-District',
                                            '${data.userProfileInfo.tehsilName}'),
                                        rowText('Town/Village',
                                            '${data.userProfileInfo.townVillageName}'),
                                        rowText('Panchayat/Ward',
                                            '${data.userProfileInfo.panchayatWardName}'),
                                        rowText('Block',
                                            '${data.userProfileInfo.blockName}'),
                                        rowText('Thana',
                                            '${data.userProfileInfo.thanaName}'),
                                        rowText('Post Office',
                                            '${data.userProfileInfo.postOfficeName}'),
                                        rowText('Street/Locality',
                                            '${data.userProfileInfo.locality}'),
                                        rowText('Building/House No',
                                            '${data.userProfileInfo.houseNo}'),
                                        rowText('Pin Code',
                                            '${data.userProfileInfo.pincode}'),
                                      ],
                                    ),
                                  ),
                                ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ],
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
    );
  }

  Widget rowText(String title, String detail, {bool showDetails = true}) {
    return detail != '' && detail != 'null'
        ? Column(
            children: [
              spacer,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$title :', style: commonTextStyle13(color: black)),
                  Text(showDetails ? detail : hideNumber(detail),
                      style: commonTextStyle13(color: black)),
                ],
              ),
            ],
          )
        : SizedBox.shrink();
  }

  Widget get spacer => SizedBox(height: 15);
}
