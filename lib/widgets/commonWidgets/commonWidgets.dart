// ignore_for_file: file_names, unnecessary_null_comparison

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/data/model/response/representative/repComplaintModel.dart';
import 'package:vam_vam/helpers/dateTimeHelper.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/locationMapProvider.dart';
import 'package:vam_vam/providers/parentProvider.dart';
import 'package:vam_vam/providers/profileprovider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/screens/modules/search/search_widget.dart';
import 'package:vam_vam/utils/fontConstant.dart';
import 'package:vam_vam/utils/paddingConstant.dart';
import 'package:vam_vam/widgets/commonWidgets/textStyle.dart';

import '../../helpers/commonHelper.dart';
import '../../helpers/dialogHelper.dart';
import '../../helpers/enumHelper.dart';
import '../../helpers/responsiveHelper.dart';
import '../../screens/loader/loaderOverlay.dart';
import '../../utils/colors.dart';
import '../../utils/constant.dart';
import '../../utils/imageResources.dart';
import '../../utils/schoolPreference.dart';
import '../../utils/stringResources.dart';
import 'appDesign.dart';

Widget blueBackContainer({required Widget child, Color? color}) => Container(
      height: height,
      width: width,
      color: color ?? primaryDark,
      child: child,
    );

Widget loginHeaderContainer(BuildContext context) => Container(
      height: 290,
      width: ResponsiveHelper.width(context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(180)),
           color: primaryDark
          ),
      child: Center(
          child: Image.asset(
        ImageResources.logo,
        height: 100,
        fit: BoxFit.fill,
      )),
    );
// Widget loginHeaderContainer() => Container(
//     width: width,
//     height: height * 0.22,
//     decoration: const BoxDecoration(
//       borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(80), bottomRight: Radius.circular(80)),
//       boxShadow: [
//         BoxShadow(color: Colors.white, offset: Offset(1.0, 1.0)),
//       ],
//     ),
//     child: Align(
//       alignment: Alignment.bottomCenter,
//       child: Padding(
//         padding: const EdgeInsets.only(bottom: 10.0),
//         child: Image.asset(ImageResources.splashImg, height: 100, width: 100),
//       ),
//     ));

Widget appBarHeaderContainer(
        {required BuildContext context,
        required String title,
        required Color color,
        Function? onBack}) =>
    Bounce(
      duration: const Duration(milliseconds: 120),
      onPressed: () {
        if (onBack == null) {
          context.pop();
        } else {
          onBack();
        }
      },
      child: Container(
          alignment: Alignment.center,
          width: width,
          height: ResponsiveHelper.height(context) * 0.12,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45)),
            boxShadow: [
              BoxShadow(color: Colors.white, offset: Offset(1.0, 1.0)),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: 14,
                right: 14,
                top: ResponsiveHelper.height(context) * 0.018),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.arrow_back, color: black, size: 24),
                Text(title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: black)),
                const SizedBox(width: 20)
              ],
            ),
          )),
    );

Widget commonButton({
  required double width,
  required VoidCallback onTap,
  required Widget child,
  color = Colors.white,
  bool isLoading = false,
  bool isBorder = false,
  double? radius,
  Color? bgColor,
}) =>
    Bounce(
      onPressed: onTap,
      duration: const Duration(milliseconds: 100),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 8),
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10),
          border: Border.all(
              width: isBorder ? 1 : 0, color: bgColor ?? primaryLight),
          gradient: isBorder
              ? null
              : LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.mirror,
                  colors: [
                    bgColor ?? primaryLight,
                    bgColor ?? primaryDark,
                  ],
                ),
        ),
        child: isLoading
            ? const Center(
                child: SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: white,
                    )),
              )
            : child,
      ),
    );

Widget commonButtonWhite({
  required double width,
  required VoidCallback onTap,
  required String title,
  required Color txtColor,
  double? fontSize,
  required List<Color> bgColors,
  Text? child,
}) =>
    Bounce(
      onPressed: onTap,
      duration: const Duration(milliseconds: 500),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: PaddingConstant.m),
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.mirror,
            colors: bgColors,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: txtColor,
                fontSize: fontSize ?? FontConstant.m,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );

