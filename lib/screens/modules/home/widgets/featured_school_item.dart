import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vam_vam/data/model/response/schoolModel.dart';
import 'package:vam_vam/helpers/enumHelper.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/utils/apiConstant.dart';
import 'package:vam_vam/utils/colors.dart';
import 'package:vam_vam/utils/constant.dart';
import 'package:vam_vam/utils/imageResources.dart';
import 'package:vam_vam/utils/schoolPreference.dart';

class FeaturedSchoolItem extends StatefulWidget {
  final School school;
  final AuthProvider auth;
  final RoleProvider role;

  @override
  _FeaturedSchoolItemState createState() => _FeaturedSchoolItemState();

  const FeaturedSchoolItem({Key? key, required this.school, required this.auth, required this.role}) : super(key: key);
}

class _FeaturedSchoolItemState extends State<FeaturedSchoolItem> {
  School? cSchool;

  @override
  void initState() {
    super.initState();
    _loadSchool();
  }

  void _loadSchool() async {
    School? school = await SchoolPreference.getSchool();
    setState(() {
      cSchool = school!;
    });
  }

  bool checkIfLoggedInAndSchoolIsCurrent()  {
    if (widget.auth.isLoggedIn()) {
      if (cSchool != null && cSchool!.name == widget.school.name) {
        return true;
      }
    }
    return false;
  }

  void goToUserDashboard(BuildContext context) {
    // go to user dashboard based on role type
    if (widget.role.roleType == getRoleType(RoleEnum.student)) {
      context.push(userBottomHomeBar);
    } else if (widget.role.roleType == getRoleType(RoleEnum.teacher)) {
      context.push(represantativeBottomHomeBar);
    } else if (widget.role.roleType == getRoleType(RoleEnum.parent)) {
      context.push(paretnBottomHomeBar);
    } else {
      context.push(represantativeBottomHomeBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
      child: Row(
        children: [
          SizedBox(
              width: 50,
              height: 50,
              child: FadeInImage(
                placeholder: widget.school.color == 'pink'
                    ? AssetImage(ImageResources.vmschoolPlaceholder2)
                    : AssetImage(ImageResources.vmschoolPlaceholder),
                image: NetworkImage(
                  widget.school.logo_path!,
                ),
                fit: BoxFit.contain,
              )),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.school.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (widget.school.location != null) SizedBox(height: 4),
                if (widget.school.location != null)
                  Text(
                    widget.school.location!,
                    style: TextStyle(color: textColor2, fontSize: 10),
                  ),
              ],
            ),
          ),
          SizedBox(width: 16),
          ElevatedButton(
            onPressed: () async {
              print('Login button pressed');
              print("school clicked: ${widget.school.toJson()}");
              ApiConstant.setCurrentSchoolUrl(widget.school.toJson()['api_root']);
              ApiConstant.setCurrentSchoolID(widget.school.toJson()['id']);

             if (checkIfLoggedInAndSchoolIsCurrent() == true) {

               goToUserDashboard(context);

              } else {
                context.push('/role/${widget.school.name}');
              }

            },
            style: ElevatedButton.styleFrom(
              backgroundColor: vamPrimary2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 2,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            ),
            child: checkIfLoggedInAndSchoolIsCurrent() == true
                ? Text(
                    'Profile',
                    style: TextStyle(
                        color: white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  )
                : Text(
                    'Login',
                    style: TextStyle(
                        color: white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
          ),
        ],
      ),
    );
  }
}
