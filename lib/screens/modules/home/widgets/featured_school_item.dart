import 'package:flutter/material.dart';
import 'package:vam_vam/data/model/response/schoolModel.dart';
import 'package:vam_vam/utils/colors.dart';
import 'package:vam_vam/utils/imageResources.dart';

class FeaturedSchoolItem extends StatelessWidget {
  final School school;

  const FeaturedSchoolItem({Key? key, required this.school}) : super(key: key);

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
                placeholder: school.color == 'pink' ? AssetImage(ImageResources.vmschoolPlaceholder2) : AssetImage(ImageResources.vmschoolPlaceholder),
                image: NetworkImage(
                  school.logo_path!,
                ),
                fit: BoxFit.contain,
              )
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  school.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold
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
                    fontSize: 10
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          ElevatedButton(

            onPressed: () {
              print('Login button pressed');
              print("school clicked: $school");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: vamPrimary2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 2,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            ),
            child: Text('Login',
              style: TextStyle(
                color: white,
                fontSize: 12,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
        ],
      ),
    );
  }
}
