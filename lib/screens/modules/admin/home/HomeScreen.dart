import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/addComplaintProvider.dart';
import 'package:vam_vam/providers/appointmentProvider.dart';
import 'package:vam_vam/providers/approvalProvider.dart';
import 'package:vam_vam/providers/eventProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/providers/surveyProvider.dart';
import 'package:vam_vam/screens/modules/admin/home/reports/reportsScreen.dart';
import 'package:vam_vam/widgets/commonWidgets/commonWidgets.dart';

import '../../../../helpers/responsiveHelper.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/imageResources.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double carouselIndex = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryDark,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              // sliderSection,
              // commonSliderSection,
              SizedBox(
                height: 50,
              ),
              gridSec,
              // callIcon,
            ],
          ),
        )));
  }

  Widget get sliderSection => SizedBox(
        height: ResponsiveHelper.width(context) * 0.65,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            CarouselSlider.builder(
                itemCount: 4,
                options: CarouselOptions(
                  onPageChanged: (index, position) {
                    setState(() {
                      carouselIndex = index.toDouble();
                    });
                  },
                  viewportFraction: 1,
                  aspectRatio: 16 / 8,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                ),
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return Container(
                    height: 120,
                    width: ResponsiveHelper.width(context),
                    padding: EdgeInsets.all(14),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          ImageResources.bannerImage,
                          height: 150,
                          width: ResponsiveHelper.width(context),
                        )),
                  );
                }),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: CarouselIndicator(
                count: 4,
                activeColor: Colors.white,
                color: Colors.white.withOpacity(0.5),
                width: 20,
                height: 2,
                index: carouselIndex.toInt(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      );
  Widget get gridSec => Consumer6<SurveyProvider, AppointmentProvider,
          AddComplaintProvider, EventProvider, RoleProvider, AuthProvider>(
        builder: (context, survey, appointment, complaintPro, eventPro, rolePro,
                auth, child) =>
            Consumer<ApprovalProvider>(
          builder: (context, approval, child) => Container(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 10),
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.1),
              children: [
                // gridItem(
                //     iconNo: '7',
                //     title: 'Home',
                //     isColor: true,
                //     image: 'assets/icons/homeIcon7.png',
                //     colors: [const Color(0xffd5f09c), const Color(0xffffd953)],
                //     onTap: () {
                //       // if (auth.isLoggedIn()) {
                //       Navigator.of(context).push(MaterialPageRoute(
                //           builder: (context) => ParentHomeScreen()));
                //       // } else {
                //       //   warningToast(msg: 'Please Login!');
                //       // }
                //     }),
                gridItem(
                    iconNo: '1',
                    title: 'Meeting & Appointment',
                    image: ImageResources.adminMyCalendarImg,
                    colors: [const Color(0xfff4b947), const Color(0xfffec6b4)],
                    onTap: () {
                      if (auth.isLoggedIn()) {
                        appointment
                            .leaderGetAppointment('today', auth.getUserId())
                            .then((value) {
                          if (!value.isSuccess &&
                              value.message == "Appointment Not Found!!") {
                            errorToast(msg: value.message);
                          }
                        });
                        context.push(calendar);
                      } else {
                        warningToast(msg: 'Please Login!');
                      }

                      // if (auth.isLoggedIn()) {
                      //   appointment.leaderGetAppointment(  ).then((value) {
                      //     if (!value.isSuccess) {
                      //       errorToast(msg: value.message);
                      //     }
                      //   });
                      //   context.push(calendar);
                      // } else {
                      //   warningToast(msg: 'Please Login!');
                      // }
                    }),
                gridItem(
                    iconNo: '2',
                    title: 'Complaints',
                    image: ImageResources.adminComplaintImg,
                    colors: [const Color(0xb7ffae80), const Color(0xb7ffae80)],
                    onTap: () {
                      if (auth.isLoggedIn()) {
                        complaintPro
                            .leaderGetComplaint(status: '')
                            .then((value) {
                          if (value.isSuccess) {
                          } else {
                            errorToast(msg: value.message);
                          }
                        });
                        context.push(complaint);
                      } else {
                        warningToast(msg: 'Please Login!');
                      }
                    }),
                gridItem(
                    iconNo: '3',
                    title: 'Approvals',
                    image: 'assets/icons/homeIcon3.png',
                    colors: [const Color(0xff4ecc97), const Color(0xffddf484)],
                    onTap: () {
                      if (auth.isLoggedIn()) {
                        approval
                            .getRequestApproval(
                                status: '',
                                filterBy: 'today',
                                executiveId: auth.getUserId(),
                                roleType: rolePro.roleType)
                            .then((value) {
                          if (!value.isSuccess) {
                            errorToast(msg: value.message);
                          }
                        });
                        context.push(reqApproval);
                      } else {
                        warningToast(msg: 'Please Login!');
                      }
                    }),
                gridItem(
                    iconNo: '4',
                    title: 'Events',
                    image: 'assets/icons/homeIcon5.png',
                    colors: [const Color(0xffd5f09c), const Color(0xffffd953)],
                    onTap: () {
                      if (auth.isLoggedIn()) {
                        // eventPro
                        //     .getEvents('today', rolePro.roleType)
                        //     .then((value) {
                        //   if (!value.isSuccess) {
                        //     errorToast(msg: value.message);
                        //   }
                        // });
                        context.push(adminEvent);
                      } else {
                        warningToast(msg: 'Please Login!');
                      }
                    }),
                gridItem(
                    iconNo: '5',
                    image: ImageResources.adminSurveyImg,
                    title: 'Survey',
                    colors: [const Color(0xffc5a4fc), const Color(0xfff4ef84)],
                    onTap: () {
                      if (auth.isLoggedIn()) {
                        survey.leaderGetSurvey(context).then((value) {
                          if (!value.isSuccess) {
                            errorToast(msg: value.message);
                          }
                        });
                        context.push(allSurvey);
                      } else {
                        warningToast(msg: 'Please Login!');
                      }
                    }),
                gridItem(
                    iconNo: '6',
                    title: 'Reports',
                    image: ImageResources.adminReportImg,
                    colors: [const Color(0xff57cce6), const Color(0xffff8a66)],
                    onTap: () {
                      if (auth.isLoggedIn()) {
                        complaintPro
                            .leaderGetComplaint(status: '')
                            .then((value) {
                          if (value.isSuccess) {
                          } else {
                            errorToast(msg: value.message);
                          }
                        });

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ReportsScreen()));
                      } else {
                        warningToast(msg: 'Please Login!');
                      }
                    }),
              ],
            ),
          ),
        ),
      );

  Widget gridItem(
          {required String iconNo,
          required String title,
          required List<Color> colors,
          required String image,
          required VoidCallback onTap,
          bool isColor = false}) =>
      Bounce(
        duration: const Duration(milliseconds: 100),
        onPressed: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: powderPink,
              borderRadius: BorderRadius.circular(17),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: colors)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isColor
                  ? Image.asset(
                      // 'assets/icons/homeIcon$iconNo.png',
                      image,
                      height: 60,
                      width: 60,
                      color: Color(0xff2d3852))
                  : Image.asset(
                      // 'assets/icons/homeIcon$iconNo.png',
                      image,
                      height: 60,
                      width: 60,
                    ),
              const SizedBox(
                height: 10,
              ),
              Text(title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: black, fontWeight: FontWeight.w500, fontSize: 14))
            ],
          ),
        ),
      );
}

Widget get callIcon => Padding(
      padding: const EdgeInsets.only(top: 10, right: 16, bottom: 10),
      child: Align(
        alignment: Alignment.topRight,
        child: Image.asset(
          "assets/icons/homeCall.png",
          width: 43,
          height: 43,
        ),
      ),
    );
