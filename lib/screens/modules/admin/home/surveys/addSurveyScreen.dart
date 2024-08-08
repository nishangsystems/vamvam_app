import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/data/model/params/surveyModelParams.dart';
import 'package:vam_vam/helpers/regexHelper.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/providers/surveyProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/utils/colors.dart';
import 'package:vam_vam/utils/imageResources.dart';
import 'package:vam_vam/widgets/commonWidgets/commonWidgets.dart';
import 'package:vam_vam/widgets/commonWidgets/customTextFormField.dart';
import 'package:week_of_year/week_of_year.dart';

import '../../../../../utils/fontConstant.dart';

class AddSurveyScreen extends StatefulWidget {
  const AddSurveyScreen({super.key});

  @override
  State<AddSurveyScreen> createState() => _AddSurveyScreenState();
}

class _AddSurveyScreenState extends State<AddSurveyScreen> {
  final formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  final TextEditingController questionController = TextEditingController();
  final TextEditingController weekController = TextEditingController();
  List<TextEditingController> answerControllerList = [TextEditingController()];

  Future<void> selectWeek(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(selectedDate.year - 1),
      lastDate: DateTime(selectedDate.year + 1),
      selectableDayPredicate: (DateTime val) {
        return val.weekday == 5 || val.weekday == 6 ? false : true;
        // final int weekNumber = val.weekday;
        // return weekNumber == DateTime.monday;
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        weekController.text = "${picked.year}-W${picked.weekOfYear}";
      });
    }
  }

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
          body: LoadingOverlay(
            isLoading: data.isLoading,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                          'Add Survey',
                          style: TextStyle(
                              fontSize: FontConstant.l,
                              fontWeight: FontWeight.w600,
                              color: white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    customTextFormField5(
                        controller: questionController,
                        title: "Question",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: black,
                        length: 10000,
                        maxLines: null,
                        keyboardType: TextInputType.text,
                        textRegex: addressReg),
                    SizedBox(
                      height: 15,
                    ),
                    customTextFormField2(
                        controller: weekController,
                        title: "Select Week",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        onTap: () => selectWeek(context),
                        isRead: true,
                        color: black,
                        textRegex: addressReg),
                    SizedBox(
                      height: 20,
                    ),
                    Bounce(
                      duration: Duration(milliseconds: 100),
                      onPressed: () {
                        setState(() {
                          answerControllerList.add(TextEditingController());
                        });
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: white),
                            child: Icon(
                              Icons.add,
                              size: 16,
                              color: primaryDark,
                            ),
                          ),
                          Text(
                            'Add Answer',
                            style: TextStyle(
                                fontSize: FontConstant.m,
                                fontWeight: FontWeight.w600,
                                color: white),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: answerControllerList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  EdgeInsets.only(top: index == 0 ? 10 : 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width:
                                        ResponsiveHelper.width(context) * 0.8,
                                    child: customTextFormField2(
                                        controller: answerControllerList[index],
                                        title: 'Option ${index + 1}',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: black,
                                        keyboardType: TextInputType.text,
                                        textRegex: addressReg),
                                  ),
                                  SizedBox(
                                    width:
                                        ResponsiveHelper.width(context) * 0.05,
                                  ),
                                  if (index != 0) ...[
                                    Bounce(
                                      duration: Duration(milliseconds: 100),
                                      onPressed: () {
                                        setState(() {
                                          answerControllerList.removeAt(index);
                                        });
                                      },
                                      child: Icon(
                                        Icons.delete_rounded,
                                        size: ResponsiveHelper.width(context) *
                                            0.065,
                                        color: white,
                                      ),
                                    )
                                  ]
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Bounce(
            duration: Duration(milliseconds: 100),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                List<String> optionList = [];
                for (var element in answerControllerList) {
                  optionList.add(element.text.toString().trim());
                }
                SurveyModelParams surveyModelParams = SurveyModelParams(
                    question: questionController.text.toString().trim(),
                    weekDate: weekController.text.toString().trim(),
                    answer: optionList);
                data
                    .leaderStoreSurvey(surveyModelParams, context)
                    .then((value) {
                  if (value.isSuccess) {
                    data.leaderGetSurvey(context);
                    successToast(msg: value.message);
                    context.pop();
                  } else {
                    errorToast(msg: value.message);
                  }
                });
              }
            },
            child: Container(
              margin: EdgeInsets.all(16),
              height: 55,
              width: ResponsiveHelper.width(context) - 32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: white),
              child: Center(
                child: Text(
                  'Submit',
                  style: TextStyle(
                      color: black, fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          )),
    );
  }
}
