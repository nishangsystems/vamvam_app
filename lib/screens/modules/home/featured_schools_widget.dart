import 'package:flutter/material.dart';
import 'package:vam_vam/data/model/response/schoolModel.dart';
import 'package:vam_vam/screens/modules/home/widgets/featured_school_item.dart';

class FeaturedSchoolsWidget extends StatefulWidget {
  final List schools;
  final auth;
  final role;

  FeaturedSchoolsWidget({required this.schools, required this.auth, required this.role});

  @override
  _FeaturedSchoolsWidgetState createState() => _FeaturedSchoolsWidgetState();
}

class _FeaturedSchoolsWidgetState extends State<FeaturedSchoolsWidget> {
  List schoolList = [];

  @override
  void initState() {
    super.initState();
    updateSchoolList();
  }

  // add other data to the schools list
  void updateSchoolList() {
    List schools = widget.schools;

    // get the first 10 schools
    if (schools.length > 10) {
      schools = schools.sublist(0, 10);
    }

    for (var school in schools) {
      schoolList.add(School(
          id: school['id'].toString(),
          name: school['name'],
          location: null,
          color: 'purple',
          api_root: school['api_root'],
          logo_path: school['logo_path']));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 14.0, bottom: 8.0),
          child: Text(
            'Featured Schools',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          // Prevent scrolling within the list
          shrinkWrap: true,
          // Required to make ListView work within a Column
          itemCount: schoolList.length,
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, index) {
            return FeaturedSchoolItem(
                school: schoolList[index], auth: widget.auth, role: widget.role);
          },
        ),
      ],
    );
  }
}
