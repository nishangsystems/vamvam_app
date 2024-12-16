import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/HomeProvider.dart';
import 'package:vam_vam/providers/addComplaintProvider.dart';
import 'package:vam_vam/providers/appointmentProvider.dart';
import 'package:vam_vam/providers/approvalProvider.dart';
import 'package:vam_vam/providers/eventProvider.dart';
import 'package:vam_vam/providers/profileprovider.dart';
import 'package:vam_vam/providers/registerProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/providers/toDoProvider.dart';
import 'package:vam_vam/screens/modules/representative/vamVam/home/teacherHomeScreen.dart';
import 'package:vam_vam/widgets/commonWidgets/commonWidgets.dart';
import 'package:vam_vam/widgets/commonWidgets/sliderWidget.dart';
import '../../../utils/colors.dart';
import '../../../utils/constant.dart';
import '../../../utils/imageResources.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double carouselIndex = 0.0;

  @override
  void initState() {
    var home = Provider.of<HomeProvider>(context, listen: false);
    var profile = Provider.of<ProfileProvider>(context, listen: false);
    var register = Provider.of<RegisterProvider>(context, listen: false);
    var role = Provider.of<RoleProvider>(context, listen: false);
    var auth = Provider.of<AuthProvider>(context, listen: false);

    profile
        .getProfile(auth.getUserId(), register, role.roleType, context)
        .then((value) => home.startLoader(false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              commonSliderSection,
              gridSec,
            ],
          ),
        )));
  }

  Widget get gridSec => Consumer6<HomeProvider, AddComplaintProvider,
          AuthProvider, AppointmentProvider, EventProvider, RoleProvider>(
        builder: (context, home, complaint, auth, appointment, eventPro,
                rolePro, child){


          return Consumer4<ToDoProvider, ApprovalProvider, ProfileProvider,
              RegisterProvider>(
            builder: (context, todo, approval, profilePro, registerPro, child){
              return Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
                child: GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1.1),
                  children: [
                    gridItem(
                        iconNo: '7',
                        title: 'Courses',
                        isColor: true,
                        image: 'assets/icons/homeIcon7.png',
                        onTap: () {
                          // if (auth.isLoggedIn()) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TeacherHomeScreen()));
                          // } else {
                          //   warningToast(msg: 'Please Login!');
                          // }
                        }),
                    // gridItem(
                    //     iconNo: '1',
                    //     title: 'View Complaint',
                    //     image: 'assets/icons/homeIcon1.png',
                    //     onTap: () {
                    //       if (auth.isLoggedIn()) {
                    //         home.startLoader(true);
                    //         complaint
                    //             .getRepComplaints(auth.getUserId(), 'today')
                    //             .then((value) {
                    //           home.startLoader(false);
                    //           context.push(represantativeComplaintStatus);
                    //           if (!value.isSuccess) {
                    //             errorToast(msg: value.message);
                    //           }
                    //         });
                    //       } else {
                    //         errorToast(msg: 'Please login');
                    //       }
                    //     }),
                    gridItem(
                        iconNo: '2',
                        title: 'Profile',
                        image: 'assets/icons/homeIcon3.png',
                        onTap: () {
                          if (auth.isLoggedIn()) {
                            home.startLoader(true);
                            profilePro
                                .getProfile(auth.getUserId(), registerPro,
                                rolePro.roleType, context)
                                .then((value) {
                              home.startLoader(false);
                              if (value.isSuccess) {
                                context.push(profileDetails);
                              } else {
                                customToast(msg: value.message, color: errorColor);
                              }
                            });
                          } else {
                            errorToast(msg: 'Please login');
                          }
                        }),
                    // gridItem(
                    //     iconNo: '3',
                    //     title: 'Request For\nApprovals',
                    //     image: 'assets/icons/homeIcon3.png',
                    //     onTap: () {
                    //       // context.push(reqApproval);
                    //       if (auth.isLoggedIn()) {
                    //         approval
                    //             .getRequestApproval(
                    //                 status: '',
                    //                 filterBy: 'today',
                    //                 executiveId: auth.getUserId(),
                    //                 roleType: rolePro.roleType)
                    //             .then((value) {
                    //           if (!value.isSuccess &&
                    //               value.message != 'Approval Request Not Found!!') {
                    //             errorToast(msg: value.message);
                    //           }
                    //         });
                    //         context.push(reqApproval);
                    //       } else {
                    //         warningToast(msg: 'Please Login!');
                    //       }
                    //     }),
                    // gridItem(
                    //     iconNo: '4',
                    //     title: 'Book an\nappointment',
                    //     image: 'assets/icons/homeIcon4.png',
                    //     onTap: () {
                    //       // if (appointment.repAppointmentList.isNotEmpty) {
                    //       if (auth.isLoggedIn()) {
                    //         appointment
                    //             .repGetAppointment('today', auth.getUserId())
                    //             .then((value) {
                    //           if (!value.isSuccess &&
                    //               value.message != 'Appointment Not Found!!') {
                    //             errorToast(msg: value.message);
                    //           }
                    //         });
                    //         context.push(repcalendar);
                    //       } else {
                    //         warningToast(msg: 'Please Login!');
                    //       }
                    //     }
                    //     //  context.push(bookAppointment);
                    //     //warningToast(msg: 'Coming soon');
                    //     // }),
                    //     ),
                    // gridItem(
                    //     iconNo: '5',
                    //     title: 'Events',
                    //     image: 'assets/icons/homeIcon5.png',
                    //     onTap: () {
                    //       // context.push(represantativeEvent);
                    //       //  warningToast(msg: 'Coming soon');
                    //
                    //       if (auth.isLoggedIn()) {
                    //         // eventPro
                    //         //     .getEvents('today', rolePro.roleType)
                    //         //     .then((value) {
                    //         //   if (!value.isSuccess) {
                    //         //     errorToast(msg: value.message);
                    //         //   }
                    //         // });
                    //         context.push(adminEvent);
                    //       } else {
                    //         warningToast(msg: 'Please Login!');
                    //       }
                    //     }),
                    // gridItem(
                    //     iconNo: '6',
                    //     title: 'To-Do',
                    //     image: ImageResources.represantativeToDoImg,
                    //     onTap: () {
                    //       if (auth.isLoggedIn()) {
                    //         todo
                    //             .getToDo(
                    //                 executiveId: auth.getUserId(),
                    //                 filterDate:
                    //                     DateTime.now().toString().split(' ')[0])
                    //             .then((value) {
                    //           if (!value.isSuccess) {
                    //             errorToast(msg: value.message);
                    //           }
                    //         });
                    //         context.push(toDo);
                    //       } else {
                    //         warningToast(msg: 'Please Login!');
                    //       }
                    //     }),
                  ],
                ),
              );
            }

          );
        }


      );

  Widget gridItem(
          {required String iconNo,
          required String title,
          required String image,
          required VoidCallback onTap,
          bool isColor = false}) =>
      Bounce(
        duration: const Duration(milliseconds: 100),
        onPressed: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
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
                        )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: black, fontWeight: FontWeight.bold, fontSize: 12))
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
