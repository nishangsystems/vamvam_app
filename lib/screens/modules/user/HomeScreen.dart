import 'package:vam_vam/screens/modules/user/fee/FeeScreen.dart';
import 'package:vam_vam/screens/modules/user/results/ResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/HomeProvider.dart';
import 'package:vam_vam/providers/addComplaintProvider.dart';
import 'package:vam_vam/providers/appointmentProvider.dart';
import 'package:vam_vam/providers/eventProvider.dart';
import 'package:vam_vam/providers/profileprovider.dart';
import 'package:vam_vam/providers/registerProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/providers/surveyProvider.dart';
import 'package:vam_vam/utils/colors.dart';
import 'package:vam_vam/widgets/commonWidgets/sliderWidget.dart';
import '../../../helpers/commonHelper.dart';
import '../../../utils/constant.dart';
import '../../../widgets/commonWidgets/commonWidgets.dart';
import 'course/courseScreen.dart';
import 'faq/FaqScreen.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              commonSliderSection,
              gridSec,
              // callIcon,
            ],
          ),
        ));
  }

  Widget get gridSec => Consumer6<ProfileProvider, HomeProvider, AuthProvider,
          RegisterProvider, SurveyProvider, RoleProvider>(
        builder: (context, profile, home, auth, register, surveyProvider, role,
                child) =>
            Consumer3<AddComplaintProvider, EventProvider, AppointmentProvider>(
          builder: (context, complaint, eventPro, appointment, child) =>
              Container(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
            child: GridView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              padding:
                  EdgeInsets.only(top: ResponsiveHelper.height(context) * 0.02),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.1),
              children: [
                // implementing vam_vam 14-05-2024
                gridItem(
                    iconNo: '7',
                    title: 'Courses',
                    colors: [
                      const Color(0xffe7ad9b).withOpacity(0.40),
                      const Color(0xffd54a25).withOpacity(0.40)
                    ],
                    //   colors: [const Color(0xff0875C7), const Color(0xff0875C7)],

                    onTap: () {
                      if (auth.isLoggedIn()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CourseScreen()));
                      } else {
                        errorToast(msg: 'Please login');
                      }
                    }),

                gridItem(
                    iconNo: '8',
                    title: 'Results',
                    colors: [
                      const Color(0xffafd1dc).withOpacity(0.4),
                      const Color(0xff7dd0e6).withOpacity(0.9)
                    ],
                    onTap: () {
                      if (auth.isLoggedIn()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ResultScreen()));
                      } else {
                        errorToast(msg: 'Please login');
                      }
                    }),
                gridItem(
                    iconNo: '9',
                    title: 'Fees',
                    colors: [
                      const Color(0xffD52222).withOpacity(0.8),
                      const Color(0xffD52222).withOpacity(0.8)
                    ],
                    //colors: [const Color(0xff0875C7), const Color(0xff0875C7)],

                    onTap: () {
                      if (auth.isLoggedIn()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FeeScreen()));
                      } else {
                        errorToast(msg: 'Please login');
                      }

                      // if (auth.isLoggedIn()) {
                      //   Provider.of<AddComplaintProvider>(context,
                      //       listen: false)
                      //       .getDepartment();
                      //   context.push(addComplain);
                      // } else {
                      //   errorToast(msg: 'Please login');
                      // }
                    }),

                gridItem(
                    iconNo: '10',
                    title: 'FAQ\'s',
                    colors: [
                      const Color(0xffFF985B).withOpacity(0.8),
                      const Color(0xffFF985B).withOpacity(0.8)
                    ],
                    // colors: [const Color(0xff0875C7), const Color(0xff0875C7)],

                    onTap: () {
                      if (auth.isLoggedIn()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FaqScreen()));
                      } else {
                        errorToast(msg: 'Please login');
                      }
                    }),

                gridItem(
                    iconNo: '1',
                    title: 'Add Complaint',
                    colors: [const Color(0xfff4b947), const Color(0xfffec6b4)],
                    //colors: [const Color(0xff0875C7), const Color(0xff0875C7)],

                    onTap: () {
                      if (auth.isLoggedIn()) {
                        Provider.of<AddComplaintProvider>(context,
                                listen: false)
                            .getDepartment();
                        context.push(addComplain);
                      } else {
                        errorToast(msg: 'Please login');
                      }
                    }),
                gridItem(
                    iconNo: '2',
                    title: 'Complaint Status',
                    colors: [const Color(0xb7ffae80), const Color(0xb7ffae80)],
                    //colors: [const Color(0xff0875C7), const Color(0xff0875C7)],

                    onTap: () {
                      if (auth.isLoggedIn()) {
                        context.push(userComplaintStatus);
                      } else {
                        errorToast(msg: 'Please login');
                      }
                    }),
                gridItem(
                    iconNo: '3',
                    title: 'My Profile',
                    colors: [const Color(0xff4ecc97), const Color(0xffddf484)],
                    // colors: [const Color(0xff0875C7), const Color(0xff0875C7)],

                    onTap: () {
                      if (auth.isLoggedIn() && !auth.isSkip) {
                        home.startLoader(true);
                        profile
                            .getProfile(auth.getUserId(), register,
                                role.roleType, context)
                            .then((value) {
                          home.startLoader(false);
                          if (value.isSuccess) {
                            if (profile.userProfileInfo.isProfileComplete ==
                                '1') {
                              context.push(profileDetails);
                            } else {
                              showProfileSnackbar(
                                  context: context,
                                  bottomMargin:
                                      ResponsiveHelper.height(context) * 0.85);
                              context.push(profileDetails);
                            }
                          } else {
                            errorToast(msg: value.message);
                          }
                        });
                      } else {
                        errorToast(msg: 'Please login');
                      }
                    }),
                gridItem(
                    iconNo: '4',
                    title: 'Book an Appointment',
                    colors: [const Color(0xffd5f09c), const Color(0xffffd953)],
                    //colors: [const Color(0xff0875C7), const Color(0xff0875C7)],

                    onTap: () {
                      if (auth.isLoggedIn() && !auth.isSkip) {
                        context.push(calendar);
                      } else {
                        warningToast(msg: 'Please Login!');
                      }
                    }),
                gridItem(
                    iconNo: '5',
                    title: 'Events',
                    colors: [const Color(0xffc5a4fc), const Color(0xfff4ef84)],
                    //colors: [const Color(0xff0875C7), const Color(0xff0875C7)],

                    onTap: () {
                      if (auth.isLoggedIn() && !auth.isSkip) {
                        context.push(adminEvent);
                      } else {
                        warningToast(msg: 'Please Login!');
                      }
                    }),
                gridItem(
                    iconNo: '6',
                    title: 'Survey',
                    colors: [const Color(0xff57cce6), const Color(0xffff8a66)],
                    //colors: [const Color(0xff0875C7), const Color(0xff0875C7)],

                    onTap: () {
                      if (auth.isLoggedIn() && !auth.isSkip) {
                        // home.startLoader(true);
                        // surveyProvider
                        //     .getSurvey(auth.getUserId())
                        //     .then((value) {
                        //   if (value.isSuccess) {
                        //     // null
                        //   } else {
                        //     errorToast(msg: value.message);
                        //   }
                        //   home.startLoader(false);
                        //   context.push(survey);
                        // });
                        context.push(survey);
                      } else {
                        errorToast(msg: 'Please login');
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
          required VoidCallback onTap}) =>
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
              Stack(
                children: [
                  Image.asset(
                    'assets/icons/homeIcon$iconNo.png',
                    height: 60,
                    width: 60,
                    // color:iconNo.toString()!='4' ?Colors.white,
                    //  ,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12))
            ],
          ),
        ),
      );
}

// Widget get callIcon => Padding(
//       padding: const EdgeInsets.only(top: 10, right: 16, bottom: 10),
//       child: Align(
//         alignment: Alignment.topRight,
//         child: Image.asset(
//           "assets/icons/homeCall.png",
//           width: 43,
//           height: 43,
//         ),
//       ),
//     );
