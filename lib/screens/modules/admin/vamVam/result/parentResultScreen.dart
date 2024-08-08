// ignore_for_file: unused_local_variable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/providers/masterProvider.dart';
import 'package:vam_vam/providers/parentProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/screens/modules/user/course/FormBScreen.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/imageResources.dart';
import '../../../../../utils/paddingConstant.dart';
import '../../../../../widgets/commonWidgets/commonWidgets.dart';

class ParentResultScreen extends StatefulWidget {
  final String studentId;
  const ParentResultScreen({super.key, required this.studentId});

  @override
  State<ParentResultScreen> createState() => _ParentResultScreenState();
}

class _ParentResultScreenState extends State<ParentResultScreen> {
  String? selectedYear;
  bool showPlatformChargesScreen = false;
  String? selectedSemester;

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
    var parent = Provider.of<ParentProvider>(context, listen: false);
    parent.clearStudentREsultModel();
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
    return Consumer2<MasterProvider, ParentProvider>(
      builder: (context, master, parent, child) => Scaffold(
          backgroundColor: primaryDark,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(appBarHeight),
              child: homeAppbar(
                  context: context,
                  profileImage: ImageResources.profileImage,
                  name: 'deepak',
                  location: 'H 106')),
          body: LoadingOverlay(
            isLoading: parent.isLoading,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: PaddingConstant.xs,
                    right: PaddingConstant.xs,
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
                          const Text("Result History",
                              style: TextStyle(
                                fontSize: 17,
                                color: white,
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
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
                                    parent
                                        .getParentStudentResult(
                                            batchId:
                                                '${master.getBatchId(selectedYear)}',
                                            semesterId:
                                                '${master.getSemesterId(selectedSemester)}',
                                            studentId: widget.studentId)
                                        .then((value) {
                                      if (!value.isSuccess &&
                                          value.message !=
                                              'Something Went Wrong!') {
                                        errorToast(
                                            msg: value.message, isLong: true);
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
                                  parent
                                      .getParentStudentResult(
                                          batchId:
                                              '${master.getBatchId(selectedYear)}',
                                          semesterId:
                                              '${master.getSemesterId(selectedSemester)}',
                                          studentId: widget.studentId)
                                      .then((value) {
                                    if (!value.isSuccess &&
                                        value.message !=
                                            'Something Went Wrong!') {
                                      errorToast(
                                          msg: value.message, isLong: true);
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
                      ] else if (!parent.isLoading &&
                          (parent.parentStudentResultModel.data == null ||
                              parent.parentStudentResultModel.data!.results ==
                                  null ||
                              parent.parentStudentResultModel.data!.results!
                                  .isEmpty)) ...[
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height:
                                      ResponsiveHelper.height(context) * 0.1),
                              Image.asset(
                                ImageResources.noResultFoundImage,
                                height: ResponsiveHelper.width(context) * 0.35,
                                width: ResponsiveHelper.width(context) * 0.4,
                                fit: BoxFit.fill,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 20, right: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('No Result Found',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: white,
                                          fontWeight: FontWeight.w700,
                                        )),
                                    SizedBox(height: 4),
                                    Text(
                                        'This Student Does Not Have any result available for this semester',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: white,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ] else ...[
                        SizedBox(
                          height: 10,
                        ),
                        !parent.isLoading
                            ? Expanded(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: parent.parentStudentResultModel
                                        .data!.results!.length,
                                    physics: AlwaysScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      var item = parent.parentStudentResultModel
                                          .data!.results![index];
                                      return item != null
                                          ? Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 5),
                                              padding: EdgeInsets.all(12),
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
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        item.code ?? '',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                vamPrimaryColor),
                                                      ),
                                                      Text(
                                                        item.total ?? '',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                vamPrimaryColor),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        item.name ?? '',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                vamPrimaryColor),
                                                      ),
                                                      Text(
                                                        item.grade ?? '',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                vamPrimaryColor),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          : SizedBox.shrink();
                                    }),
                              )
                            : SizedBox.shrink(),
                        SizedBox(
                          height: 10,
                        ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(vertical: 10),
                        //   padding: EdgeInsets.all(12),
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(8),
                        //       color: white,
                        //       border:
                        //           Border.all(width: 1, color: vamBorderColor)),
                        //   child: Column(
                        //     children: [
                        //       Row(
                        //         crossAxisAlignment: CrossAxisAlignment.center,
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Text(
                        //             'Total Credit Earned:32',
                        //             style: TextStyle(
                        //                 fontSize: 12,
                        //                 fontWeight: FontWeight.w600,
                        //                 color: vamPrimaryColor),
                        //           ),
                        //           Text(
                        //             'GPA: 3.6',
                        //             style: TextStyle(
                        //                 fontSize: 16,
                        //                 fontWeight: FontWeight.w600,
                        //                 color: vamPrimaryColor),
                        //           ),
                        //         ],
                        //       ),
                        //       SizedBox(
                        //         height: 10,
                        //       ),
                        //       Container(
                        //         padding: EdgeInsets.symmetric(vertical: 12),
                        //         decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(5),
                        //             color: primaryLight),
                        //         child: Center(
                        //           child: Row(
                        //             crossAxisAlignment: CrossAxisAlignment.center,
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: [
                        //               Icon(
                        //                 Icons.download_outlined,
                        //                 color: white,
                        //               ),
                        //               SizedBox(width: 10),
                        //               Text(
                        //                 'Download Result',
                        //                 style: TextStyle(
                        //                     color: white,
                        //                     fontWeight: FontWeight.w700,
                        //                     fontSize: 12),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],

                      SizedBox(
                        height: 10,
                      ),
                    ]),
              ),
            ),
          )),
    );
  }
}
