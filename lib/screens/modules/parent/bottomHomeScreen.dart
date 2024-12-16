import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/appointmentProvider.dart';
import 'package:vam_vam/providers/approvalProvider.dart';
import 'package:vam_vam/providers/eventProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/screens/modules/admin/vamVam/home/parentHomeScreen.dart';
import 'package:vam_vam/utils/imageResources.dart';
import 'package:vam_vam/widgets/commonWidgets/commonWidgets.dart';

import '../../../providers/addComplaintProvider.dart';
import '../../../providers/surveyProvider.dart';
import '../../../utils/colors.dart';
import '../../../utils/constant.dart';

class ParentBottomHomeScreen extends StatelessWidget {
  const ParentBottomHomeScreen({super.key});

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
                gridItem(
                    iconNo: '7',
                    title: 'My Children',
                    isColor: true,
                    image: 'assets/icons/homeIcon7.png',
                    onTap: () {
                      // if (auth.isLoggedIn()) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ParentHomeScreen()));
                      // } else {
                      //   warningToast(msg: 'Please Login!');
                      // }
                    }),
                // gridItem(
                //     iconNo: '4',
                //     title: 'Events',
                //     image: 'assets/icons/homeIcon5.png',
                //     onTap: () {
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
              ],
            ),
          ),
        ),
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
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(17)),
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
