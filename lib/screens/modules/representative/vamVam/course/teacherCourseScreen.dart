import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/providers/teacherProvider.dart';
import 'package:vam_vam/screens/modules/representative/vamVam/class/teacherClassScreen.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/imageResources.dart';
import '../../../../../utils/paddingConstant.dart';
import '../../../../../widgets/commonWidgets/commonWidgets.dart';

class TeacherCourseScreen extends StatelessWidget {
  const TeacherCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TeacherProvider>(
      builder: (context, teacher, child) => Scaffold(
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
                left: PaddingConstant.m,
                right: PaddingConstant.m,
                top: PaddingConstant.m),
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
                    const Text("Courses",
                        style: TextStyle(
                          fontSize: 17,
                          color: white,
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                teacher.courseList.isEmpty
                    ? notDataFound('No Course Found!')
                    : Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: white,
                            border:
                                Border.all(width: 1, color: vamBorderColor)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'All Assigned Courses',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: black,
                                  letterSpacing: 0.5),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: ResponsiveHelper.width(context),
                              height: teacher.courseList.length * 100,
                              child: ListView.builder(
                                  itemCount: teacher.courseList.length,
                                  itemBuilder: (context, index) {
                                    var item = teacher.courseList[index];
                                    return Bounce(
                                      duration: Duration(milliseconds: 500),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TeacherClassScreen(
                                                      title: item.code ?? '',
                                                      courseId:
                                                          item.id.toString(),
                                                    )));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 12),
                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: white,
                                            border: Border.all(
                                                width: 1,
                                                color: vamBorderColor)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item.code ?? '',
                                              style: TextStyle(
                                                  color: vamTextColor,
                                                  fontSize: 14),
                                            ),
                                            Text(
                                              item.name ?? '',
                                              style: TextStyle(
                                                  color: vamTextColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),

                            // SizedBox(height: 5)
                          ],
                        ),
                      ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
