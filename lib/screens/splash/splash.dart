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
    var rol = Provider.of<RoleProvider>(context, listen: false);
    var profile = Provider.of<ProfileProvider>(context, listen: false);
    var reg = Provider.of<RegisterProvider>(context, listen: false);
    reg.getState();
    rol.getRoleType();
    reg.getRelation();
    if (rol.roleType == getRoleType(RoleEnum.student)) {
      appBarHeight = 100;
    }
    Future.delayed(const Duration(seconds: 5), () {
      if (rol.getOnBoarding()) {
        context.go(homeScreen);
      } else {
        context.go(onBoarding);
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
                width: 100,
                fit: BoxFit.fill,
              ),
              Image.asset(
                ImageResources.kunfu_pandaa,
                width: 200,
                fit: BoxFit.fill,
              ),
              Center(
                child: Text(
                  'Powered by Nishang Systems',
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 20
                  ),
                ),
              )
            ],
          )),
        ));
  }
}
