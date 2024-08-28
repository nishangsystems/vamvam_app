import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vam_vam/data/model/response/schoolModel.dart';
import 'package:vam_vam/helpers/enumHelper.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/screens/modules/search/widgets/search_school_card.dart';
import 'package:vam_vam/utils/apiConstant.dart';
import 'package:vam_vam/utils/constant.dart';
import 'package:vam_vam/utils/schoolPreference.dart';

class SearchListWidget extends StatefulWidget {
  final List schools;
  final bool searching;
  String? searchTerm = '';
  final AuthProvider auth;
  final RoleProvider role;

  SearchListWidget({required this.schools, required this.searching,
    this.searchTerm, required this.auth, required this.role
  });

  @override
  _SearchListWidgetState createState() => _SearchListWidgetState();
}

class _SearchListWidgetState extends State<SearchListWidget> {
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!widget.schools.isEmpty)
              searchText(searchTerm: widget.searchTerm),
            if (!widget.schools.isEmpty)
              SizedBox(height: 16),
            if (widget.schools.isEmpty)
              Center(
                child: noSchoolsFound(),
              ),
            if (widget.schools.isNotEmpty)
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.85,
                ),
                itemCount: widget.schools.length,
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
                    child: SearchSchoolCard(school: widget.schools[index]),
                  );
                },
              )
          ],
        ),
      ),
    );
  }

  // no shools found widget
  Widget noSchoolsFound() {
    return Container(
      height: 800,
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(top: 130),
      child: Column(
        children: [
          Icon(
            Icons.search_off,
            size: 100,
            color: Colors.grey,
          ),
          SizedBox(height: 8),
          Text(
            'No Schools Found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  // searchText widget
  Widget searchText({String? searchTerm}) {
    return widget.searching ? Text(
      'Search Results for "${searchTerm}"',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ): Text(
      'All Schools',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
