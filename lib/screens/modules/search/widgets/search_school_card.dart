
import 'package:flutter/material.dart';
import 'package:vam_vam/data/model/response/schoolModel.dart';
import 'package:vam_vam/utils/colors.dart';
import 'package:vam_vam/utils/imageResources.dart';

class SearchSchoolCard extends StatelessWidget {
  final School school;
  // final AuthProvider

  const SearchSchoolCard({Key? key, required this.school}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: school.color == 'grey' ? Colors.grey.shade200 : Colors.pink.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 40,
              height: 40,
              child: FadeInImage(
                placeholder: school.color == 'pink' ? AssetImage(ImageResources.vmschoolPlaceholder2) : AssetImage(ImageResources.vmschoolPlaceholder),
                image: NetworkImage(
                  school.logo_path!,
                ),
                fit: BoxFit.contain,
              )
          ),
          SizedBox(height: 10),
          Text(
            school.name,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: vamTextColor,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          if (school.location != null)
            SizedBox(height: 2),
          if (school.location != null)
            Text(
            school.location!,
            style: TextStyle(color: textColor2,
              fontSize: 10,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
