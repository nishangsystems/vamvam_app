import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/helpers/regexHelper.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/providers/teacherProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/widgets/commonWidgets/customTextFormField.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/imageResources.dart';
import '../../../../../utils/paddingConstant.dart';
import '../../../../../widgets/commonWidgets/commonWidgets.dart';

class AddAnouncementScreen extends StatefulWidget {
  final String code;
  final String course;
  final String courseId;
  final String campusId;
  final String? announcementId;
  const AddAnouncementScreen(
      {super.key,
      required this.code,
      required this.course,
      required this.courseId,
      required this.campusId,
      this.announcementId});

  @override
  State<AddAnouncementScreen> createState() => _AddAnouncementScreenState();
}

class _AddAnouncementScreenState extends State<AddAnouncementScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController courseController = TextEditingController();
  final TextEditingController msgController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Future.microtask(() => _init());
    super.initState();
  }

  _init() {
    codeController.text = widget.code;
    courseController.text = widget.course;
    var teacher = Provider.of<TeacherProvider>(context, listen: false);
    if (widget.announcementId != null) {
      for (var element in teacher.announcementList) {
        if ('${element.id}' == widget.announcementId) {
          titleController.text = element.title ?? '';
          msgController.text = element.message ?? '';
        }
      }
    }
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
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
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
                            Text(
                                "${widget.announcementId == null ? 'Add' : 'Edit'} Announcement",
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
                              border:
                                  Border.all(width: 1, color: vamBorderColor)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Announcement Title Field
                                customTextFormField2(
                                    controller: titleController,
                                    title: 'Announcement Title',
                                    isBorder: true,
                                    keyboardType: TextInputType.text,
                                    color: vamPrimaryColor.withOpacity(0.63),
                                    fontWeight: FontWeight.w700),
                                SizedBox(height: 15),

                                // Announcement Code Field
                                customTextFormField2(
                                  textRegex: addressReg,
                                  controller: codeController,
                                  isRead: true,
                                  title: 'Code',
                                  isBorder: true,
                                  keyboardType: TextInputType.text,
                                  color: vamPrimaryColor.withOpacity(0.63),
                                  fontWeight: FontWeight.w700,
                                ),
                                SizedBox(height: 15),

                                // Announcement Course Field
                                customTextFormField2(
                                    textRegex: addressReg,
                                    controller: courseController,
                                    isRead: true,
                                    title: 'Course',
                                    isBorder: true,
                                    keyboardType: TextInputType.text,
                                    color: vamPrimaryColor.withOpacity(0.63),
                                    fontWeight: FontWeight.w700),
                                SizedBox(height: 15),

                                // Announcement Message Field
                                customTextFormField2(
                                    textRegex: addressReg,
                                    controller: msgController,
                                    isExpand: true,
                                    isBorder: true,
                                    title: 'Announcement Message..',
                                    keyboardType: TextInputType.text,
                                    color: vamPrimaryColor.withOpacity(0.63),
                                    fontWeight: FontWeight.w700),
                                SizedBox(height: 50),

                                commonButtonWhite(
                                    width: ResponsiveHelper.width(context),
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        if (widget.announcementId == null) {
                                          teacher
                                              .createAnnouncementx(
                                                  courseId: widget.courseId,
                                                  title: titleController.text
                                                      .toString(),
                                                  message: msgController.text
                                                      .toString(),
                                                  campusId: widget.campusId)
                                              .then((value) {
                                            if (value.isSuccess) {
                                              teacher.getAllAnnouncements();
                                              successToast(
                                                  msg:
                                                      'Announcement created successfully');
                                              context.pop();
                                              context.pop();
                                            } else {
                                              errorToast(msg: value.message);
                                            }
                                          });
                                        } else {
                                          teacher
                                              .updateAnnouncement(
                                                  title: titleController.text
                                                      .toString(),
                                                  message: msgController.text
                                                      .toString(),
                                                  announcementId:
                                                      '${widget.announcementId}')
                                              .then((value) {
                                            if (value.isSuccess) {
                                              teacher.getAllAnnouncements();
                                              successToast(
                                                  msg:
                                                      'Announcement updated successfully');
                                              context.pop();
                                              context.pop();
                                            } else {
                                              errorToast(msg: value.message);
                                            }
                                          });
                                        }
                                      }
                                    },
                                    bgColors: [primaryLight, primaryLight],
                                    title:
                                        "${widget.announcementId == null ? 'Post' : 'Update'} Announcement",
                                    txtColor: white)
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
