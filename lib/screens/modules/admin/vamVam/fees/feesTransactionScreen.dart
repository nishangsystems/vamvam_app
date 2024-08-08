import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/providers/masterProvider.dart';
import 'package:vam_vam/providers/parentProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/imageResources.dart';
import '../../../../../utils/paddingConstant.dart';
import '../../../../../widgets/commonWidgets/commonWidgets.dart';
import '../../../user/course/FormBScreen.dart';

class FeesTransactionScreen extends StatefulWidget {
  final String studentId;
  final String studentName;
  const FeesTransactionScreen(
      {super.key, required this.studentId, required this.studentName});

  @override
  State<FeesTransactionScreen> createState() => _FeesTransactionScreenState();
}

class _FeesTransactionScreenState extends State<FeesTransactionScreen> {
  String? selectedYear;
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
    var parent = Provider.of<ParentProvider>(context, listen: false);
    parent.clearFeesHistoryModel();
    master.getBatch().then((value) {
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
          body: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: PaddingConstant.xs,
                  right: PaddingConstant.xs,
                  top: PaddingConstant.m),
              child: LoadingOverlay(
                isLoading: parent.isLoading || master.loader,
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
                          const Text("Fees Transaction",
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
                      if (showPlatformChargesScreen) ...[
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height:
                                      ResponsiveHelper.height(context) * 0.1),
                              Image.asset(
                                'assets/images/platformChargeImg.png',
                                height: ResponsiveHelper.width(context) * 0.75,
                                width: ResponsiveHelper.width(context) * 0.7,
                                fit: BoxFit.fill,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 20, right: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Fees Not Completed',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: white,
                                          fontWeight: FontWeight.w700,
                                        )),
                                    SizedBox(height: 4),
                                    Text(
                                        '${widget.studentName} has not completed fees for this year and is left with XAF 250 000.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: white,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]
                      // else if (!) ...[
                      //   Padding(
                      //     padding: EdgeInsets.only(
                      //         top: ResponsiveHelper.height(context) * 0.35),
                      //     child: notDataFound('No Fees Hisotry Found!'),
                      //   )
                      // ]
                      else ...[
                        Stack(
                          children: [
                            Container(
                              height: 55,
                              width: ResponsiveHelper.width(context),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.5))),
                              child: DropdownButtonHideUnderline(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 36, right: 16),
                                  child: DropdownButton(
                                      isExpanded: true,
                                      hint: Text(
                                        'Select Academic year',
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
                                        if (newValue != null) {
                                          parent
                                              .getParentStudentFeesHistory(
                                                  studentId: widget.studentId,
                                                  batchId:
                                                      '${master.getBatchId(newValue)}')
                                              .then((value) {
                                            if (value.message
                                                .contains('PLATFORM CHARGES')) {
                                              setShowPlatformCharges(true);
                                            } else if (!value.isSuccess) {
                                              errorToast(msg: value.message);
                                            } else {
                                              setShowPlatformCharges(false);
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
                            Positioned(
                              right: 0,
                              child: Container(
                                  height: 55,
                                  width: 55,
                                  padding: EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: primaryLight),
                                  child: Center(
                                    child: Image.asset(
                                      ImageResources.dottedSquareIcon,
                                      fit: BoxFit.fill,
                                    ),
                                  )),
                            ),
                            Positioned(
                                left: 6,
                                top: 0,
                                bottom: 0,
                                child: Icon(
                                  Icons.expand_more_rounded,
                                  size: 24,
                                  color: black,
                                ))
                          ],
                        ),
                        if (!parent.isLoading &&
                            (parent.parentFeesHistoryModel.data == null ||
                                parent.parentFeesHistoryModel.data!.payments ==
                                    null ||
                                parent.parentFeesHistoryModel.data!.payments!
                                    .isEmpty)) ...[
                          Padding(
                            padding: EdgeInsets.only(
                                top: ResponsiveHelper.height(context) * 0.3),
                            child: notDataFound('No Fees Hisotry Found!'),
                          )
                        ] else ...[
                          !parent.isLoading
                              ? Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: parent.parentFeesHistoryModel
                                          .data!.payments!.length,
                                      physics: AlwaysScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        var item = parent.parentFeesHistoryModel
                                            .data!.payments![index];
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
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
                                              Text(
                                                'Tuition ($selectedYear)',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: vamPrimaryColor),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '${item.amount} XAF',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                    color: vamPrimaryColor),
                                              ),
                                              // SizedBox(
                                              //   height: 10,
                                              // ),
                                              // Text(
                                              //   'Paid On 15//12/2023',
                                              //   style: TextStyle(
                                              //       fontSize: 12,
                                              //       fontWeight: FontWeight.w400,
                                              //       color: vamPrimaryColor),
                                              // ),
                                              Text(
                                                'Ref. ${item.referenceNumber}',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: vamPrimaryColor),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                )
                              : SizedBox.shrink()
                        ]
                      ],

                      SizedBox(
                        height: 30,
                      ),
                    ]),
              ),
            ),
          )),
    );
  }
}
