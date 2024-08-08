import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

import '../../../../../helpers/dialogHelper.dart';
import '../../../../../helpers/responsiveHelper.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/imageResources.dart';
import '../../../../../utils/paddingConstant.dart';
import '../../../../../widgets/commonWidgets/appDesign.dart';
import '../../../../../widgets/commonWidgets/commonWidgets.dart';
import '../../../../../widgets/commonWidgets/textStyle.dart';

class ComplaintStatusScreen extends StatefulWidget {
  const ComplaintStatusScreen({super.key});

  @override
  State<ComplaintStatusScreen> createState() => _ComplaintStatusScreenState();
}

class _ComplaintStatusScreenState extends State<ComplaintStatusScreen> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                left: PaddingConstant.l,
                right: PaddingConstant.l,
                top: PaddingConstant.xxl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    commonBackButton(
                        context: context, title: '', backBtnColor: white),
                    const SizedBox(width: 10),
                    const Text("Complaint Status",
                        style: TextStyle(
                          fontSize: 17,
                          color: white,
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
                SizedBox(height: ResponsiveHelper.height(context) * 0.04),
                Row(
                  children: [
                    Expanded(
                      child: Bounce(
                        duration: const Duration(milliseconds: 110),
                        onPressed: () {
                          isSelected = true;

                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 2.0,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.white38),
                              ],
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.1)),
                              color:
                                  isSelected ? Colors.white : Colors.white38),
                          height: 40,
                          margin: const EdgeInsets.only(right: 5),
                          child: Center(
                            child: Text('Open',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: isSelected
                                        ? primaryDark
                                        : primaryDark.withOpacity(0.5))),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Bounce(
                        duration: const Duration(milliseconds: 110),
                        onPressed: () {
                          isSelected = false;
                          setState(() {});
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 2.0,
                                    color: isSelected
                                        ? Colors.white38
                                        : Colors.white),
                              ],
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.1)),
                              color:
                                  isSelected ? Colors.white38 : Colors.white),
                          margin: const EdgeInsets.only(left: 5),
                          child: Center(
                              child: Text(
                            'Close',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: isSelected
                                    ? primaryDark.withOpacity(0.5)
                                    : primaryDark),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ResponsiveHelper.height(context) * 0.03),
                isSelected
                    ? Expanded(
                        child: ListView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: commonContainerList(
                                    child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Image.asset(
                                                IconResource
                                                    .complaintStatusIcon,
                                                height: 22,
                                                width: 22),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'In Progress',
                                            style: commonTextStyle12(
                                                color: primaryDark),
                                          ),
                                          const Spacer(),
                                          Text(
                                            'complaint id : #121',
                                            textAlign: TextAlign.end,
                                            style: commonTextStyle12(
                                                color: primaryDark),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                          height:
                                              ResponsiveHelper.height(context) *
                                                  0.01),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: ResponsiveHelper.width(
                                                    context) *
                                                0.16,
                                            height: ResponsiveHelper.height(
                                                    context) *
                                                0.08,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: const Color(0xfff4f2f2)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: Image.asset(
                                                  IconResource.waterSupplyIcon),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'water supply',
                                                  style: commonTextStyle13(
                                                      color: primaryDark),
                                                ),
                                                Text(
                                                  'I am writing to bring to your attention the water shortage problem that has been affecting our community for the past few weeks',
                                                  style: commonTextStyle12(
                                                      color: black),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                          height:
                                              ResponsiveHelper.height(context) *
                                                  0.02),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Bounce(
                                              duration: const Duration(
                                                  milliseconds: 110),
                                              onPressed: () {},
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(8)),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                          blurRadius: 2.0,
                                                          color: primaryDark),
                                                    ],
                                                    border: Border.all(
                                                        color: Colors.white
                                                            .withOpacity(0.1)),
                                                    color: primaryDark),
                                                height: 40,
                                                margin: const EdgeInsets.only(
                                                    right: 5),
                                                child: Center(
                                                  child: Text('Withdraw',
                                                      style: commonTextStyle13(
                                                          color: white)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Bounce(
                                              duration: const Duration(
                                                  milliseconds: 110),
                                              onPressed: () {},
                                              child: Container(
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(8)),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                          blurRadius: 2.0,
                                                          color: primaryDark),
                                                    ],
                                                    border: Border.all(
                                                        color: Colors.white
                                                            .withOpacity(0.1)),
                                                    color: primaryDark),
                                                margin: const EdgeInsets.only(
                                                    left: 5),
                                                child: Center(
                                                    child: Text('Track',
                                                        style:
                                                            commonTextStyle13(
                                                                color: white))),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height:
                                              ResponsiveHelper.height(context) *
                                                  0.02),
                                    ],
                                  ),
                                )),
                              );
                            }),
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: commonContainerList(
                                    child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Image.asset(
                                                IconResource
                                                    .complaintStatusIcon2,
                                                height: 22,
                                                width: 22),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Resolved',
                                            style: commonTextStyle12(
                                                color: primaryDark),
                                          ),
                                          const Spacer(),
                                          Text(
                                            'complaint id : #121',
                                            textAlign: TextAlign.end,
                                            style: commonTextStyle12(
                                                color: primaryDark),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                          height:
                                              ResponsiveHelper.height(context) *
                                                  0.01),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: ResponsiveHelper.width(
                                                    context) *
                                                0.16,
                                            height: ResponsiveHelper.height(
                                                    context) *
                                                0.08,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: const Color(0xfff4f2f2)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: Image.asset(
                                                  IconResource.waterSupplyIcon),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'water supply',
                                                  style: commonTextStyle13(
                                                      color: primaryDark),
                                                ),
                                                Text(
                                                  'I am writing to bring to your attention the water shortage problem that has been affecting our community for the past few weeks',
                                                  style: commonTextStyle12(
                                                      color: black),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                          height:
                                              ResponsiveHelper.height(context) *
                                                  0.01),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Image.asset(
                                                IconResource
                                                    .complaintStatusIcon3,
                                                height: 22,
                                                width: 22),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16.0, bottom: 10),
                                              child: RichText(
                                                text: const TextSpan(
                                                  style: TextStyle(
                                                      fontSize: 12.0,
                                                      color: black),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text:
                                                            'Hi , your problem is resolved by john deo on wed, 16 aug.',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: black,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        )),
                                                    TextSpan(
                                                        text:
                                                            'On wed, 16 aug. ',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Bounce(
                                              duration: const Duration(
                                                  milliseconds: 110),
                                              onPressed: () {},
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(8)),
                                                  boxShadow: const [
                                                    /*   BoxShadow(
                                                blurRadius: 2.0,
                                                color:  primaryDark
                                            ),*/
                                                  ],
                                                  border: Border.all(
                                                      color: primaryDark
                                                          .withOpacity(
                                                              0.1)), /* color: primaryDark*/
                                                ),
                                                height: 40,
                                                margin: const EdgeInsets.only(
                                                    right: 5),
                                                child: Center(
                                                  child: Text(
                                                      'Reopen Complaint',
                                                      style: commonTextStyle13(
                                                          color: primaryDark)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Bounce(
                                              duration: const Duration(
                                                  milliseconds: 110),
                                              onPressed: () {},
                                              child: Container(
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(8)),
                                                  boxShadow: const [
                                                    /*  BoxShadow(
                                                blurRadius: 2.0,
                                                color: primaryDark),*/
                                                  ],
                                                  border: Border.all(
                                                      color: primaryDark
                                                          .withOpacity(
                                                              0.1)), /*color: primaryDark*/
                                                ),
                                                margin: const EdgeInsets.only(
                                                    left: 5),
                                                child: Center(
                                                    child: Text(
                                                        'View Complaint',
                                                        style: commonTextStyle13(
                                                            color:
                                                                primaryDark))),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height:
                                              ResponsiveHelper.height(context) *
                                                  0.02),
                                      commonButtonWhite(
                                          width:
                                              ResponsiveHelper.width(context) *
                                                  0.5,
                                          onTap: () {
                                            showComplaintDialog(
                                                context: context);
                                          },
                                          title: 'Write Your Review',
                                          txtColor: white,
                                          bgColors: [primaryDark, primaryDark],
                                          fontSize: 12),
                                      SizedBox(
                                          height:
                                              ResponsiveHelper.height(context) *
                                                  0.02),
                                    ],
                                  ),
                                )),
                              );
                            }),
                      ),
              ],
            ),
          ),
        ));
  }
}
