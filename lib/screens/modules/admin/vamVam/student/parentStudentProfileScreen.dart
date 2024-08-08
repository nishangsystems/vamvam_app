import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/screens/modules/admin/vamVam/fees/feesTransactionScreen.dart';
import 'package:vam_vam/screens/modules/admin/vamVam/result/parentResultScreen.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/imageResources.dart';
import '../../../../../utils/paddingConstant.dart';
import '../../../../../widgets/commonWidgets/commonWidgets.dart';
import '../courses/parentRegisteredCourseScreen.dart';

class ParentStudentProfileScreen extends StatelessWidget {
  final String title;
  final String subTitle;
  final String studentId;
  const ParentStudentProfileScreen(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.studentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryDark,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(appBarHeight),
            child: homeAppbar(
                context: context,
                profileImage: ImageResources.profileImage,
                name: 'deepak',
                location: 'H 106')),
        body: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 6, right: 6, top: PaddingConstant.m),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),

                  // Add Course title
                  Row(
                    children: [
                      commonBackButton(
                          context: context, title: '', backBtnColor: white),
                      const SizedBox(width: 10),
                      const Text("Student Profile",
                          style: TextStyle(
                            fontSize: 17,
                            color: white,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: white,
                              border:
                                  Border.all(width: 1, color: vamBorderColor)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ProfilePicture(
                                name: subTitle,
                                radius: 45,
                                fontsize: 24,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: vamPrimaryColor),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width:
                                        ResponsiveHelper.width(context) - 180,
                                    child: Text(
                                      subTitle,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: vamPrimaryColor),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        optionBox(
                            image: ImageResources.feesTransactionIcon,
                            title: 'View Fees Transactions',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => FeesTransactionScreen(
                                        studentId: studentId,
                                        studentName: subTitle,
                                      )));
                            }),
                        SizedBox(
                          height: 15,
                        ),
                        optionBox(
                            image: ImageResources.resultHistoryIcon,
                            title: 'View Results History',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ParentResultScreen(
                                        studentId: studentId,
                                      )));
                            }),
                        SizedBox(
                          height: 15,
                        ),
                        optionBox(
                            image: ImageResources.registeredCourseIcon,
                            title: 'View Registered Courses',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      ParentRegisteredCourseScreen(
                                        studentId: studentId,
                                      )));
                            }),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Bounce optionBox(
      {required String title,
      required String image,
      required Function() onTap}) {
    return Bounce(
      duration: Duration(milliseconds: 100),
      onPressed: onTap,
      child: Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: white,
            border: Border.all(width: 1, color: vamBorderColor)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 32,
                  width: 32,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color(0xff0875C7).withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: vamPrimaryColor),
                )
              ],
            ),
            Icon(
              Icons.chevron_right_rounded,
              size: 24,
              color: black,
            )
          ],
        ),
      ),
    );
  }
}
