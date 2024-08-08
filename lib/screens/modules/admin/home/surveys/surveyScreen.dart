// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/profileprovider.dart';
import 'package:vam_vam/providers/surveyProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';

import '../../../../../helpers/commonHelper.dart';
import '../../../../../helpers/responsiveHelper.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/imageResources.dart';
import '../../../../../utils/paddingConstant.dart';
import '../../../../../widgets/commonWidgets/commonWidgets.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  var selectIndex = -1;
  int _totalCount = 0;
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      var surveyProvider = Provider.of<SurveyProvider>(context, listen: false);
      var auth = Provider.of<AuthProvider>(context, listen: false);
      surveyProvider.getSurvey(auth.getUserId(), context).then((value) {
        if (!value.isSuccess) {
          // null
          errorToast(msg: value.message);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<SurveyProvider, AuthProvider, ProfileProvider>(
        builder: (context, survey, auth, profile, child) {
      if (survey.surveyData.question != null && _totalCount == 0) {
        for (var element in survey.surveyData.optionData!) {
          _totalCount += int.parse('${element.ansCount}');
        }
      }
      return LoadingOverlay(
        isLoading: survey.isLoading,
        child: Scaffold(
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
                        const Text('Survey',
                            style: TextStyle(
                              fontSize: 16,
                              color: white,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                    SizedBox(height: ResponsiveHelper.height(context) * 0.03),
                    survey.surveyData.question != null &&
                            survey.surveyData.question!.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10, top: 10),
                                child: Text(
                                    'Q. '
                                    '${survey.surveyData.question}',
                                    style: TextStyle(
                                        color: white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                              ),
                              ListView.builder(
                                  itemCount:
                                      survey.surveyData.optionData!.length,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int optionIndex) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectIndex = optionIndex;
                                          });
                                          if (profile.userProfileInfo
                                                  .isProfileComplete ==
                                              '1') {
                                            survey
                                                .submitSurvey(
                                                    auth.getUserId(),
                                                    '${survey.surveyData.id}',
                                                    '${survey.surveyData.optionData![optionIndex].id}',
                                                    context)
                                                .then((value) {
                                              if (value.isSuccess) {
                                                errorToast(
                                                  msg: value.message,
                                                );
                                              } else {
                                                errorToast(
                                                  msg: value.message,
                                                );
                                              }
                                            });
                                          } else {
                                            showProfileSnackbar(
                                                context: context,
                                                bottomMargin:
                                                    ResponsiveHelper.height(
                                                            context) *
                                                        0.85);
                                          }
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            survey.surveyData.isAttempt == '0'
                                                ? Container(
                                                    height: 17,
                                                    width: 17,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        gradient: LinearGradient(
                                                            colors: [
                                                              Colors.white,
                                                              Colors.white70
                                                            ],
                                                            begin: Alignment
                                                                .topCenter,
                                                            end: Alignment
                                                                .bottomCenter)),
                                                    child: Center(
                                                        child: selectIndex ==
                                                                optionIndex
                                                            ? Icon(
                                                                Icons.check,
                                                                color:
                                                                    Colors.blue,
                                                                size: 18,
                                                              )
                                                            : SizedBox
                                                                .shrink()),
                                                  )
                                                : SizedBox.shrink(),
                                            const SizedBox(width: 10),
                                            survey.surveyData.isAttempt != '0'
                                                ? Container(
                                                    width:
                                                        ResponsiveHelper.width(
                                                                context) *
                                                            0.8,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12,
                                                            vertical: 5),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: white
                                                            .withOpacity(0.1)),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                            '${survey.surveyData.optionData![optionIndex].option}',
                                                            style: TextStyle(
                                                                color: white,
                                                                fontSize: 12)),
                                                        Text(
                                                            survey
                                                                        .surveyData
                                                                        .optionData![
                                                                            optionIndex]
                                                                        .ansCount !=
                                                                    '0'
                                                                ? getPercantage(
                                                                    '${survey.surveyData.optionData![optionIndex].ansCount}',
                                                                    '$_totalCount')
                                                                : '0 %',
                                                            style: TextStyle(
                                                                color: white,
                                                                fontSize: 12)),
                                                      ],
                                                    ),
                                                  )
                                                : Text(
                                                    '${survey.surveyData.optionData![optionIndex].option}',
                                                    style: TextStyle(
                                                        color: white,
                                                        fontSize: 12))
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ],
                          )
                        : Padding(
                            padding: EdgeInsets.only(
                                top: ResponsiveHelper.height(context) * 0.25),
                            child: Center(
                                child: Text(
                              'No Survey Found!',
                              style: TextStyle(
                                  color: white.withOpacity(0.8),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500),
                            )),
                          )
                  ],
                ),
              )),
            )),
      );
    });
  }

  String getPercantage(String value, String totalValue) {
    double result = ((int.parse(value) / int.parse(totalValue)) * 100);

    return '${double.parse(result.toStringAsFixed(1))} %';
  }
}
