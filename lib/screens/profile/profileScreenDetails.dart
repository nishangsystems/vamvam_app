import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/helpers/enumHelper.dart';
import 'package:vam_vam/providers/profileprovider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/screens/webView/webViewScreen.dart';

import '../../../../../helpers/mockHelper.dart';
import '../../../../../helpers/responsiveHelper.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/constant.dart';
import '../../../../../utils/paddingConstant.dart';
import '../../../../../widgets/commonWidgets/commonWidgets.dart';
import '../../../../../widgets/commonWidgets/textStyle.dart';
import '../../helpers/commonHelper.dart';
import '../../providers/AuthProvider.dart';

class ProfileScreenDetails extends StatefulWidget {
  const ProfileScreenDetails({super.key});

  @override
  State<ProfileScreenDetails> createState() => _ProfileScreenDetailsState();
}

class _ProfileScreenDetailsState extends State<ProfileScreenDetails> {
  var selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer2<ProfileProvider, RoleProvider>(
      builder: (context, data, role, child) => LoadingOverlay(
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
                      physics: const BouncingScrollPhysics(),
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
                                            color:
                                                Colors.white.withOpacity(0.4),
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
                                            BorderRadius.circular(12.0),
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
                                                    color: Colors.white
                                                        .withOpacity(0.4),
                                                    offset: const Offset(
                                                        -6.0, -6.0),
                                                    blurRadius: 16.0,
                                                  ),
                                                  BoxShadow(
                                                    color: Colors.white
                                                        .withOpacity(0.1),
                                                    offset:
                                                        const Offset(6.0, 6.0),
                                                    blurRadius: 16.0,
                                                  ),
                                                ],
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                                borderRadius:
                                                    BorderRadius.circular(60.0),
                                                // image: const DecorationImage(
                                                //     image: AssetImage(
                                                //         ImageResources
                                                //             .profileImage),
                                                //     fit: BoxFit.fill)
                                              ),
                                              width: 90.0,
                                              height: 90.0,
                                              child: ProfilePicture(
                                                name: Provider.of<AuthProvider>(
                                                            context,
                                                            listen: false)
                                                        .isSkip
                                                    ? 'Guest'
                                                    : Provider.of<ProfileProvider>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .userProfileInfo
                                                                    .name ==
                                                                null ||
                                                            Provider.of<ProfileProvider>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .userProfileInfo
                                                                    .name ==
                                                                ''
                                                        ? role.roleType ==
                                                                getRoleType(
                                                                    RoleEnum.student)
                                                            ? 'Student'
                                                            : role.roleType == getRoleType(RoleEnum.teacher)
                                                                ? 'Teacher'
                                                                : 'Parent'
                                                        : '${Provider.of<ProfileProvider>(context, listen: false).userProfileInfo.name}',
                                                radius: 45,
                                                fontsize: 24,
                                              ),
                                              /*      child:  Align(
                                                alignment: Alignment.bottomRight,
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.grey[100],
                                                  radius: 18.0,
                                                  child: const Icon(
                                                    Icons.camera_alt,
                                                    color:black,
                                                  ),
                                                ),
                                              ),*/
                                            ),
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
                                                  ? '#${data.userProfileInfo.executiveUniqueId ?? '0'}'
                                                  : '#${data.userProfileInfo.leaderUniqueId ?? '0'}',
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
                              ]),
                            ]),
                          ),
                          SizedBox(
                              height: ResponsiveHelper.height(context) * 0.02),
                          ListView.builder(
                              itemCount: MockHelper.profileList.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                var item = MockHelper.profileList[index];
                                return index == 4
                                    ? SizedBox.shrink()
                                    : index == 2 &&
                                            role.roleType ==
                                                getRoleType(RoleEnum.parent)
                                        ? SizedBox.shrink()
                                        : index == 4 &&
                                                role.roleType ==
                                                    getRoleType(
                                                        RoleEnum.student)
                                            ? box(item, index)
                                            : index == 4 &&
                                                    (role.roleType ==
                                                            getRoleType(RoleEnum
                                                                .teacher) ||
                                                        role.roleType ==
                                                            getRoleType(RoleEnum
                                                                .leader))
                                                ? SizedBox.shrink()
                                                : index != 1 && index != 3
                                                    ? box(item, index)
                                                    : SizedBox.shrink();
                              }),
                          SizedBox(
                              height: ResponsiveHelper.height(context) * 0.04),
                          commonButtonWhite(
                              width: double.infinity,
                              bgColors: [Colors.red, Colors.red],
                              title: 'Logout',
                              txtColor: white,
                              fontSize: 12,
                              onTap: () {
                                logoutDialog(context: context);
                              }),
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
    );
  }

  Widget box(var item, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectIndex = index;
          });
          selectIndex == 0 ? context.push(profile) : '';
          if (index == 2) {
            context.push(notificationlistscreen);
          } else if (index == 4) {
            context.push(setting);
          } else if (index == 6) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        WebViewScreen(status: PrivacyTermsEnum.about)));
          } else if (index == 5) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebViewScreen(
                          status: PrivacyTermsEnum.privacy,
                        )));
          } else if (index == 3) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebViewScreen(
                          status: PrivacyTermsEnum.terms,
                        )));
          } else if (index == 7) {
            rateUs();
          }
        },
        child: Container(
          width: ResponsiveHelper.width(context),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.4),
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
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ListTile(
              leading: index == 4 || index == 6 || index == 2
                  ? Icon(
                      index == 6
                          ? Icons.error
                          : index == 2
                              ? Icons.notifications_rounded
                              : Icons.settings,
                      color: black,
                      size: 26,
                    )
                  : Image.asset(
                      item['image'],
                      width: 22,
                      height: 22,
                    ),
              title:
                  Text(item['title'], style: commonTextStyle14(color: black)),
              trailing: const Icon(Icons.arrow_forward_ios)),
        ),
      ),
    );
  }
}
