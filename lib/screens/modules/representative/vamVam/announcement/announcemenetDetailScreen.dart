import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/data/model/response/teacher/announcementModel.dart';
import 'package:vam_vam/helpers/dialogHelper.dart';
import 'package:vam_vam/providers/teacherProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/screens/modules/representative/vamVam/announcement/addAnnouncementScreen.dart';

import '../../../../../helpers/responsiveHelper.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/imageResources.dart';
import '../../../../../utils/paddingConstant.dart';
import '../../../../../widgets/commonWidgets/commonWidgets.dart';

class AnnouncementDetailScreen extends StatefulWidget {
  final AnnouncementModel model;
  const AnnouncementDetailScreen({super.key, required this.model});

  @override
  State<AnnouncementDetailScreen> createState() =>
      _AnnouncementDetailScreenState();
}

class _AnnouncementDetailScreenState extends State<AnnouncementDetailScreen> {
  int editDeleteIndex = 0;

  setEditDeleteIndex(int index) {
    editDeleteIndex = index;
    setState(() {});
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
                child: widget.model.course == null
                    ? notDataFound('No Data Found!')
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
                              Text(widget.model.course!.code ?? '',
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
                            width: ResponsiveHelper.width(context),
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
                                  widget.model.title ?? '',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: black,
                                      letterSpacing: 0.5),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  widget.model.message ?? '',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: black,
                                      letterSpacing: 0.5),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            // padding: EdgeInsets.symmetric(vertical: 10),
                            width: ResponsiveHelper.width(context),
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setEditDeleteIndex(0);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddAnouncementScreen(
                                                  code: widget
                                                          .model.course!.code ??
                                                      '',
                                                  course: widget
                                                          .model.course!.name ??
                                                      '',
                                                  courseId: '',
                                                  campusId: '',
                                                  announcementId:
                                                      '${widget.model.id}',
                                                )));
                                  },
                                  child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 11),
                                      width: editDeleteIndex == 0
                                          ? ResponsiveHelper.width(context) *
                                                  0.6 -
                                              22.5
                                          : ResponsiveHelper.width(context) *
                                                  0.4 -
                                              22.5,
                                      decoration: BoxDecoration(
                                          color: editDeleteIndex == 0
                                              ? primaryLight
                                              : white,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Center(
                                          child: Text(
                                        'Edit',
                                        style: TextStyle(
                                            color: editDeleteIndex == 0
                                                ? white
                                                : vamSecondaryColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ))),
                                ),
                                InkWell(
                                  onTap: () {
                                    // setEditDeleteIndex(1)
                                    showDeleteDialog(context, onDelete: () {
                                      Navigator.of(context).pop();
                                      teacher
                                          .deleteAnnouncement(
                                              announcementId:
                                                  widget.model.id.toString())
                                          .then((value) {
                                        if (value.isSuccess) {
                                          teacher.getAllAnnouncements();
                                          successToast(msg: value.message);
                                          Navigator.of(context).pop();
                                        } else {
                                          errorToast(msg: value.message);
                                        }
                                      });
                                    },
                                        subTitle:
                                            'Are you sure want to delete your announcement?',
                                        title: 'Delete Announcement');
                                  },
                                  child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 11),
                                      width: editDeleteIndex == 1
                                          ? ResponsiveHelper.width(context) *
                                                  0.6 -
                                              22.5
                                          : ResponsiveHelper.width(context) *
                                                  0.4 -
                                              22.5,
                                      decoration: BoxDecoration(
                                          color: editDeleteIndex == 1
                                              ? primaryLight
                                              : white,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Center(
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                              color: editDeleteIndex == 1
                                                  ? white
                                                  : vamSecondaryColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // Container(
                          //   padding: EdgeInsets.all(14),
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(8),
                          //       color: white,
                          //       border: Border.all(width: 1, color: vamBorderColor)),
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         'Other  Announcements',
                          //         style: TextStyle(
                          //             fontWeight: FontWeight.w700,
                          //             fontSize: 16,
                          //             color: black,
                          //             letterSpacing: 0.5),
                          //       ),
                          //       SizedBox(
                          //         height: 15,
                          //       ),
                          //       SizedBox(
                          //         width: ResponsiveHelper.width(context),
                          //         height: ResponsiveHelper.height(context) - (315 + 200),
                          //         child: GridView.count(
                          //           scrollDirection: Axis.vertical,
                          //           crossAxisCount: 2,
                          //           crossAxisSpacing: 20,
                          //           mainAxisSpacing: 20,
                          //           childAspectRatio: aspectRatio,
                          //           // physics: AlwaysScrollableScrollPhysics(),
                          //           children: List.generate(15, (index) {
                          //             return announcementBox(context);
                          //           }),
                          //         ),
                          //       ),
                          //       SizedBox(height: 5)
                          //     ],
                          //   ),
                          // ),

                          SizedBox(height: 20),
                        ],
                      ),
              ),
            ),
          )),
    );
  }
}
