import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/data/model/response/teacher/announcementModel.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/providers/teacherProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/screens/modules/representative/vamVam/announcement/announcemenetDetailScreen.dart';
import 'package:vam_vam/screens/modules/representative/vamVam/announcement/announcementScreen.dart';
import 'package:vam_vam/screens/modules/representative/vamVam/course/teacherCourseScreen.dart';
import 'package:vam_vam/utils/colors.dart';
import 'package:vam_vam/utils/imageResources.dart';

import '../../../../../utils/paddingConstant.dart';
import '../../../../../widgets/commonWidgets/commonWidgets.dart';

class TeacherHomeScreen extends StatefulWidget {
  const TeacherHomeScreen({super.key});

  @override
  State<TeacherHomeScreen> createState() => _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends State<TeacherHomeScreen> {
  @override
  void initState() {
    Future.microtask(() => _init());
    super.initState();
  }

  _init() {
    var teacher = Provider.of<TeacherProvider>(context, listen: false);
    teacher.getAllAnnouncements().then((value) {
      if (!value.isSuccess) {
        errorToast(msg: value.message);
      }
    });

    teacher.getTeacherCourses().then((value) {
      if (!value.isSuccess) {
        errorToast(msg: value.message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double itemWidth = width / 2;
    // double itemHeight = itemWidth * 0.8;
    // double aspectRatio = itemWidth / itemHeight;
    return Consumer<TeacherProvider>(
      builder: (context, teacher, child) => GestureDetector(
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
            body: LoadingOverlay(
              isLoading: teacher.isLoading,
              child: SafeArea(
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
                              'Your Activities',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: black,
                                  letterSpacing: 0.5),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                activityCard(
                                    image: 'assets/icons/homeIcon8.png',
                                    title: 'Courses',
                                    count: '${teacher.courseList.length}',
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TeacherCourseScreen()));
                                    }),
                                activityCard(
                                    image: ImageResources.announcementIcon,
                                    title: 'Announcements',
                                    count: '${teacher.announcementList.length}',
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AnnouncementScreen()));
                                    }),
                              ],
                            ),
                            SizedBox(height: 5)
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      // Container(
                      //   padding: EdgeInsets.all(14),
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(8),
                      //       color: white,
                      //       border: Border.all(width: 1, color: vamBorderColor)),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Row(
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Text(
                      //             'Your  Announcements',
                      //             style: TextStyle(
                      //                 fontWeight: FontWeight.w700,
                      //                 fontSize: 16,
                      //                 color: black,
                      //                 letterSpacing: 0.5),
                      //           ),
                      //           Text(
                      //             'View All',
                      //             style: TextStyle(
                      //                 fontWeight: FontWeight.w600,
                      //                 fontSize: 14,
                      //                 color: primaryLight,
                      //                 letterSpacing: 0.5),
                      //           ),
                      //         ],
                      //       ),
                      //       SizedBox(
                      //         height: 15,
                      //       ),
                      //       SizedBox(
                      //         width: ResponsiveHelper.width(context),
                      //         height: itemHeight * 1.81,
                      //         child: GridView.count(
                      //           scrollDirection: Axis.vertical,
                      //           crossAxisCount: 2,
                      //           crossAxisSpacing: 20,
                      //           mainAxisSpacing: 20,
                      //           childAspectRatio: aspectRatio,
                      //           children: List.generate(4, (index) {
                      //             return announcementBox(context);
                      //           }),
                      //         ),
                      //       ),
                      //       SizedBox(height: 5)
                      //     ],
                      //   ),
                      // ),

                      SizedBox(height: 40),
                    ],
                  ),
                )),
              ),
            )),
      ),
    );
  }

  Widget activityCard(
      {required String image,
      required String title,
      required String count,
      required Function() onTap}) {
    return Bounce(
      duration: Duration(milliseconds: 500),
      onPressed: onTap,
      child: Container(
        width: ResponsiveHelper.width(
                  context,
                ) *
                0.5 -
            50,
        height: 140,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: white,
            border: Border.all(width: 1, color: vamBorderColor)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image == ImageResources.announcementIcon
                ? Image.asset(
                    image,
                    height: 40,
                    width: 40,
                    fit: BoxFit.fill,
                  )
                : Image.asset(
                    image,
                    height: 32,
                    width: 32,
                    fit: BoxFit.fill,
                    color: vamPrimaryColor,
                  ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 14, color: vamPrimaryColor),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              count,
              style: TextStyle(
                  fontSize: 16,
                  color: vamPrimaryColor,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}

Widget announcementBox(BuildContext context, {AnnouncementModel? item}) {
  return item != null
      ? Bounce(
          duration: Duration(milliseconds: 500),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AnnouncementDetailScreen(
                      model: item,
                    )));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: white,
                border: Border.all(width: 1, color: vamBorderColor)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (item.course != null) ...[
                  Text(
                    item.course!.code ?? "",
                    maxLines: 1,
                    style: TextStyle(color: vamSecondaryColor, fontSize: 14),
                  ),
                ],
                Text(
                  item.title ?? '',
                  maxLines: 1,
                  style: TextStyle(
                      color: vamPrimaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  item.message ?? '',
                  maxLines: item.course != null ? 2 : 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: vamPrimaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        )
      : SizedBox.shrink();
}
