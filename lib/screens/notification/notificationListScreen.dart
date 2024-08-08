// ignore_for_file: avoid_print, unused_local_variable, unused_field
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/helpers/dateTimeHelper.dart';
import 'package:vam_vam/helpers/enumHelper.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/notificationProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/utils/imageResources.dart';
import 'package:vam_vam/widgets/commonWidgets/commonWidgets.dart';

import '../../../../helpers/responsiveHelper.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/fontConstant.dart';
import '../../../../utils/paddingConstant.dart';

class NotificationListScreen extends StatefulWidget {
  const NotificationListScreen({super.key});

  @override
  State<NotificationListScreen> createState() => _NotificationListScreenState();
}

class _NotificationListScreenState extends State<NotificationListScreen> {
  final ScrollController scrollController = ScrollController();
  int length = 10;
  bool isScroll = false;

  @override
  void initState() {
    super.initState();
    var role = Provider.of<RoleProvider>(context, listen: false);
    var notification =
        Provider.of<NotificationProvider>(context, listen: false);
    var auth = Provider.of<AuthProvider>(context, listen: false);
    if (role.roleType == getRoleType(RoleEnum.student)) {
      notification.getnotificationList(auth.getUserId());
    } else if (role.roleType == getRoleType(RoleEnum.teacher)) {
      notification.getrepnotificationList(auth.getUserId());
    } else {
      notification.getleadernotificationList(auth.getUserId());
    }
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        setState(() {
          isScroll = true;
        });
        Future.delayed(Duration(seconds: 1)).then((value) {
          setState(() {
            length += 10;
            isScroll = false;
          });
        });
      }
      if (scrollController.position.pixels ==
          scrollController.position.minScrollExtent) {
        setState(() {
          length = 10;
          isScroll = false;
        });
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<NotificationProvider, RoleProvider, AuthProvider>(
      builder: (context, data, role, auth, child) => Scaffold(
          backgroundColor: primaryDark,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(appBarHeight),
              child: homeAppbar(
                  context: context,
                  profileImage: ImageResources.profileImage,
                  name: 'deepak',
                  location: 'H 106')),
          body: LoadingOverlay(
            isLoading: data.notificationLoading,
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        commonBackButton(
                            context: context, title: '', backBtnColor: white),
                        const SizedBox(width: 10),
                        const Text("Notification",
                            style: TextStyle(
                              fontSize: 17,
                              color: white,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  if (data.usernotificationList.isNotEmpty ||
                      data.repnotificationList.isNotEmpty ||
                      data.leadernotificationList.isNotEmpty) ...[
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 14),
                        child: Bounce(
                          duration: Duration(milliseconds: 100),
                          onPressed: () {
                            data
                                .updateNotification(
                              userId: auth.getUserId(),
                              roleType: role.roleType,
                              type: 'alldelete',
                              context: context,
                            )
                                .then((value) {
                              if (value.isSuccess) {
                                if (role.roleType ==
                                    getRoleType(RoleEnum.student)) {
                                  data.getnotificationList(auth.getUserId());
                                } else if (role.roleType ==
                                    getRoleType(RoleEnum.teacher)) {
                                  data.getrepnotificationList(auth.getUserId());
                                } else {
                                  data.getleadernotificationList(
                                      auth.getUserId());
                                }

                                successToast(msg: value.message);
                              } else {
                                errorToast(msg: value.message);
                              }
                            });
                          },
                          child: Text(
                            'Clear All',
                            style: TextStyle(fontSize: 14, color: white),
                          ),
                        ),
                      ),
                    ),
                  ],
                  if (role.roleType == getRoleType(RoleEnum.student)) ...[
                    Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.all(14),
                            controller: scrollController,
                            itemCount: data.usernotificationList.length > 10 &&
                                    length < data.usernotificationList.length
                                ? length
                                : data.usernotificationList.length,
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var item = data.usernotificationList[index];
                              return Bounce(
                                duration: Duration(milliseconds: 100),
                                onPressed: () {
                                  data
                                      .updateNotification(
                                          userId: auth.getUserId(),
                                          roleType: role.roleType,
                                          type: 'read',
                                          context: context,
                                          notificationId: item.id)
                                      .then((value) {
                                    if (value.isSuccess) {
                                      data.getnotificationList(
                                          auth.getUserId());
                                      successToast(msg: value.message);
                                    } else {
                                      errorToast(msg: value.message);
                                    }
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: PaddingConstant.m),
                                  padding:
                                      const EdgeInsets.all(PaddingConstant.m),
                                  width: ResponsiveHelper.width(context),
                                  decoration: BoxDecoration(
                                      // color: white,
                                      color: item.isRead == '0'
                                          ? white.withOpacity(0.75)
                                          : white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: primaryDark),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: ResponsiveHelper.width(
                                                    context) -
                                                71,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: ResponsiveHelper.width(
                                                          context) -
                                                      100,
                                                  child: Text(
                                                    '${item.title}',
                                                    // maxLines: 3,
                                                    style: TextStyle(
                                                        color: black,
                                                        fontSize:
                                                            FontConstant.m,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                Bounce(
                                                  duration: Duration(
                                                      milliseconds: 100),
                                                  onPressed: () {
                                                    data
                                                        .updateNotification(
                                                            userId: auth
                                                                .getUserId(),
                                                            roleType:
                                                                role.roleType,
                                                            type: 'delete',
                                                            context: context,
                                                            notificationId:
                                                                item.id)
                                                        .then((value) {
                                                      if (value.isSuccess) {
                                                        data.getnotificationList(
                                                            auth.getUserId());
                                                        successToast(
                                                            msg: value.message);
                                                      } else {
                                                        errorToast(
                                                            msg: value.message);
                                                      }
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.delete_rounded,
                                                    color: red,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: ResponsiveHelper.width(
                                                    context) -
                                                71,
                                            child: Text(
                                              '${item.message}',
                                              maxLines: null,
                                              style: TextStyle(
                                                  color: lightTextColor,
                                                  fontSize: FontConstant.m,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            '${DateTimeHelper.timePassed(DateTime.parse(item.createdAt!), full: false)} ago',
                                            maxLines: 2,
                                            style: TextStyle(
                                              color: lightTextColor,
                                              fontSize: FontConstant.s,
                                              fontWeight: FontWeight.w300,
                                              height: 1.22,
                                              letterSpacing: 0.70,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })),
                    if (data.usernotificationList.isEmpty &&
                        !data.notificationLoading) ...[
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: ResponsiveHelper.height(context) * 0.47),
                        child: Center(
                          child: Text(
                            'No Notification Found!',
                            style: TextStyle(
                                color: white.withOpacity(0.65),
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ]
                  ] else if (role.roleType ==
                      getRoleType(RoleEnum.teacher)) ...[
                    // ...[
                    Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.all(14),
                            controller: scrollController,
                            itemCount: data.repnotificationList.length > 10 &&
                                    length < data.repnotificationList.length
                                ? length
                                : data.repnotificationList.length,
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var item = data.repnotificationList[index];
                              return Bounce(
                                duration: Duration(milliseconds: 100),
                                onPressed: () {
                                  data
                                      .updateNotification(
                                          userId: auth.getUserId(),
                                          roleType: role.roleType,
                                          type: 'read',
                                          context: context,
                                          notificationId: item.id)
                                      .then((value) {
                                    if (value.isSuccess) {
                                      data.getrepnotificationList(
                                          auth.getUserId());
                                      successToast(msg: value.message);
                                    } else {
                                      errorToast(msg: value.message);
                                    }
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: PaddingConstant.m),
                                  padding:
                                      const EdgeInsets.all(PaddingConstant.m),
                                  decoration: BoxDecoration(
                                      color: item.isRead == '0'
                                          ? white.withOpacity(0.75)
                                          : white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: primaryDark),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: ResponsiveHelper.width(
                                                    context) -
                                                71,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: ResponsiveHelper.width(
                                                          context) -
                                                      100,
                                                  child: Text(
                                                    '${item.title}',
                                                    maxLines: null,
                                                    style: TextStyle(
                                                        color: black,
                                                        fontSize:
                                                            FontConstant.m,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                Bounce(
                                                  duration: Duration(
                                                      milliseconds: 100),
                                                  onPressed: () {
                                                    data
                                                        .updateNotification(
                                                            userId: auth
                                                                .getUserId(),
                                                            roleType:
                                                                role.roleType,
                                                            type: 'delete',
                                                            context: context,
                                                            notificationId:
                                                                item.id)
                                                        .then((value) {
                                                      if (value.isSuccess) {
                                                        data.getrepnotificationList(
                                                            auth.getUserId());
                                                        successToast(
                                                            msg: value.message);
                                                      } else {
                                                        errorToast(
                                                            msg: value.message);
                                                      }
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.delete_rounded,
                                                    color: red,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: ResponsiveHelper.width(
                                                    context) -
                                                71,
                                            child: Text(
                                              '${item.message}',
                                              maxLines: null,
                                              style: TextStyle(
                                                  color: lightTextColor,
                                                  fontSize: FontConstant.m,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            '${DateTimeHelper.timePassed(DateTime.parse(item.createdAt!), full: false)} ago',
                                            maxLines: 2,
                                            style: TextStyle(
                                              color: lightTextColor,
                                              fontSize: FontConstant.s,
                                              fontWeight: FontWeight.w300,
                                              height: 1.22,
                                              letterSpacing: 0.70,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })),
                    if (data.repnotificationList.isEmpty &&
                        !data.notificationLoading) ...[
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: ResponsiveHelper.height(context) * 0.47),
                        child: Center(
                          child: Text(
                            'No Notification Found!',
                            style: TextStyle(
                                color: white.withOpacity(0.65),
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ]
                  ] else ...[
                    Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.all(14),
                            controller: scrollController,
                            itemCount: data.leadernotificationList.length >
                                        10 &&
                                    length < data.leadernotificationList.length
                                ? length
                                : data.leadernotificationList.length,
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var item = data.leadernotificationList[index];
                              return Bounce(
                                duration: Duration(milliseconds: 100),
                                onPressed: () {
                                  data
                                      .updateNotification(
                                          userId: auth.getUserId(),
                                          roleType: role.roleType,
                                          type: 'read',
                                          context: context,
                                          notificationId: item.id)
                                      .then((value) {
                                    if (value.isSuccess) {
                                      data.getleadernotificationList(
                                          auth.getUserId());
                                      successToast(msg: value.message);
                                    } else {
                                      errorToast(msg: value.message);
                                    }
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: PaddingConstant.m),
                                  padding:
                                      const EdgeInsets.all(PaddingConstant.m),
                                  decoration: BoxDecoration(
                                      color: item.isRead == '0'
                                          ? white.withOpacity(0.75)
                                          : white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: primaryDark),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: ResponsiveHelper.width(
                                                    context) -
                                                71,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: ResponsiveHelper.width(
                                                          context) -
                                                      100,
                                                  child: Text(
                                                    '${item.title}',
                                                    maxLines: null,
                                                    style: TextStyle(
                                                        color: black,
                                                        fontSize:
                                                            FontConstant.m,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                Bounce(
                                                  duration: Duration(
                                                      milliseconds: 100),
                                                  onPressed: () {
                                                    data
                                                        .updateNotification(
                                                            userId: auth
                                                                .getUserId(),
                                                            roleType:
                                                                role.roleType,
                                                            type: 'delete',
                                                            context: context,
                                                            notificationId:
                                                                item.id)
                                                        .then((value) {
                                                      if (value.isSuccess) {
                                                        data.getleadernotificationList(
                                                            auth.getUserId());
                                                        successToast(
                                                            msg: value.message);
                                                      } else {
                                                        errorToast(
                                                            msg: value.message);
                                                      }
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.delete_rounded,
                                                    color: red,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: ResponsiveHelper.width(
                                                    context) -
                                                71,
                                            child: Text(
                                              '${item.message}',
                                              maxLines: null,
                                              style: TextStyle(
                                                  color: lightTextColor,
                                                  fontSize: FontConstant.m,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            '${DateTimeHelper.timePassed(DateTime.parse(item.createdAt!), full: false)} ago',
                                            maxLines: 2,
                                            style: TextStyle(
                                              color: lightTextColor,
                                              fontSize: FontConstant.s,
                                              fontWeight: FontWeight.w300,
                                              height: 1.22,
                                              letterSpacing: 0.70,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })),
                    if (data.leadernotificationList.isEmpty &&
                        !data.notificationLoading) ...[
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: ResponsiveHelper.height(context) * 0.47),
                        child: Center(
                          child: Text(
                            'No Notification Found!',
                            style: TextStyle(
                                color: white.withOpacity(0.65),
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ]
                  ],
                  if (isScroll) ...[
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: CircularProgressIndicator(
                      color: white,
                    ))
                  ],
                ],
              ),
            ),
          )),
    );
  }
}
