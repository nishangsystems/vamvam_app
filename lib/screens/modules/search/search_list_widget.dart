import 'package:flutter/material.dart';
import 'package:vam_vam/data/model/response/schoolModel.dart';
import 'package:vam_vam/screens/modules/search/widgets/search_school_card.dart';

class SearchListWidget extends StatelessWidget {
  final List schools;
  final bool searching;
  String? searchTerm = '';

  SearchListWidget({required this.schools, required this.searching,
    this.searchTerm
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!schools.isEmpty)
              searchText(searchTerm: searchTerm),
            if (!schools.isEmpty)
              SizedBox(height: 16),
            if (schools.isEmpty)
              Center(
                child: noSchoolsFound(),
              ),
            if (schools.isNotEmpty)
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
                  return GestureDetector(
                    onTap: () {
                      print('School clicked: ${schools[index].toJson()}');
                    },
                    child: SearchSchoolCard(school: schools[index]),
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
    return searching ? Text(
      'Search Results for "${searchTerm}"',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ): Text(
      'All Schools',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
