import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/providers/teacherProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/imageResources.dart';
import '../../../../../utils/paddingConstant.dart';
import '../../../../../widgets/commonWidgets/commonWidgets.dart';

class TeacherStudentProfileScreen extends StatefulWidget {
  final String studentId;
  const TeacherStudentProfileScreen({super.key, required this.studentId});

  @override
  State<TeacherStudentProfileScreen> createState() =>
      _TeacherStudentProfileScreenState();
}

class _TeacherStudentProfileScreenState
    extends State<TeacherStudentProfileScreen> {
  @override
  void initState() {
    Future.microtask(() => _init());
    super.initState();
  }

  _init() {
    Provider.of<TeacherProvider>(context, listen: false)
        .getTeacherStudentProfile(studentId: widget.studentId)
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
          body: LoadingOverlay(
            isLoading: teacher.isLoading,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: PaddingConstant.xs,
                    right: PaddingConstant.xs,
                    top: PaddingConstant.m),
                child: SingleChildScrollView(
                  child: !teacher.isLoading &&
                          (teacher.teacherStudentProfileModel.student == null)
                      ? notDataFound('No Student Found!')
                      : teacher.isLoading
                          ? SizedBox.shrink()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),

                                // Add Course title
                                Row(
                                  children: [
                                    commonBackButton(
                                        context: context,
                                        title: '',
                                        backBtnColor: white),
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
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: white,
                                            border: Border.all(
                                                width: 1,
                                                color: vamBorderColor)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            // Image.asset(
                                            //   ImageResources.profileDummyImg,
                                            //   height: 90,
                                            //   width: 90,
                                            //   fit: BoxFit.fill,
                                            // ),
                                            ProfilePicture(
                                              name: teacher
                                                      .teacherStudentProfileModel
                                                      .student!
                                                      .name ??
                                                  '',
                                              radius: 45,
                                              fontsize: 24,
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // Text(
                                                //   teacher.teacherStudentProfileModel
                                                //           .student!. ??
                                                //       '',
                                                //   style: TextStyle(
                                                //       fontSize: 12,
                                                //       fontWeight:
                                                //           FontWeight.w600,
                                                //       color: vamPrimaryColor),
                                                // ),
                                                // SizedBox(
                                                //   height: 5,
                                                // ),
                                                SizedBox(
                                                  width: ResponsiveHelper.width(
                                                          context) -
                                                      180,
                                                  child: Text(
                                                    teacher.teacherStudentProfileModel
                                                            .student!.name ??
                                                        '',
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                      Container(
                                        padding: EdgeInsets.all(14),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: white,
                                            border: Border.all(
                                                width: 1,
                                                color: vamBorderColor)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Matricule : ',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: vamPrimaryColor),
                                            ),
                                            Text(
                                              teacher.teacherStudentProfileModel
                                                      .student!.matric ??
                                                  '',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: vamPrimaryColor),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(14),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: white,
                                            border: Border.all(
                                                width: 1,
                                                color: vamBorderColor)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Phone Number: ',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: vamPrimaryColor),
                                            ),
                                            Text(
                                              teacher.teacherStudentProfileModel
                                                      .student!.phone ??
                                                  '',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: vamPrimaryColor),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                ),
              ),
            ),
          )),
    );
  }
}
