import 'package:flutter/material.dart';
import 'package:vam_vam/helpers/mockHelper.dart';

import '../../../../helpers/responsiveHelper.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/imageResources.dart';
import '../../../../utils/paddingConstant.dart';
import '../../../../widgets/commonWidgets/appDesign.dart';
import '../../../../widgets/commonWidgets/commonWidgets.dart';
import '../../../../widgets/commonWidgets/textStyle.dart';

class UserEventScreen extends StatefulWidget {
  const UserEventScreen({super.key});

  @override
  State<UserEventScreen> createState() => _UserEventScreenState();
}

class _UserEventScreenState extends State<UserEventScreen> {
  var selectIndex = 0;
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
                    const Text("Events",
                        style: TextStyle(
                          fontSize: 17,
                          color: white,
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
                SizedBox(height: ResponsiveHelper.height(context) * 0.03),
                SizedBox(
                  height: ResponsiveHelper.height(context) * 0.04,
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: MockHelper.eventList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        var item = MockHelper.eventList[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectIndex = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                                width: ResponsiveHelper.width(context) * 0.285,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 2.0,
                                          color: selectIndex == index
                                              ? Colors.white
                                              : Colors.white38),
                                    ],
                                    border: Border.all(
                                        color: selectIndex == index
                                            ? Colors.white
                                            : Colors.white38),
                                    color: selectIndex == index
                                        ? Colors.white
                                        : Colors.white38),
                                child: Center(
                                    child: Text(item['title'],
                                        style: commonTextStyle13(
                                            color: selectIndex == index
                                                ? primaryDark
                                                : primaryDark
                                                    .withOpacity(0.5))))),
                          ),
                        );
                      }),
                ),
                SizedBox(height: 15),
                Expanded(
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
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: ResponsiveHelper.width(context) *
                                          0.16,
                                      height: ResponsiveHelper.height(context) *
                                          0.08,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: const Color(0xfff4f2f2)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
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
                                            'Management system',
                                            style: commonTextStyle12(
                                                color: primaryDark),
                                          ),
                                          Text(
                                            'hello Deepak',
                                            style:
                                                commonTextStyle12(color: black),
                                          ),
                                          Text(
                                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                            style:
                                                commonTextStyle12(color: black),
                                          ),
                                          SizedBox(
                                              height: ResponsiveHelper.height(
                                                      context) *
                                                  0.001),
                                          Row(
                                            children: [
                                              const Icon(Icons.location_on,
                                                  size: 18),
                                              Text(
                                                'new Delhi, 110090',
                                                style: commonTextStyle12(
                                                    color: black),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                              height: ResponsiveHelper.height(
                                                      context) *
                                                  0.005),
                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                      Icons.calendar_month,
                                                      size: 18),
                                                  SizedBox(
                                                      width: ResponsiveHelper
                                                              .width(context) *
                                                          0.005),
                                                  Text(
                                                    '16 aug 2023',
                                                    style: commonTextStyle12(
                                                        color: black),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                  width:
                                                      ResponsiveHelper.height(
                                                              context) *
                                                          0.02),
                                              Row(
                                                children: [
                                                  const Icon(Icons.access_time,
                                                      size: 18),
                                                  SizedBox(
                                                      width: ResponsiveHelper
                                                              .width(context) *
                                                          0.005),
                                                  Text(
                                                    '16 aug 2023',
                                                    style: commonTextStyle12(
                                                        color: black),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 15),
                              ],
                            ),
                          )),
                        );
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
