import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/providers/teacherProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/screens/modules/representative/vamVam/announcement/addAnnouncementScreen.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/imageResources.dart';
import '../../../../../utils/paddingConstant.dart';
import '../../../../../widgets/commonWidgets/commonWidgets.dart';

class AddAnnouncementCourseScreen extends StatefulWidget {
  const AddAnnouncementCourseScreen({super.key});

  @override
  State<AddAnnouncementCourseScreen> createState() =>
      _AddAnnouncementCourseScreenState();
}

class _AddAnnouncementCourseScreenState
    extends State<AddAnnouncementCourseScreen> {
  int? selectedIndex;
  @override
  void initState() {
    Future.microtask(() => _init());
    super.initState();
  }

  _init() {
    Provider.of<TeacherProvider>(context, listen: false)
        .getTeacherCourses()
        .then((value) {
      if (!value.isSuccess) {
        errorToast(msg: value.message);
      }
    });
  }

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
              child: LoadingOverlay(
                isLoading: teacher.isLoading,
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
                        const Text("Add Announcement",
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
                    if (!teacher.isLoading && teacher.courseList.isEmpty) ...[
                      Padding(
                        padding: EdgeInsets.only(
                            top: ResponsiveHelper.height(context) * 0.35),
                        child: notDataFound('No Courses Found!'),
                      )
                    ] else if (teacher.isLoading) ...[
                      SizedBox.shrink(),
                    ] else ...[
                      Container(
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
                              'Select A Course',
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
                                        selectedIndex = index;
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddAnouncementScreen(
                                                      code: '${item.code}',
                                                      course: '${item.name}',
                                                      campusId:
                                                          '${item.campusId}',
                                                      courseId: '${item.id}',
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
                                            color: index == selectedIndex
                                                ? primaryLight.withOpacity(0.05)
                                                : white,
                                            border: Border.all(
                                                width: 1,
                                                color: index == selectedIndex
                                                    ? primaryLight
                                                    : vamBorderColor)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${item.code}',
                                              style: TextStyle(
                                                  color: index == selectedIndex
                                                      ? primaryLight
                                                      : vamTextColor,
                                                  fontSize: 14),
                                            ),
                                            Text(
                                              '${item.name}',
                                              style: TextStyle(
                                                  color: index == selectedIndex
                                                      ? primaryLight
                                                      : vamTextColor,
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
                    ],

                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
