import 'package:flutter/material.dart';
import 'package:vam_vam/data/model/response/schoolModel.dart';
import 'package:vam_vam/screens/modules/home/widgets/featured_school_item.dart';

class FeaturedSchoolsWidget extends StatelessWidget {
  final List<School> schools = [
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'purple'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'purple'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'purple'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'purple'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'purple'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'purple'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'purple'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'purple'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'purple'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'purple'),
  ];

  FeaturedSchoolsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 14.0, bottom: 8.0),
          child:Text(
            'Featured Schools',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(), // Prevent scrolling within the list
          shrinkWrap: true, // Required to make ListView work within a Column
          itemCount: schools.length,
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, index) {
            return FeaturedSchoolItem(school: schools[index]);
          },
        ),
      ],
    );
  }
}
