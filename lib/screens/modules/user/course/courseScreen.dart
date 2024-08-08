import 'package:vam_vam/screens/modules/user/course/courseList.dart';
import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/imageResources.dart';
import '../../../../utils/paddingConstant.dart';
import '../../../../widgets/commonWidgets/commonWidgets.dart';
import 'FormBScreen.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.only(
                  left: PaddingConstant.l,
                  right: PaddingConstant.l,
                  top: PaddingConstant.xxl),
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
                      const Text("Course Screen",
                          style: TextStyle(
                            fontSize: 17,
                            color: white,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                  SizedBox(height: 40),
                  commonButtonNew(
                      context: context,
                      color: primaryDark,
                      imageIcon: 'assets/icons/homeIcon7.png',
                      text: 'Course List',
                      textColor: white,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CourseListScreen()))),

                  SizedBox(height: 20),

                  commonButtonNew(
                      context: context,
                      color: white,
                      icon: Icons.my_library_books_sharp,
                      text: 'Form B',
                      textColor: primaryDark,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FormBScreen()))),

                  SizedBox(height: 30),
                ],
              ),
            )),
          )),
    );
  }
}
