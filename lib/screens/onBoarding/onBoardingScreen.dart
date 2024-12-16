import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onboarding/onboarding.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/helpers/enumHelper.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/providers/onBoardingProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/utils/fontConstant.dart';
import 'package:vam_vam/widgets/commonWidgets/commonWidgets.dart';

import '../../utils/colors.dart';
import '../../utils/constant.dart';
import '../../utils/imageResources.dart';
import '../../utils/stringResources.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late Material materialButton;
  Material _skipButton(
      {void Function(int)? setIndex, required BuildContext context}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: defaultSkipButtonColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            Provider.of<OnBoardingProvider>(context, listen: false).setIndex(2);
          }
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  Widget get _signupButton {
    return Consumer<RoleProvider>(
      builder: (context, rol, child) => Material(
        borderRadius: defaultProceedButtonBorderRadius,
        color: primaryDark,
        child: InkWell(
          borderRadius: defaultProceedButtonBorderRadius,
          onTap: () {
            rol.saveOnboarding();
            context.go(role);
          },
          child: const Padding(
            padding: defaultProceedButtonPadding,
            child: Text(
              StringResources.continueText,
              style: defaultProceedButtonTextStyle,
            ),
          ),
        ),
      ),
    );
  }

  Widget indicator(bool isSelected) {
    return Container(
      height: isSelected ? 10 : 12,
      width: isSelected ? 110 : 12,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected
              ? primaryDark
              : primaryDark.withOpacity(0.2)),
    );
  }

  onboardingPagesList(BuildContext context) {
    return [
      PageModel(
        widget: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 0.0,
              color: Colors.white,
            ),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(180)),
                child: Image.asset(
                  ImageResources.onBoardingImg1,
                  height: ResponsiveHelper.height(context) - 402,
                  width: ResponsiveHelper.width(context),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ),
      ),
      PageModel(
        widget: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 0.0,
              color: Colors.white,
            ),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(180)),
                child: Image.asset(
                  ImageResources.onBoardingImg2,
                  height: ResponsiveHelper.height(context) - 402,
                  width: ResponsiveHelper.width(context),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ),
      ),
      PageModel(
        widget: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 0.0,
              color: Colors.white,
            ),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(180)),
                child: Image.asset(
                  ImageResources.onBoardingImg3,
                  height: ResponsiveHelper.height(context) - 402,
                  width: ResponsiveHelper.width(context),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<OnBoardingProvider, RoleProvider>(
      builder: (context, data, rolePro, child) => SafeArea(
        child: Scaffold(
          backgroundColor: white,
          body: Onboarding(
            pages: onboardingPagesList(context),
            onPageChange: (int pageIndex) => data.setIndex(pageIndex),
            startPageIndex: data.index,
            footerBuilder: (context, dragDistance, pagesLength, setIndex) {
              return Container(
                height: 320,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        indicator(data.index == 0),
                        SizedBox(
                          width: 10,
                        ),
                        indicator(data.index == 1),
                        SizedBox(
                          width: 10,
                        ),
                        indicator(data.index == 2),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          data.index == 0
                              ? StringResources.onBoardingTitle1
                              : data.index == 1
                                  ? StringResources.onBoardingTitle2
                                  : StringResources.onBoardingTitle3,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              color: primaryDark,
                              fontWeight: FontWeight.w600,
                              fontSize: FontConstant.xl),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    commonButton(
                        bgColor: primaryDark,
                        width: width,
                        isBorder: false,
                        radius: 8,
                        onTap: () {
                          if (data.index == 2) {
                            rolePro.saveOnboarding();
                            rolePro.setRoleType(getRoleType(RoleEnum.student));
                            context.go(homeScreen);
                          } else {
                            data.setIndex(data.index + 1);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text('Continue',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: FontRes.primary,
                                  color: white)),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    commonButton(
                        bgColor:primaryDark,
                        width: width,
                        isBorder: true,
                        radius: 8,
                        onTap: () {
                          rolePro.saveOnboarding();
                          rolePro.setRoleType(getRoleType(RoleEnum.student));
                          context.go(homeScreen);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text('Login',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: FontRes.primary,
                                  color: primaryDark)),
                        )),
                  ],
                ),
              );

              //  DecoratedBox(
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     border: Border.all(
              //       width: 0.0,
              //       color: Colors.white,
              //     ),
              //   ),
              //   child: ColoredBox(
              //     color: Colors.white,
              //     child: Padding(
              //       padding: const EdgeInsets.all(45),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           CustomIndicator(
              //             netDragPercent: dragDistance,
              //             pagesLength: pagesLength,
              //             indicator: Indicator(
              //               activeIndicator:
              //                   const ActiveIndicator(color: Color(0xffC8C8C8)),
              //               closedIndicator:
              //                   const ClosedIndicator(color: orange),
              //               indicatorDesign: IndicatorDesign.line(
              //                 lineDesign: LineDesign(
              //                   // lineWidth: 40,
              //                   lineSpacer: 35,
              //                   lineType: DesignType.line_nonuniform,
              //                 ),
              //               ),
              //             ),
              //           ),
              //           data.index == pagesLength - 1
              //               ? _signupButton
              //               : _skipButton(setIndex: setIndex, context: context)
              //         ],
              //       ),
              //     ),
              //   ),
              // );
            },
          ),
        ),
      ),
    );
  }
}