Widget get borderContainer => Container(width: width, height: 1, color: white);

Widget commonBackButton(
        {required BuildContext context,
        required String title,
        required Color backBtnColor}) =>
    Bounce(
      onPressed: () {
        context.pop();
      },
      duration: const Duration(milliseconds: 150),
      child: Padding(
        padding: const EdgeInsets.only(left: 0, top: 0),
        child: Row(
          children: [
            if (context.canPop()) ...[
              Icon(
                Icons.arrow_back,
                size: 24,
                color: backBtnColor,
              ),
            ],
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(color: backBtnColor, fontSize: 16),
            )
          ],
        ),
      ),
    );

Widget homeAppbar({
  required BuildContext context,
  required String profileImage,
  required String name,
  required String location,
}) =>
    AppBar(
      leading: GestureDetector(
        onTap: () {
          if (Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {
            context.push(profileDetails);
          } else {
            warningToast(msg: 'Please login');
            Provider.of<AuthProvider>(context, listen: false).logout(context);
          }
        },
        child: Consumer<RoleProvider>(
          builder: (context, role, child) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProfilePicture(
                name: Provider.of<ProfileProvider>(context, listen: true)
                                .userProfileInfo
                                .name ==
                            null ||
                        Provider.of<ProfileProvider>(context, listen: true)
                            .userProfileInfo
                            .name!
                            .isEmpty
                    ? role.roleType == getRoleType(RoleEnum.student)
                        ? 'Student'
                        : role.roleType == getRoleType(RoleEnum.teacher)
                            ? 'Lecturer'
                            : 'Parent'
                    : Provider.of<ProfileProvider>(context, listen: true)
                            .userProfileInfo
                            .name ??
                        (role.roleType == getRoleType(RoleEnum.student)
                            ? 'Student'
                            : role.roleType == getRoleType(RoleEnum.teacher)
                                ? 'Lecturer'
                                : 'Parent'),
                radius: 0,
                fontsize: 16,
              )
              //  CircleAvatar(
              //   backgroundImage: AssetImage(profileImage),
              // ),
              ),
        ),
      ),
      // flexibleSpace: ,
      title: Consumer4<ProfileProvider, LocationMapProvider, AuthProvider,
              RoleProvider>(
          builder: (context, provider, location, auth, role, child){

            return
              role.roleType != getRoleType(RoleEnum.student)
                  ? GestureDetector(
                onTap: () {
                  if (auth.isLoggedIn()) {
                    context.push(profileDetails);
                  } else {
                    warningToast(msg: 'Please login');
                    context.go(splash);
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        provider.userProfileInfo.name == null ||
                            provider.userProfileInfo.name!.isEmpty
                            ? (role.roleType ==
                            getRoleType(RoleEnum.student)
                            ? 'Student'
                            : role.roleType ==
                            getRoleType(RoleEnum.teacher)
                            ? 'Lecturer'
                            : 'Parent')
                            : provider.userProfileInfo.name ?? '',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: role.roleType ==
                                getRoleType(RoleEnum.student)
                                ? 12
                                : 14,
                            fontWeight: FontWeight.w600)),
                    if( provider.userProfileInfo.matric != null)...[
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.,
                        children: [
                          Text('Matricule : ',
                              maxLines: 2,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                                '${provider.userProfileInfo.matric}',
                                maxLines: 1,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                    ],
                    // Academic Year
                    if (provider.studentProfileModel.currentYear != null)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.,
                        children: [
                          Text('Academic Year: ',
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                                '${provider.studentProfileModel.currentYear}',
                                maxLines: 2,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),

                    // Semester
                    if (provider.studentProfileModel.currentSemester !=
                        null) ...[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.,
                        children: [
                          if (provider
                              .studentProfileModel.currentSemester !=
                              null) ...[
                            Text('Semester : ',
                                maxLines: 1,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                  '${provider.studentProfileModel.currentSemester}',
                                  maxLines: 1,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ],
                        ],
                      ),
                    ]
                  ],
                ),
              )
                  : SizedBox.shrink();
          }),
      flexibleSpace: Consumer4<ProfileProvider, LocationMapProvider,
              AuthProvider, RoleProvider>(
          builder: (context, provider, location, auth, role, child) => role
                      .roleType ==
                  getRoleType(RoleEnum.student)
              ? Padding(
                  padding: const EdgeInsets.only(left: 55, top: 35),
                  child: GestureDetector(
                    onTap: () {
                      if (auth.isLoggedIn()) {
                        context.push(profileDetails);
                      } else {
                        warningToast(msg: 'Please login');
                        context.go(splash);
                      }
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(provider.userProfileInfo.name ?? '',
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600)),

                        // Matricule
                        if( provider.userProfileInfo.matric != null)...[
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.,
                            children: [
                              Text('Matricule : ',
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                    '${provider.userProfileInfo.matric}',
                                    maxLines: 1,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ],
                          ),
                        ],

                        if( provider.userProfileInfo.level_id != null)...[
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.,
                            children: [
                              Text('Level : ',
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                    '${provider.userProfileInfo.level_id}',
                                    maxLines: 1,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ],
                          ),
                        ],

                        if( provider.userProfileInfo.program_id != null)...[
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.,
                            children: [
                              Text('Program : ',
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                    '${provider.userProfileInfo.program_id}',
                                    maxLines: 1,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ],
                          ),
                        ],

                        if (provider.userProfileInfo != null &&
                                provider.userProfileInfo.userUniqueId != null &&
                        provider.studentProfileModel.currentYear != null

                            ) ...[
                          // Academic Year
                          if (provider.studentProfileModel.currentYear != null)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.,
                              children: [
                                Text('Academic Year: ',
                                    maxLines: 1,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                      '${provider.studentProfileModel.currentYear}',
                                      maxLines: 2,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                ),
                              ],
                            ),

                          // Semester
                          if (provider.studentProfileModel.currentSemester !=
                              null) ...[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.,
                              children: [
                                if (provider
                                        .studentProfileModel.currentSemester !=
                                    null) ...[
                                  Text('Semester: ',
                                      maxLines: 1,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                        '${provider.studentProfileModel.currentSemester}',
                                        maxLines: 1,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ],
                              ],
                            ),
                          ]
                        ],
                      ],
                    ),
                  ),
                )
              : SizedBox.shrink()),
      actions: [
        Consumer<RoleProvider>(
          builder: (context, role, child) => Bounce(
              duration: Duration(milliseconds: 500),
              onPressed: () {
                if (role.roleType == getRoleType(RoleEnum.student)) {
                  context.push(userBottomHomeBar);
                } else if (role.roleType == getRoleType(RoleEnum.leader)) {
                  context.push(adminBottomHomeBar);
                } else if (role.roleType == getRoleType(RoleEnum.teacher)) {
                  context.push(represantativeBottomHomeBar);
                } else {
                  context.push(paretnBottomHomeBar);
                }
              },
              child: Icon(Icons.home_outlined)),
        ),
        SizedBox(
          width: 5,
        ),
        if (Provider.of<RoleProvider>(context, listen: false).roleType !=
            getRoleType(RoleEnum.parent))
          Bounce(
              duration: Duration(milliseconds: 500),
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => NotificationListScreen()));
                context.push(notificationlistscreen);
              },
              child: Icon(Icons.notifications_none_rounded)),
        SizedBox(
          width: 10,
        ),
      ],
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Color(0x220875C7), width: 1),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(35),
        ),
      ),
    );

