// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/utils/colors.dart';
import 'package:vam_vam/utils/constant.dart';

import '../providers/profileprovider.dart';
import '../utils/fontConstant.dart';
import 'enumHelper.dart';

void customToast({required String msg, required Color color}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: FontConstant.l);
}

String hideNumber(String number) {
  String numberStr = number.toString();
  int length = numberStr.length;
  if (length <= 4) {
    return numberStr; // If the number has 4 or fewer digits, return it as is.
  } else {
    String xMask =
        'x' * (length - 4); // Create a string of 'x's of the same length.
    String visibleDigits =
        numberStr.substring(length - 4); // Get the last 4 digits.
    return xMask +
        visibleDigits; // Concatenate 'x' mask with the last 4 digits.
  }
}

showProfileSnackbar(
    {required BuildContext context, required double bottomMargin}) {
  final snackBar = SnackBar(
    actionOverflowThreshold: 1.0,
    action: SnackBarAction(
        label: 'View Profile',
        onPressed: () {
          context.push(editProfile);
        }),
    content: Text('Please Complete Your Profile'),
    elevation: 1,
    showCloseIcon: true,
    margin: EdgeInsets.only(left: 10, right: 10, bottom: bottomMargin),
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.horizontal,
    duration: Duration(seconds: 3),
  );
  var role = Provider.of<RoleProvider>(context, listen: false);
  var profile = Provider.of<ProfileProvider>(context, listen: false);
  if (profile.userProfileInfo.isProfileComplete == '0' &&
      role.roleType == getRoleType(RoleEnum.student)) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

Color getStatusColor(String status) {
  Color color = primaryLight;
  switch (status) {
    case 'Pending':
      color = Color(0xff83e2e9);
    case 'Assigned':
      color = Color(0xfff49025);
    case 'In Progress':
      color = Color(0xff619ffc);
    case 'Resolved':
      color = Color(0xff43bf57);
    case 'Cancelled':
      color = Color(0xfff2451b);
  }
  return color;
}

rateUs() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  if (Platform.isIOS) {
    _launchURL('https://apps.apple.com/us/app/lot-jansamadhan/id6473715419');
  } else {
    _launchURL(
        'https://play.google.com/store/apps/details?id=${packageInfo.packageName}');
  }
}

// Launch URL function
void _launchURL(String url) async {
  try {
    await launch(url);
  } catch (e) {
    rethrow;
  }
}
