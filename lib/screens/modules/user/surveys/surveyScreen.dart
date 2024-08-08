import 'package:flutter/material.dart';

import '../../../../helpers/responsiveHelper.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/imageResources.dart';
import '../../../../utils/paddingConstant.dart';
import '../../../../widgets/commonWidgets/commonWidgets.dart';
import '../../../../widgets/commonWidgets/textStyle.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  var selectIndex = -1;
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
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.only(
                left: PaddingConstant.l,
                right: PaddingConstant.l,
                top: PaddingConstant.xxl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ResponsiveHelper.height(context) * 0.01),
                Row(
                  children: [
                    commonBackButton(
                        context: context, title: '', backBtnColor: white),
                    const SizedBox(width: 10),
                    const Text('Survey ',
                        style: TextStyle(
                          fontSize: 17,
                          color: white,
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
                SizedBox(height: ResponsiveHelper.height(context) * 0.03),
                ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child: Text(
                                'Q.'
                                '$index'
                                ' How satisfied are you with the outcome of your complaint?',
                                style: commonTextStyle14(color: white)),
                          ),
                          const SizedBox(height: 10),
                          ListView.builder(
                              itemCount: 5,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder:
                                  (BuildContext context, int optionIndex) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectIndex = optionIndex;
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            selectIndex == optionIndex
                                                ? const Icon(
                                                    Icons.radio_button_on,
                                                    color: white)
                                                : const Icon(
                                                    Icons.radio_button_off,
                                                    color: white),
                                            const SizedBox(width: 10),
                                            Text('Very satisfied',
                                                style: commonTextStyle13(
                                                    color: white)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ],
                      );
                    }),
                SizedBox(height: ResponsiveHelper.height(context) * 0.08),
                commonButtonWhite(
                    width: double.infinity,
                    bgColors: [Colors.red, Colors.red],
                    title: 'Submit',
                    txtColor: white,
                    fontSize: 12,
                    onTap: () {}),
              ],
            ),
          )),
        ));
  }
}
