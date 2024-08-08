import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/providers/teacherProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/screens/modules/representative/vamVam/student/teacherStudentProfileScreen.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/imageResources.dart';
import '../../../../../utils/paddingConstant.dart';
import '../../../../../widgets/commonWidgets/commonWidgets.dart';

class TeacherClassScreen extends StatefulWidget {
  final String title;
  final String courseId;
  const TeacherClassScreen(
      {super.key, required this.title, required this.courseId});

  @override
  State<TeacherClassScreen> createState() => _TeacherClassScreenState();
}

class _TeacherClassScreenState extends State<TeacherClassScreen> {
  @override
  void initState() {
    Future.microtask(() => _init());
    super.initState();
  }

  _init() {
    var teacher = Provider.of<TeacherProvider>(context, listen: false);
    teacher.getTeacherCourseList(courseId: widget.courseId).then((value) {
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
        body: LoadingOverlay(
          isLoading: teacher.isLoading,
          child: SafeArea(
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
                      Text("${widget.title}: Course List",
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
                  teacher.isLoading
                      ? SizedBox.shrink()
                      : !teacher.isLoading &&
                              (teacher.teacherCourseListModel.students ==
                                      null ||
                                  teacher.teacherCourseListModel.students!
                                          .bONABERI ==
                                      null ||
                                  teacher.teacherCourseListModel.students!
                                      .bONABERI!.isEmpty)
                          ? notDataFound('No Student Found!')
                          : Container(
                              height: ResponsiveHelper.height(context) - 220,
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: white,
                                  border: Border.all(
                                      width: 1, color: vamBorderColor)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${teacher.teacherCourseListModel.students!.bONABERI!.length} Students',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: black,
                                        letterSpacing: 0.5),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Expanded(
                                    // width: ResponsiveHelper.width(context),
                                    // height: 10 * 100,
                                    child: ListView.builder(
                                        itemCount: teacher
                                            .teacherCourseListModel
                                            .students!
                                            .bONABERI!
                                            .length,
                                        physics:
                                            AlwaysScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          var item = teacher
                                              .teacherCourseListModel
                                              .students!
                                              .bONABERI![index];
                                          return Bounce(
                                            duration:
                                                Duration(milliseconds: 500),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          TeacherStudentProfileScreen(
                                                            studentId: item.id
                                                                .toString(),
                                                          )));
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 16, horizontal: 12),
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10),
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    teacher.teacherCourseListModel
                                                                .course !=
                                                            null
                                                        ? teacher
                                                                .teacherCourseListModel
                                                                .course!
                                                                .name ??
                                                            ""
                                                        : '',
                                                    style: TextStyle(
                                                        color: vamTextColor,
                                                        fontSize: 14),
                                                  ),
                                                  Text(
                                                    item.name ?? '',
                                                    style: TextStyle(
                                                        color: vamTextColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),

                                  // Container(
                                  //   padding: EdgeInsets.symmetric(vertical: 12),
                                  //   decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(5),
                                  //       color: primaryLight),
                                  //   child: Center(
                                  //     child: Row(
                                  //       crossAxisAlignment: CrossAxisAlignment.center,
                                  //       mainAxisAlignment: MainAxisAlignment.center,
                                  //       children: [
                                  //         Icon(
                                  //           Icons.download_outlined,
                                  //           color: white,
                                  //         ),
                                  //         SizedBox(width: 10),
                                  //         Text(
                                  //           'Download  Class List',
                                  //           style: TextStyle(
                                  //               color: white,
                                  //               fontWeight: FontWeight.w700,
                                  //               fontSize: 12),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
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
      ),
    );
  }
}
