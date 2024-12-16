
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vam_vam/data/model/response/schoolModel.dart';
import 'package:vam_vam/utils/colors.dart';
import 'package:vam_vam/utils/imageResources.dart';

class PreviousSchoolCard extends StatelessWidget {
  final School school;

  const PreviousSchoolCard({Key? key, required this.school}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: school.color == 'pink' ? vamPrimaryColorRed : vamPrimaryColorLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          SizedBox(
            width: 50,
            height: 50,
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
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: vamTextColor,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          if (school.location != null)
            SizedBox(height: 4),
          if (school.location != null)
            Text(
              school.location!,
              style: TextStyle(color: textColor2,
                fontSize: 10,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          // SizedBox(height: 4)
        ],
      ),
    );
  }
}