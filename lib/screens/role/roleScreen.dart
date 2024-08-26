import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/helpers/enumHelper.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/utils/colors.dart';
import 'package:vam_vam/utils/constant.dart';
import 'package:vam_vam/utils/fontConstant.dart';
import 'package:vam_vam/utils/imageResources.dart';

class RoleScreen extends StatefulWidget {
  final String schoolName;
  RoleScreen({super.key, required this.schoolName});

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  @override
  void initState() {
    Future.microtask(() => _init());
    super.initState();
  }

  _init() {
    Provider.of<RoleProvider>(context, listen: false).setRoleType(-1);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<RoleProvider, AuthProvider>(
      builder: (context, data, auth, child) => Scaffold(
        body: SafeArea(
            child: Container(
          height: ResponsiveHelper.height(context),
          width: ResponsiveHelper.width(context),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageResources.roleBgImg),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100),
                  Center(
                    child: Text(
                      'Select a role on VamVam',
                      style: TextStyle(
                          color: Color(0xff0A2958),
                          fontWeight: FontWeight.w600,
                          fontSize: FontConstant.xxl),
                    ),
                  ),
                  SizedBox(height: 50),
                  _commonWidget(
                      title: 'Student',
                      isSelected:
                          data.roleType == getRoleType(RoleEnum.student),
                      image: ImageResources.studentImg,
                      onTap: () {
                        auth.setType('mobile');
                        data.setRoleType(getRoleType(RoleEnum.student));
                        context.push('$login/${widget.schoolName}');
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  _commonWidget(
                      title: 'Teacher',
                      image: ImageResources.executiveImg,
                      isSelected:
                          data.roleType == getRoleType(RoleEnum.teacher),
                      onTap: () {
                        auth.setType('mobile');
                        data.setRoleType(getRoleType(RoleEnum.teacher));
                        context.push('$login/${widget.schoolName}');
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  _commonWidget(
                      title: 'Parent',
                      image: ImageResources.directorImg,
                      isSelected: data.roleType == getRoleType(RoleEnum.parent),
                      onTap: () {
                        auth.setType('mobile');
                        data.setRoleType(getRoleType(RoleEnum.parent));
                        context.push('$login/${widget.schoolName}');
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  _commonWidget(
                      title: 'Executive',
                      image: ImageResources.executiveImg,
                      isSelected: data.roleType == getRoleType(RoleEnum.leader),
                      onTap: () {
                        auth.setType('mobile');
                        data.setRoleType(getRoleType(RoleEnum.leader));
                        context.push('$login/${widget.schoolName}');
                      }),
                  // SizedBox(
                  //   height: 50,
                  // ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }

  Widget _commonWidget(
      {required String title,
      required String image,
      required Function() onTap,
      required bool isSelected}) {
    return Bounce(
      duration: Duration(milliseconds: 300),
      onPressed: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isSelected ? primaryLight.withOpacity(0.2) : white,
            border: Border.all(
                width: 1,
                color: !isSelected ? Color(0xffE7E7E7) : primaryLight)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              image,
              width: 90,
              height: 90,
              fit: BoxFit.fill,
            ),
            Text(
              title,
              style: TextStyle(
                  color: isSelected ? primaryLight : Color(0xff0A2958),
                  fontWeight: FontWeight.w600,
                  fontSize: FontConstant.l),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
