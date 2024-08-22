
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vam_vam/data/model/response/schoolModel.dart';
import 'package:vam_vam/screens/modules/home/widgets/previous_shool_card.dart';

class PreviousSchoolsWidget extends StatelessWidget {
  final List<School> schools = [
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'grey'),
    School(name: 'University of Buea', location: 'Buea, Checkpoint', color: 'pink'),
    School(name: 'HIMS BUEA', location: 'Buea, Checkpoint', color: 'grey'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'pink'),
    School(name: 'University of Buea', location: 'Buea, Checkpoint', color: 'grey'),
  ];

   PreviousSchoolsWidget({super.key});

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
              // TextButton(
              //   onPressed: () {},
              //   child: Text('See all'),
              // ),
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
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: PreviousSchoolCard(school: schools[index]),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}