import 'package:vam_vam/data/model/response/levelModel.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/providers/masterProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/courseProvider.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/imageResources.dart';
import '../../../../utils/paddingConstant.dart';
import '../../../../widgets/commonWidgets/commonWidgets.dart';

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({super.key});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  String? selectedLevel;
  bool showPlatformChargesScreen = false;
  List<int?> selectedCourseIds = [];

  @override
  void initState() {
    super.initState();
    Future.microtask(() => _init());
  }

  setShowPlatformCharges(bool value) {
    showPlatformChargesScreen = value;
    setState(() {});
  }

  _init() {
    Provider.of<MasterProvider>(context, listen: false)
        .getLevels()
        .then((value) {
      if (value.message.contains('PLATFORM CHARGES')) {
        setShowPlatformCharges(true);
      } else if (!value.isSuccess) {
        errorToast(msg: value.message);
      } else {
        setShowPlatformCharges(false);
      }
    });
    Provider.of<CourseProvider>(context, listen: false).clearClassCourseList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<MasterProvider, CourseProvider>(
      builder: (context, master, course, child) => GestureDetector(
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
              isLoading: master.loader || course.loader,
              child: SafeArea(
                top: false,
                child: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.only(
                      left: PaddingConstant.l,
                      right: PaddingConstant.l,
                      top: PaddingConstant.xxl),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      SizedBox(height: 20),

                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: Colors.black.withOpacity(0.5))),
                        child: DropdownButtonHideUnderline(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: DropdownButton(
                              isExpanded: true,
                              hint: Text(
                                'Select Level',
                                style: TextStyle(
                                  color: black,
                                  fontSize: 14,
                                ),
                              ),
                              value: selectedLevel,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedLevel = '$newValue';
                                  selectedCourseIds.clear();
                                });

                                course
                                    .getClassCourses(
                                        '${master.getLevelId(newValue)}')
                                    .then((value) {
                                  if (!value.isSuccess) {
                                    errorToast(msg: value.message);
                                  }
                                });
                              },
                              items: _getUniqueLevels(master.levelList)
                                  .map((level) {
                                return DropdownMenuItem(
                                  value: '${level.level}',
                                  child: Text(
                                    '${level.level}',
                                    style: TextStyle(
                                      color: black,
                                      fontSize: 14,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      if (showPlatformChargesScreen) ...[
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50, left: 80, right: 80),
                          child: Image.asset(
                              'assets/images/platformChargeImg.png'),
                        ),
                        SizedBox(height: 20),
                        Text('Pay Platform Charges',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        SizedBox(height: 10),
                        Text(
                            'You have not paid your platform\ncharges. Pay your charges to have\naccess to courses',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 12)),
                        SizedBox(height: 20),
                        // commonButtonText(
                        //     width: 160,
                        //     height: 40,
                        //     text: 'Make Payment',
                        //     textColor: black,
                        //     color: Color(0xFFFF985B),
                        //     onTap: () => ())
                      ] else if (!course.loader &&
                          !master.loader &&
                          course.classCoursesList.isEmpty) ...[
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50, left: 80, right: 80),
                          child: Image.asset('assets/images/noCourseImg.png'),
                        ),
                        SizedBox(height: 20),
                        Text('No Course Available For\n This Level',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        SizedBox(height: 10),
                        Text('Check That you selected a valid level',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 12)),
                      ] else if (course.classCoursesList.isNotEmpty) ...[
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              ListView.builder(
                                itemCount: course.classCoursesList.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  var item = course.classCoursesList[index];
                                  return GestureDetector(
                                    onTap: () {
                                      if (selectedCourseIds.contains(item.id)) {
                                        selectedCourseIds.remove(item.id);
                                      } else {
                                        selectedCourseIds.add(item.id);
                                      }
                                      setState(() {});
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 10, left: 10, right: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                              color: selectedCourseIds
                                                      .contains(item.id)
                                                  ? primaryLight
                                                  : black.withOpacity(0.1))),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16.0,
                                            right: 16,
                                            top: 5,
                                            bottom: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(item.code ?? '',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(item.name ?? '',
                                                      maxLines: 3,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                      ]
                    ],
                  ),
                )),
              ),
            ),
            bottomNavigationBar: selectedCourseIds.isNotEmpty
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    width: ResponsiveHelper.width(context),
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(12)),
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 1),
                          blurRadius: 1,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Center(
                      child: commonButton(
                          width: ResponsiveHelper.width(context),
                          onTap: () {
                            course.registrationPossibilities().then((value) {
                              if (value.isSuccess) {
                                course
                                    .registerCourse(selectedCourseIds)
                                    .then((value) {
                                  if (value.isSuccess) {
                                    successToast(msg: value.message);
                                  } else {
                                    errorToast(msg: value.message);
                                  }
                                });
                              } else {
                                errorToast(msg: value.message);
                              }
                            });
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(color: white),
                          )),
                    ),
                  )
                : SizedBox.shrink()),
      ),
    );
  }

  List<LevelModel> _getUniqueLevels(List<LevelModel> levelList) {
    final seen = <String>{};
    return levelList.where((level) => seen.add('${level.level}')).toList();
  }
}
