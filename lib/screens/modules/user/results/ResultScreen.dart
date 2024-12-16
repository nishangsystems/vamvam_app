import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:go_router/go_router.dart';
import 'package:vam_vam/providers/masterProvider.dart';
import 'package:vam_vam/providers/resultProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../helpers/responsiveHelper.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/imageResources.dart';
import '../../../../utils/paddingConstant.dart';
import '../../../../widgets/commonWidgets/commonWidgets.dart';
import '../course/FormBScreen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String? selectedYear;
  String? selectedSemester;
  int totalCredit = 0;
  bool showPlatformChargesScreen = false;
  List<String> writeOptions = <String>['CA', 'Exam'];
  String? writeOption;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => _init());
  }

  @override
  void dispose() {
    super.dispose();
  }

  setShowPlatformCharges(bool value) {
    showPlatformChargesScreen = value;
    setState(() {});
  }

  _init() {
    var master = Provider.of<MasterProvider>(context, listen: false);
    var result = Provider.of<ResultProvider>(context, listen: false);
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
    result.clearExamResult();
    result.clearCaResult();
  }

  void showResults(String writeOption, String? selectedSemester, String? selectedYear, ResultProvider result, MasterProvider master) {
    switch (writeOption) {
      case 'CA':
        result.examResultModel.data = null;
        result
            .getCaResult(
                batchId: master.getBatchId(selectedYear),
                semesterId: master.getSemesterId(selectedSemester))
            .then((value) {
          if (!value.isSuccess && value.message != 'Something Went Wrong!') {
            errorToast(msg: value.message, isLong: true);
          }
        });
        break;
      case 'Exam':
        result.caResultModel.data = null;
        result
            .getExamResult(
                batchId: master.getBatchId(selectedYear),
                semesterId: master.getSemesterId(selectedSemester))
            .then((value) {
          if (!value.isSuccess && value.message != 'Something Went Wrong!') {
            errorToast(msg: value.message, isLong: true);
          }
        });
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Consumer2<MasterProvider, ResultProvider>(
        builder: (context, master, result, child) => WillPopScope(
          onWillPop: () async {
            result.clearCaResult();
            result.clearExamResult();
            return true;
          },
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
                isLoading: master.loader || result.loader,
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
                                const Text("Results",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: white,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ],
                            ),
                            SizedBox(height: 40),
                            // academic year
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
                                            selectedSemester != null && writeOption != null) {
                                          showResults(writeOption!, selectedSemester, selectedYear, result, master);
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
                            // semester
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
                                          selectedSemester != null && writeOption != null) {
                                        showResults(writeOption!, selectedSemester, selectedYear, result, master);
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
                            SizedBox(height: 20),
                            // CA or Exam
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
                                      'CA or Exam',
                                      style: TextStyle(
                                        color: black,
                                        fontSize: 14,
                                      ),
                                    ),
                                    value: writeOption,
                                    onChanged: (newValue) {
                                      setState(() {
                                        writeOption = newValue.toString();
                                      });

                                      if (selectedYear != null &&
                                          selectedSemester != null && writeOption != null) {
                                        showResults(writeOption!, selectedSemester, selectedYear, result, master);
                                      }
                                    },
                                    items: writeOptions
                                        .map((value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: Text(
                                          value,
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
                                  'You have not paid your platform\ncharges. Pay your charges to have\naccess to your results',
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
                            ] else if (result.examResultModel.data == null && result.caResultModel.data == null &&
                                !result.loader) ...[
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 50, left: 80, right: 80),
                                child: Image.asset('assets/images/noResultImage.png'),
                              ),
                              SizedBox(height: 20),
                              Text('No Results Found',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              SizedBox(height: 10),
                              Text(
                                  'Courses for the level and semester\n selected is not yet available',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12)),
                              SizedBox(height: 20),
                              commonButtonText(
                                  width: 160,
                                  height: 40,
                                  text: 'Back To Home',
                                  textColor: black,
                                  color: Color(0xFFFF985B),
                                  onTap: () => context.pop())
                            ] else if (result.examResultModel.data != null &&
                                result.examResultModel.data!.results != null) ...[
                              SizedBox(height: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListView.builder(
                                    itemCount:
                                    result.examResultModel.data!.results!.length,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index) {
                                      var item = result
                                          .examResultModel.data!.results![index];
                                      // if (item.examMark != null) {
                                      //   // totalCredit += double.parse('${item.examMark}');
                                      // }
                                      return Container(
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.only(bottom: 10),
                                        decoration: BoxDecoration(
                                            color: white,
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(
                                                color: black.withOpacity(0.1))),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(item.code ?? '',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight.w700)),
                                                ),
                                                Text(item.total ?? '',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w600,
                                                        color: textColor)),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(item.name ?? "",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w400,
                                                          color: textColor)),
                                                ),
                                                Text(item.grade ?? '',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w600,
                                                        color: textColor)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 4, bottom: 4, left: 8, right: 8),
                                    margin:
                                    const EdgeInsets.only(left: 14, right: 14),
                                    height: 40,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: white),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            'Total Credit Earned: ${result.examResultModel.data!.examTotal}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700)),
                                        // Text('GPA: 3.6',
                                        //     style: TextStyle(
                                        //         fontSize: 14,
                                        //         fontWeight: FontWeight.w700)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Bounce(
                                    duration: Duration(milliseconds: 500),
                                    onPressed: () {
                                      result
                                          .downloadResult(
                                        semesterId: master
                                            .getSemesterId(selectedSemester)
                                            .toString(),
                                        batchId: master
                                            .getBatchId(selectedYear)
                                            .toString(),
                                      )
                                          .then((value) {
                                        if (!value.isSuccess) {
                                          errorToast(msg: value.message);
                                        }
                                      });
                                    },
                                    child: Container(
                                      margin:
                                      const EdgeInsets.only(left: 14, right: 14),
                                      height: 40,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: white),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4, bottom: 4, left: 8, right: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.download_outlined,
                                                color: primaryLight,
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                'Download Result',
                                                style: TextStyle(
                                                    color: primaryLight,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                              SizedBox(height: 20),
                            ] else if (result.caResultModel.data == null &&
                                !result.loader) ...[
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 50, left: 80, right: 80),
                                child: Image.asset('assets/images/noResultImage.png'),
                              ),
                              SizedBox(height: 20),
                              Text('No Results Found',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              SizedBox(height: 10),
                              Text(
                                  'Courses for the level and semester\n selected is not yet available',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12)),
                              SizedBox(height: 20),
                              commonButtonText(
                                  width: 160,
                                  height: 40,
                                  text: 'Back To Home',
                                  textColor: black,
                                  color: Color(0xFFFF985B),
                                  onTap: () => context.pop())
                            ] else if (result.caResultModel.data != null &&
                                result.caResultModel.data!.results != null) ...[
                              SizedBox(height: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListView.builder(
                                    itemCount:
                                    result.caResultModel.data!.results!.length,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index) {
                                      var item = result
                                          .caResultModel.data!.results![index];
                                      print("item: $item");
                                      return Container(
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.only(bottom: 10),
                                        decoration: BoxDecoration(
                                            color: white,
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(
                                                color: black.withOpacity(0.1))),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(item.code ?? '',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight.w700)),
                                                ),
                                                Text(item.caMark ?? '',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w600,
                                                        color: textColor)),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(item.name ?? "",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w400,
                                                          color: textColor)),
                                                ),
                                                // Text(item.grade ?? '',
                                                //     style: TextStyle(
                                                //         fontSize: 16,
                                                //         fontWeight: FontWeight.w600,
                                                //         color: textColor)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 4, bottom: 4, left: 8, right: 8),
                                    margin:
                                    const EdgeInsets.only(left: 14, right: 14),
                                    height: 40,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: white),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            'Total Credit Earned: ${result.caResultModel.data!.caTotal}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700)),
                                        // Text('GPA: 3.6',
                                        //     style: TextStyle(
                                        //         fontSize: 14,
                                        //         fontWeight: FontWeight.w700)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  // Bounce(
                                  //   duration: Duration(milliseconds: 500),
                                  //   onPressed: () {
                                  //     result
                                  //         .downloadResult(
                                  //       semesterId: master
                                  //           .getSemesterId(selectedSemester)
                                  //           .toString(),
                                  //       batchId: master
                                  //           .getBatchId(selectedYear)
                                  //           .toString(),
                                  //     )
                                  //         .then((value) {
                                  //       if (!value.isSuccess) {
                                  //         errorToast(msg: value.message);
                                  //       }
                                  //     });
                                  //   },
                                  //   child: Container(
                                  //     margin:
                                  //     const EdgeInsets.only(left: 14, right: 14),
                                  //     height: 40,
                                  //     width: double.infinity,
                                  //     decoration: BoxDecoration(
                                  //         borderRadius: BorderRadius.circular(5),
                                  //         color: white),
                                  //     child: Center(
                                  //       child: Padding(
                                  //         padding: const EdgeInsets.only(
                                  //             top: 4, bottom: 4, left: 8, right: 8),
                                  //         child: Row(
                                  //           mainAxisAlignment:
                                  //           MainAxisAlignment.center,
                                  //           children: [
                                  //             Icon(
                                  //               Icons.download_outlined,
                                  //               color: primaryLight,
                                  //             ),
                                  //             SizedBox(width: 10),
                                  //             Text(
                                  //               'Download Result',
                                  //               style: TextStyle(
                                  //                   color: primaryLight,
                                  //                   fontWeight: FontWeight.w700,
                                  //                   fontSize: 12),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // SizedBox(height: 20),
                                ],
                              ),
                              SizedBox(height: 20),
                            ]
                          ],
                        ),
                      )),
                ),
              )),
        ),
      ),
    );
  }


}
