import 'package:vam_vam/data/model/response/batchModel.dart';
import 'package:vam_vam/data/model/response/semesterModel.dart';
import 'package:vam_vam/providers/courseProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../helpers/responsiveHelper.dart';
import '../../../../providers/masterProvider.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/imageResources.dart';
import '../../../../utils/paddingConstant.dart';
import '../../../../widgets/commonWidgets/commonWidgets.dart';

class FormBScreen extends StatefulWidget {
  const FormBScreen({super.key});

  @override
  State<FormBScreen> createState() => _FormBScreenState();
}

class _FormBScreenState extends State<FormBScreen> {
  String? selectedYear;
  String? selectedSemester;
  bool showPlatformChargesScreen = false;

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
    var master = Provider.of<MasterProvider>(context, listen: false);
    var course = Provider.of<CourseProvider>(context, listen: false);
    course.clearRegisteredCourseList();
    master.getBatch().then((value) {
      if (value.message.contains('PLATFORM CHARGES')) {
        setShowPlatformCharges(true);
      } else if (!value.isSuccess) {
        errorToast(msg: value.message);
      } else {
        setShowPlatformCharges(false);
      }
    });
    master.getSemester().then((value) {
      if (value.message.contains('PLATFORM CHARGES')) {
        setShowPlatformCharges(true);
      } else if (!value.isSuccess) {
        errorToast(msg: value.message);
      } else {
        setShowPlatformCharges(false);
      }
    });
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
              isLoading: course.loader || master.loader,
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
                          const Text("Form B (Registered Courses)",
                              style: TextStyle(
                                fontSize: 17,
                                color: white,
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                      SizedBox(height: 40),

                      Container(
                        width: ResponsiveHelper.width(context),
                        height: ResponsiveHelper.height(context) * 0.05,
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
                                  'Year',
                                  style: TextStyle(
                                    color: black,
                                    fontSize: 14,
                                  ),
                                ),
                                value: selectedYear,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedYear = newValue.toString();
                                  });
                                  if (selectedYear != null &&
                                      selectedSemester != null) {
                                    course
                                        .getRegisteredCourse(
                                            batchId:
                                                master.getBatchId(selectedYear),
                                            semesterId: master.getSemesterId(
                                                selectedSemester))
                                        .then((value) {
                                      if (!value.isSuccess &&
                                          value.message !=
                                              'Something Went Wrong!') {
                                        errorToast(msg: value.message);
                                      }
                                    });
                                  }
                                },
                                items: getUniqueBatch(master.batchList)
                                    .map((value) {
                                  return DropdownMenuItem(
                                    value: '${value.name}',
                                    child: Text(
                                      '${value.name}',
                                      style: TextStyle(
                                        color: black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  );
                                }).toList()),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: ResponsiveHelper.width(context),
                        height: ResponsiveHelper.height(context) * 0.05,
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
                                'Semester',
                                style: TextStyle(
                                  color: black,
                                  fontSize: 14,
                                ),
                              ),
                              value: selectedSemester,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedSemester = newValue.toString();
                                });
                                if (selectedYear != null &&
                                    selectedSemester != null) {
                                  course
                                      .getRegisteredCourse(
                                          batchId:
                                              master.getBatchId(selectedYear),
                                          semesterId: master
                                              .getSemesterId(selectedSemester))
                                      .then((value) {
                                    if (!value.isSuccess &&
                                        value.message !=
                                            'Something Went Wrong!') {
                                      errorToast(msg: value.message);
                                    }
                                  });
                                }
                              },
                              items: getUniqueSemester(master.semesterList)
                                  .map((value) {
                                return DropdownMenuItem(
                                  value: '${value.name}',
                                  child: Text(
                                    '${value.name}',
                                    style: TextStyle(
                                      color: black,
                                      fontSize: 12,
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
                            'You have not paid your platform\ncharges. Pay your charges to have\naccess to your form',
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
                          course.registeredCourseList.isEmpty) ...[
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50, left: 80, right: 80),
                          child:
                              Image.asset('assets/images/noCourseEnrolled.png'),
                        ),
                        SizedBox(height: 20),
                        Text('No Course Enrolled Yet',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        SizedBox(height: 10),
                        Text('Check That you enroll any course.',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 12)),
                        // SizedBox(height: 20),
                        // commonButtonText(
                        //     width: 160,
                        //     height: 40,
                        //     text: 'Register Courses',
                        //     textColor: black,
                        //     color: Color(0xFFFF985B),
                        //     onTap: () => ())
                      ] else ...[
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView.builder(
                                itemCount: course.registeredCourseList.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  var item = course.registeredCourseList[index];
                                  return Container(
                                    margin: EdgeInsets.only(
                                        top: 10, left: 10, right: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: black.withOpacity(0.1))),
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
                                                  fontWeight: FontWeight.w700)),
                                          Text(item.name ?? "",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text('Total Enrolled',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        ' ${course.registeredCourseList.length}',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400)),
                                    InkWell(
                                      onTap: () {
                                        course
                                            .downloadForm(
                                                batchId: master
                                                    .getBatchId(selectedYear),
                                                semesterId:
                                                    master.getSemesterId(
                                                        selectedSemester))
                                            .then((value) {
                                          if (!value.isSuccess &&
                                              value.message !=
                                                  'Something Went Wrong!') {
                                            errorToast(msg: value.message);
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: primaryDark
                                                    .withOpacity(0.5),
                                                width: 1.5),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: primaryLight),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 4,
                                                bottom: 4,
                                                left: 8,
                                                right: 8),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.download_outlined,
                                                  color: white,
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  'Download',
                                                  style: TextStyle(
                                                      color: white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
            )),
      ),
    );
  }
}

List<BatchModel> getUniqueBatch(List<BatchModel> batchList) {
  final seen = <String>{};
  return batchList.where((batch) => seen.add('${batch.name}')).toList();
}

List<SemesterModel> getUniqueSemester(List<SemesterModel> semesterList) {
  final seen = <String>{};
  return semesterList.where((sem) => seen.add('${sem.name}')).toList();
}
