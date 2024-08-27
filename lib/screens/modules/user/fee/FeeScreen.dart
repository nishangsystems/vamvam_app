import 'package:vam_vam/helpers/dateTimeHelper.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/providers/masterProvider.dart';
import 'package:vam_vam/providers/resultProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/screens/modules/user/course/FormBScreen.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/imageResources.dart';
import '../../../../utils/paddingConstant.dart';
import '../../../../widgets/commonWidgets/commonWidgets.dart';

class FeeScreen extends StatefulWidget {
  const FeeScreen({super.key});

  @override
  State<FeeScreen> createState() => _FeeScreenState();
}

class _FeeScreenState extends State<FeeScreen> {
  String? selectedYear;
  bool showPlatformChargesScreen = false;
  List<String>? yearList = [
    '2020',
    '2021',
    '2022',
    '2023',
  ];
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
    var result = Provider.of<ResultProvider>(context, listen: false);
    var master = Provider.of<MasterProvider>(context, listen: false);

    result.getFees().then((value) {
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
    return Consumer2<MasterProvider, ResultProvider>(
      builder: (context, master, result, child) => GestureDetector(
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
              isLoading: result.loader,
              child: SafeArea(
                  top: false,
                  child: showPlatformChargesScreen
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                                'You have not paid your platform\ncharges. Pay your charges to have\naccess to your fees payment details',
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
                          ],
                        )
                      : !result.loader &&
                              result.feesData!.data != null &&
                              result.feesData!.data!.payments != null
                          ? SingleChildScrollView(
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 10),

                                // Add Course title
                                Padding(
                                  padding: const EdgeInsets.all(16.9),
                                  child: Row(
                                    children: [
                                      commonBackButton(
                                          context: context,
                                          title: '',
                                          backBtnColor: white),
                                      const SizedBox(width: 10),
                                      const Text("Fees",
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: white,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: PaddingConstant.l),
                                  child: Container(
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
                                                result
                                                    .getExamResult(
                                                    batchId:
                                                    master.getBatchId(selectedYear),
                                                    semesterId: master.getSemesterId(
                                                        selectedSemester))
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
                                ),

                                // SizedBox(height: 10),
                                // if (result.feesData!.data != null)
                                //   if (selectedYear == '2020') ...[
                                //     Container(
                                //       color: Colors.white,
                                //       child: Stack(
                                //         children: [
                                //           Image.asset('assets/images/feeUnpaidImg.png'),
                                //           Padding(
                                //             padding: const EdgeInsets.only(
                                //                 left: 20, top: 20, right: 16),
                                //             child: Column(
                                //               crossAxisAlignment: CrossAxisAlignment.start,
                                //               children: [
                                //                 Text('Fees Not Paid',
                                //                     style: TextStyle(
                                //                       fontSize: 22,
                                //                       color: orangeHeader,
                                //                       fontWeight: FontWeight.w700,
                                //                     )),
                                //                 SizedBox(height: 4),
                                //                 Text(
                                //                     'You have not paid your fees for the school year 2023/2024. go on pay to register your courses.',
                                //                     style: TextStyle(
                                //                       fontSize: 13,
                                //                       color: black.withOpacity(0.5),
                                //                       fontWeight: FontWeight.w400,
                                //                     )),
                                //               ],
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ] else if (selectedYear != null) ...[
                                //     Container(
                                //       color: Colors.white,
                                //       child: Stack(
                                //         children: [
                                //           Image.asset('assets/images/feeNotComplete.png'),
                                //           Padding(
                                //             padding: const EdgeInsets.only(
                                //                 left: 20, top: 20, right: 16),
                                //             child: Column(
                                //               crossAxisAlignment: CrossAxisAlignment.start,
                                //               children: [
                                //                 Text('Fees Not Completed',
                                //                     style: TextStyle(
                                //                       fontSize: 22,
                                //                       color: primaryLight.withOpacity(0.9),
                                //                       fontWeight: FontWeight.w700,
                                //                     )),
                                //                 SizedBox(height: 4),
                                //                 Text(
                                //                     'You still owe 222,000 XAF. Please complete it to have access to your results.',
                                //                     style: TextStyle(
                                //                       fontSize: 13,
                                //                       color: black.withOpacity(0.5),
                                //                       fontWeight: FontWeight.w400,
                                //                     )),
                                //               ],
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],

                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: PaddingConstant.l,
                                    right: PaddingConstant.l,
                                  ),
                                  child: Column(
                                    children: [
                                      // Align(
                                      //   alignment: Alignment.centerLeft,
                                      //   child: Text("Fees Transaction",
                                      //       style: TextStyle(
                                      //         fontSize: 14,
                                      //         color: white,
                                      //         fontWeight: FontWeight.w500,
                                      //       )),
                                      // ),
                                      // SizedBox(height: 10),
                                      // Container(
                                      //   decoration: BoxDecoration(
                                      //       color: Colors.white,
                                      //       borderRadius: BorderRadius.circular(12),
                                      //       border: Border.all(
                                      //           color: Colors.black.withOpacity(0.5))),
                                      //   child: DropdownButtonHideUnderline(
                                      //     child: Padding(
                                      //       padding:
                                      //           const EdgeInsets.only(left: 16, right: 16),
                                      //       child: DropdownButton(
                                      //           isExpanded: true,
                                      //           hint: Text(
                                      //             'Select Academic year',
                                      //             style: TextStyle(
                                      //               color: black,
                                      //               fontSize: 14,
                                      //             ),
                                      //           ),
                                      //           value: selectedYear,
                                      //           onChanged: (newValue) {
                                      //             setState(() {
                                      //               selectedYear = newValue.toString();
                                      //             });
                                      //           },
                                      //           items: yearList?.map((location) {
                                      //             return DropdownMenuItem(
                                      //               value: location,
                                      //               child: Text(
                                      //                 location,
                                      //                 style: TextStyle(
                                      //                   color: black,
                                      //                   fontSize: 14,
                                      //                 ),
                                      //               ),
                                      //             );
                                      //           }).toList()),
                                      //     ),
                                      //   ),
                                      // ),
                                      // if (fees == null) ...[
                                      //   SizedBox(height: 20),
                                      //   Padding(
                                      //     padding: const EdgeInsets.only(
                                      //         top: 50, left: 80, right: 80),
                                      //     child: Image.asset('assets/images/noCourseImg.png'),
                                      //   ),
                                      //   SizedBox(height: 20),
                                      //   Text('No Transaction Available\n for Selected Year',
                                      //       textAlign: TextAlign.center,
                                      //       style: const TextStyle(
                                      //           color: Colors.white,
                                      //           fontWeight: FontWeight.bold,
                                      //           fontSize: 20)),
                                      //   SizedBox(height: 10),
                                      //   Text('Check That you selected a valid Year',
                                      //       textAlign: TextAlign.center,
                                      //       style: const TextStyle(
                                      //           color: Colors.white,
                                      //           fontWeight: FontWeight.normal,
                                      //           fontSize: 12)),
                                      // ] else ...[
                                      SizedBox(height: 20),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Column(
                                          children: [
                                            ListView.builder(
                                              itemCount: result.feesData!.data!
                                                  .payments!.length,
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                var item = result.feesData!
                                                    .data!.payments![index];
                                                return Container(
                                                  margin: EdgeInsets.only(
                                                      top: 10,
                                                      left: 10,
                                                      right: 10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      border: Border.all(
                                                          color:
                                                              black.withOpacity(
                                                                  0.1))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 16.0,
                                                            right: 16,
                                                            top: 5,
                                                            bottom: 5),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            '${item.item!.name}',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700)),
                                                        Text(
                                                            '${item.amount} XAF',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700)),
                                                        SizedBox(height: 10),
                                                        Text(
                                                            'Paid On ${DateTimeHelper.formattedDate(DateTime.parse('${item.createdAt}'))}',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                                'Ref. ${item.referenceNumber}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400)),
                                                            // Container(
                                                            //   decoration: BoxDecoration(
                                                            //     border: Border.all(
                                                            //         color: primaryDark,
                                                            //         width: 1.5),
                                                            //     borderRadius:
                                                            //         BorderRadius.circular(
                                                            //             5),
                                                            //     color: primaryDark,
                                                            //   ),
                                                            //   child: Center(
                                                            //     child: Padding(
                                                            //       padding:
                                                            //           const EdgeInsets.only(
                                                            //               top: 2,
                                                            //               bottom: 2,
                                                            //               left: 8,
                                                            //               right: 8),
                                                            //       child: Icon(
                                                            //         Icons.download_outlined,
                                                            //         color: Colors.white,
                                                            //         size: 18,
                                                            //       ),
                                                            //     ),
                                                            //   ),
                                                            // ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            SizedBox(height: 20),
                                          ],
                                        ),
                                      ),
                                      //   SizedBox(height: 20),
                                      // ]
                                    ],
                                  ),
                                ),
                              ],
                            ))
                          : !result.loader
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.9),
                                      child: Row(
                                        children: [
                                          commonBackButton(
                                              context: context,
                                              title: '',
                                              backBtnColor: white),
                                          const SizedBox(width: 10),
                                          const Text("Fees",
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: white,
                                                fontWeight: FontWeight.w500,
                                              )),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top:
                                              ResponsiveHelper.height(context) *
                                                  0.35),
                                      child: Center(
                                        child: Text(
                                          'No Payment Found!',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600,
                                              color: white.withOpacity(0.5)),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox.shrink()),
            )),
      ),
    );
  }
}
