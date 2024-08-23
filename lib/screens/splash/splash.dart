import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/helpers/enumHelper.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/profileprovider.dart';
import 'package:vam_vam/providers/registerProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/utils/colors.dart';
import 'package:vam_vam/utils/imageResources.dart';

import '../../utils/constant.dart';
import '../../widgets/commonWidgets/commonWidgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    Future.microtask(() => _initFun());
    super.initState();
  }

  _initFun() async {
    // Provider.of<LocationMapProvider>(context, listen: false)
    //     .determinePositionNew();
    var auth = Provider.of<AuthProvider>(context, listen: false);
    var rol = Provider.of<RoleProvider>(context, listen: false);
    var profile = Provider.of<ProfileProvider>(context, listen: false);
    var reg = Provider.of<RegisterProvider>(context, listen: false);
    reg.getState();
    rol.getRoleType();
    reg.getRelation();
    if (rol.roleType == getRoleType(RoleEnum.student)) {
      appBarHeight = 100;
    }
    Future.delayed(const Duration(seconds: 3), () {
      if (auth.isLoggedIn()) {
        profile
            .getProfile(auth.getUserId(), reg, rol.roleType, context)
            .then((value) {
              print("profile value ${value}");
          if (value.isSuccess) {
            print("value success: ${value.isSuccess}");
            context.go(homeScreen);
            // if (rol.getRoleType() == getRoleType(RoleEnum.student)) {
            //   profile.getStudentProfile(context).then((value) {
            //     if (value.isSuccess) {
            //       context.go(userBottomHomeBar);
            //     } else {
            //       context.go(role);
            //     }
            //   });
            // } else if (rol.getRoleType() == getRoleType(RoleEnum.parent)) {
            //   context.go(paretnBottomHomeBar);
            // } else if (rol.getRoleType() == getRoleType(RoleEnum.teacher)) {
            //   context.go(represantativeBottomHomeBar);
            // } else {
            //   context.go(adminBottomHomeBar);
            // }
          } else {
            context.go(role);
            // context.go(onBoarding);
          }
        });
      } else {
        if (rol.getOnBoarding()) {
          context.go(role);
        } else {
          context.go(onBoarding);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: white,
        body: Container(
          padding: EdgeInsets.all(16),
          height: ResponsiveHelper.height(context),
          width: ResponsiveHelper.width(context),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageResources.splashBgImg),
                  fit: BoxFit.fill)),
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 10,
              ),
              Image.asset(
                ImageResources.splashIcon,
                height: width,
                width: width * 0.85,
                fit: BoxFit.fill,
              ),
              Center(
                child: Text(
                  'Powered by Nishang Systems',
                  style: TextStyle(
                    color: Color(0xff0A2958),
                  ),
                ),
              )
            ],
          )),
        ));
  }
}
