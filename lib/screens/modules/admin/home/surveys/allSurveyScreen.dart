import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/providers/surveyProvider.dart';
import 'package:vam_vam/utils/colors.dart';
import 'package:vam_vam/utils/constant.dart';
import 'package:vam_vam/utils/fontConstant.dart';
import 'package:vam_vam/utils/imageResources.dart';
import 'package:vam_vam/widgets/commonWidgets/commonWidgets.dart';

class AllSurveyScreen extends StatefulWidget {
  const AllSurveyScreen({super.key});

  @override
  State<AllSurveyScreen> createState() => _AllSurveyScreenState();
}

class _AllSurveyScreenState extends State<AllSurveyScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SurveyProvider>(
      builder: (context, data, child) => Scaffold(
        backgroundColor: primaryDark,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(appBarHeight),
            child: homeAppbar(
                context: context,
                profileImage: ImageResources.profileImage,
                name: 'deepak',
                location: 'H 106')),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => context.pop(),
                        child: Icon(
                          Icons.arrow_back,
                          color: white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'All Survey (${data.leaderSurveyList.length})',
                        style: TextStyle(
                            fontSize: FontConstant.l,
                            fontWeight: FontWeight.w600,
                            color: white),
                      ),
                    ],
                  ),
                  Bounce(
                    duration: Duration(milliseconds: 100),
                    onPressed: () => context.push(addSurveyScreen),
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: white),
                      child: Icon(
                        Icons.add,
                        size: 18,
                        color: primaryDark,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.leaderSurveyList.length,
                      itemBuilder: (context, index) {
                        var item = data.leaderSurveyList[index];
                        int totalCount = 0;
                        if (data.leaderSurveyList[index].optionData != null) {
                          for (var element
                              in data.leaderSurveyList[index].optionData!) {
                            totalCount +=
                                int.parse(element.ansCount.toString());
                          }
                        }
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Q${index + 1}. ${item.question}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Total: $totalCount',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Options - ",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: item.optionData!.length * 25,
                                width: ResponsiveHelper.width(context),
                                child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: item.optionData!.length,
                                    itemBuilder: (context, i) => Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '(${i + 1}).    ${item.optionData![i].option}',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Text(
                                                ' ${item.optionData![i].ansCount}',
                                                style: TextStyle(fontSize: 10),
                                              )
                                            ],
                                          ),
                                        )),
                              )
                            ],
                          ),
                        );
                      })),
              if (!data.isLoading && data.leaderSurveyList.isEmpty) ...[
                Padding(
                  padding: EdgeInsets.only(
                      top: ResponsiveHelper.height(context) * 0.3),
                  child: Center(
                    child: Text(
                      'No Survey Found!',
                      style: TextStyle(
                          color: white.withOpacity(0.8),
                          fontSize: FontConstant.xxl,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
