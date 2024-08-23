import 'package:flutter/material.dart';
import 'package:vam_vam/data/model/response/schoolModel.dart';
import 'package:vam_vam/screens/modules/search/widgets/search_school_card.dart';

class SearchListWidget extends StatelessWidget {
  final List<School> schools = [
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'grey'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'grey'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'grey'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'grey'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'grey'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'grey'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'grey'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'grey'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'grey'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'grey'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'grey'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'grey'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'grey'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'grey'),
    School(name: 'Catholic University', location: 'Buea, Checkpoint', color: 'grey'),
  ];

  SearchListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search Results for "Catholic"',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.85,
              ),
              itemCount: schools.length,
              itemBuilder: (context, index) {
                return SearchSchoolCard(school: schools[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