Widget indexAppbar(context) => AppBar(
      backgroundColor: primaryDark,
      excludeHeaderSemantics: true,
      clipBehavior: Clip.antiAlias,
      flexibleSpace: Container(
        height: 280,
        width: double.infinity,
        padding:
            const EdgeInsets.only(top: 60, bottom: 10, left: 16, right: 16),
        decoration: const BoxDecoration(
          color: vamPrimaryColor,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  ImageResources.logo,
                  height: 50,
                  fit: BoxFit.fill,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SearchWidget()));
                    },
                    icon:
                        Icon(Icons.search, color: white, size: 30, weight: 5)),
              ],
            )
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50),
        ),
      ),
    );

Widget get dividerContainer => Container(
      width: double.infinity,
      height: 1,
      color: const Color(0xFFD9D9D9),
    );

Widget customRatingBar({required initial}) {
  return RatingBar.builder(
    initialRating: initial,
    minRating: 0,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    itemSize: 28,
    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
    itemBuilder: (context, _) => const Icon(
      Icons.star,
      color: ratingColor,
    ),
    onRatingUpdate: (rating) {
      // print(rating);
    },
  );
}

logoutDialog({required BuildContext context}) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    elevation: 10,
    enableDrag: true,
    context: context,
    builder: (BuildContext context) {
      return Consumer4<AuthProvider, ProfileProvider, ParentProvider,
          RoleProvider>(
        builder: (context, auth, profile, parent, role, child) =>
            SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(PaddingConstant.m),
              child: LoadingOverlay(
                isLoading: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          StringResources.logOut,
                          style: TextStyle(
                              color: primaryDark,
                              fontSize: FontConstant.xxl,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          StringResources.logOutText,
                          style: TextStyle(color: textColor2),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    commonButtonWhite(
                        width: double.infinity,
                        bgColors: [primaryDark, primaryDark],
                        title: 'Logout',
                        txtColor: white,
                        fontSize: 12,
                        onTap: () {
                          SchoolPreference.getSchoolID().then((school_id) {
                            var messaging = FirebaseMessaging.instance;
                            messaging.unsubscribeFromTopic(
                                'school_${school_id}_teachers');
                            messaging.unsubscribeFromTopic(
                                'school_${school_id}_general');
                            messaging.unsubscribeFromTopic(
                                'school_${school_id}_students');
                          });

                          profile.clearUserDetails();
                          // Navigator.of(context).pop();
                          // auth.logoutvam_vam(context).then((value) {
                          //   if (value.isSuccess) {
                          //     successToast(msg: value.message);
                          //   } else {
                          //     errorToast(msg: value.message);
                          //   }
                          // });
                          // if (role.roleType == getRoleType(RoleEnum.parent)) {
                          //   runZonedGuarded(
                          //       () => parent.parentLogout(), (error, stack) {});
                          // }

                          auth.logout(context);
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    commonButtonWhite(
                        width: double.infinity,
                        bgColors: [
                          black.withOpacity(0.5),
                          black.withOpacity(0.5)
                        ],
                        title: 'Cancel',
                        txtColor: white,
                        fontSize: 12,
                        onTap: () {
                          context.pop();
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

Widget complaintStatusBox({
  required BuildContext context,
  required int index,
  required RepCompaintModelData item,
  required bool isAdmin,
}) =>
    Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: GestureDetector(
        onTap: () =>
            showRepresantativeComplaintDialog(context: context, item: item),
        child: commonContainerList(
            child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                        color: getStatusColor('${item.statusString}'),
                        shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 10),
                  Text('${item.statusString}',
                      style: TextStyle(
                          color: primaryDark,
                          fontWeight: FontWeight.w400,
                          fontSize: 12)),
                  const SizedBox(width: 5),
                  Text(
                    '  (#${item.complaintCode})',
                    textAlign: TextAlign.end,
                    style: commonTextStyle12(color: primaryDark),
                  ),
                  const Spacer(),
                  if (!isAdmin) ...[
                    PopupMenuButton<String>(
                      padding: EdgeInsets.zero,
                      onSelected: (String result) {
                        print(result);
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                          value: 'Track',
                          child: Text(
                            'Track',
                            style: commonTextStyle12(color: textColor),
                          ),
                          onTap: () {
                            context.push(
                                '$represantativeTrackComplaint/${item.complaintId}');
                          },
                        ),
                        PopupMenuItem<String>(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                          value: 'Update',
                          child: Text(
                            'Update',
                            style: commonTextStyle12(color: textColor),
                          ),
                          onTap: () {
                            context.push(
                                '$represantativeUpdateComplaint/${item.complaintId}/${item.assignComplaintId}');
                          },
                        ),
                        PopupMenuItem<String>(
                          onTap: () {
                            context.push(
                                '$repRequestApprovalScreen/${item.complaintId}');
                          },
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                          value: 'Request Approvals',
                          child: Text(
                            'Request Approvals',
                            style: commonTextStyle12(color: textColor),
                          ),
                        ),
                      ],
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     context.push(
                    //         '$represantativeTrackComplaint/${item.complaintId}');
                    //   },
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         color: primaryDark,
                    //         borderRadius: BorderRadius.circular(8.0)),
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(
                    //           top: 1.0, bottom: 1.0, left: 8, right: 8),
                    //       child: Text(
                    //         'Track',
                    //         style: commonTextStyle12(color: white),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    // GestureDetector(
                    //   onTap: () {
                    //     context.push(
                    //         '$represantativeUpdateComplaint/${item.complaintId}/${item.assignComplaintId}');
                    //   },
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         color: primaryDark,
                    //         borderRadius: BorderRadius.circular(8.0)),
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(
                    //           top: 1.0, bottom: 1.0, left: 8, right: 8),
                    //       child: Text(
                    //         'Update',
                    //         style: commonTextStyle12(color: white),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.of(context).push(MaterialPageRoute(
                    //         builder: (context) => RepRequestApprovalScreen(
                    //               complaintId: item.complaintId!,
                    //             )));
                    //   },
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         color: primaryDark,
                    //         borderRadius: BorderRadius.circular(8.0)),
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(
                    //           top: 1.0, bottom: 1.0, left: 8, right: 8),
                    //       child: Text(
                    //         'Req-App',
                    //         style: commonTextStyle12(color: white),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ],
              ),
              Text(
                '       ${DateTimeHelper.getUserDate('${item.complaintDate}')}',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: primaryDark),
              ),
              SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${item.userName}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: primaryDark),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 4.0, bottom: 4.0, left: 6, right: 6),
                      child: Text(
                        '${item.issueTypeName}',
                        style: commonTextStyle13(color: black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      '${item.message}',
                      style: commonTextStyle12(color: black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ResponsiveHelper.height(context) * 0.01),
            ],
          ),
        )),
      ),
    );

void customToast(
    {required String msg, required Color color, bool isLong = false}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}

void errorToast({required String msg, bool isLong = false}) {
  customToast(msg: msg, color: errorColor, isLong: isLong);
}

void successToast({required String msg}) {
  customToast(msg: msg, color: successColor);
}

void warningToast({required String msg}) {
  customToast(msg: msg, color: warningColor);
}

commonButtonNew(
        {context,
        Color? color,
        String? imageIcon,
        IconData? icon,
        required String text,
        Color? textColor,
        required Function() onTap}) =>
    Bounce(
      duration: Duration(milliseconds: 110),
      onPressed: () => onTap(),
      child: Container(
        height: 65,
        padding: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 3),
            borderRadius: BorderRadius.circular(5),
            color: color ?? Theme.of(context).primaryColor),
        child: Row(
          children: [
            (imageIcon != '' && imageIcon != null)
                ? Image.asset(imageIcon, height: 30)
                : Icon(icon, color: textColor ?? white, size: 30),
            SizedBox(width: 30),
            Text(
              text,
              style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 18),
            )
          ],
        ),
      ),
    );

Widget commonButtonText(
    {context,
    double? width,
    double? height,
    Color? color,
    String? imageIcon,
    IconData? icon,
    required String text,
    Color? textColor,
    required Function() onTap}) {
  return Bounce(
    duration: Duration(milliseconds: 500),
    onPressed: onTap,
    child: Container(
      height: height ?? 40,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: primaryDark.withOpacity(0.5), width: 1.5),
          borderRadius: BorderRadius.circular(5),
          color: Color(0xFFFF985B)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
          child: Text(
            text,
            style: TextStyle(
                color: black, fontWeight: FontWeight.w700, fontSize: 12),
          ),
        ),
      ),
    ),
  );
}

double appBarHeight = 86;

Widget notDataFound(String? title) {
  return Center(
    child: Text(
      title ?? 'No Data Found!',
      style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: white.withOpacity(0.5)),
    ),
  );
}
