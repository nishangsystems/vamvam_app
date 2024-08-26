
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vam_vam/data/model/response/schoolModel.dart';
import 'package:vam_vam/helpers/enumHelper.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/screens/modules/home/widgets/previous_shool_card.dart';
import 'package:vam_vam/utils/apiConstant.dart';
import 'package:vam_vam/utils/constant.dart';
import 'package:vam_vam/utils/schoolPreference.dart';

import '../../../providers/AuthProvider.dart';

class PreviousSchoolsWidget extends StatefulWidget {
  final schools;
  final AuthProvider auth;
  final RoleProvider role;

  PreviousSchoolsWidget({required this.schools, super.key, required this.auth, required this.role});

  @override
  _PreviousSchoolsWidgetState createState() => _PreviousSchoolsWidgetState();
}

class _PreviousSchoolsWidgetState extends State<PreviousSchoolsWidget> {
  List<School> schools = [];
  School? cSchool;

  @override
  void initState() {
    super.initState();
    _updateSchools();
    _loadSchool();
  }

  // update schools array object adding color 'pink' at odd indexes
  void _updateSchools() {
    for (int i = 0; i < widget.schools.length; i++) {
      if (i % 2 != 0) {
        widget.schools[i].color = 'pink';
      } else {
        widget.schools[i].color = 'grey';
      }
    }

    setState(() {
      schools = widget.schools;
    });

    // print array of school objects
    print("Updated Schools List:");
    for (var school in schools) {
      print(school.toJson()); // Convert each school to JSON and print
    }
  }

  void _loadSchool() async {
    School? school = await SchoolPreference.getSchool();
    setState(() {
      cSchool = school!;
    });
  }

  bool checkIfLoggedInAndSchoolIsCurrent(School school)  {
    if (widget.auth.isLoggedIn()) {
      if (cSchool != null && cSchool!.name == school.name) {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 6, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Previous Schools',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 147,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: schools.length,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print('Login button pressed');
                    print("school clicked: ${widget.schools[index].toJson()}");
                    ApiConstant.setCurrentSchoolUrl(widget.schools[index].toJson()['api_root']);

                    if (checkIfLoggedInAndSchoolIsCurrent(widget.schools[index]) == true) {

                      goToUserDashboard(context);

                    } else {
                      context.push('/role/${widget.schools[index].name}');
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: PreviousSchoolCard(school: schools[index]),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}