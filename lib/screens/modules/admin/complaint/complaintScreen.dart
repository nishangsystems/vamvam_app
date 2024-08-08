import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/providers/addComplaintProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/screens/modules/admin/complaint/complaintDetailScreen.dart';
import 'package:vam_vam/utils/apiConstant.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/imageResources.dart';
import '../../../../utils/paddingConstant.dart';
import '../../../../widgets/commonWidgets/commonWidgets.dart';

class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddComplaintProvider>(
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
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(PaddingConstant.m),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),

                    // Top Row
                    Row(
                      children: [
                        commonBackButton(
                            context: context,
                            title: 'Complaints',
                            backBtnColor: white),
                      ],
                    ),
                    // const SizedBox(width: 10),
                    // const Text("Complaints",
                    //     style: TextStyle(
                    //       fontSize: 17,
                    //       color: white,
                    //       fontWeight: FontWeight.w500,
                    //     )),

                    const SizedBox(
                      height: 20,
                    ),

                    // Grid Section
                    gridSec(context, data)
                  ],
                ),
              ),
            )),
          )),
    );
  }

  Widget gridSec(BuildContext context, AddComplaintProvider data) {
    int pendingCount = 0;
    // int assignedCount = 0;
    int reOpenCount = 0;
    int inProcessCount = 0;
    int resolvedCount = 0;
    int cancelledCount = 0;
    if (data.leaderComplaintList.isNotEmpty) {
      for (var item in data.leaderComplaintList) {
        if (item.statusString == pending) {
          pendingCount++;
        }
        //  else if (item.statusString == assigned) {
        //   assignedCount++;
        // }
        else if (item.statusString == reopened) {
          reOpenCount++;
        } else if (item.statusString == inProgress) {
          inProcessCount++;
        } else if (item.statusString == resolved) {
          resolvedCount++;
        } else if (item.statusString == cancelled) {
          cancelledCount++;
        }
      }
    }
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 5),
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
              iconNo: '1',
              title: 'Total (${data.leaderComplaintList.length})',
              colors: [white, white],
              onTap: () => navPush(
                  context: context, title: 'Total', data: data, subtitle: '')),
          gridItem(
              iconNo: '4',
              title: 'Pending ($pendingCount)',
              colors: [white, white],
              onTap: () => navPush(
                  context: context,
                  title: 'Pending',
                  data: data,
                  subtitle: pending)),
          // gridItem(
          //     iconNo: '3',
          //     title: 'Assigned',
          //     colors: [white, white],
          //     onTap: () => navPush(
          //         context: context,
          //         title: 'Assigned',
          //         data: data,
          //         subtitle: assigned)),
          gridItem(
              iconNo: '3',
              title: 'In-Process ($inProcessCount)',
              colors: [white, white],
              onTap: () => navPush(
                  context: context,
                  title: 'In-Process',
                  data: data,
                  subtitle: inProgress)),
          gridItem(
              iconNo: '3',
              title: 'Reopen ($reOpenCount)',
              colors: [white, white],
              onTap: () => navPush(
                  context: context,
                  title: 'Reopen',
                  data: data,
                  subtitle: reopened)),
          gridItem(
              iconNo: '2',
              title: 'Resolved ($resolvedCount)',
              colors: [white, white],
              onTap: () => navPush(
                  context: context,
                  title: 'Resolved',
                  data: data,
                  subtitle: resolved)),

          gridItem(
              iconNo: '5',
              title: 'Cancelled ($cancelledCount)',
              colors: [white, white],
              onTap: () => navPush(
                  context: context,
                  title: 'Cancelled',
                  data: data,
                  subtitle: cancelled)),
          // gridItem(
          //     iconNo: '6',
          //     title: 'Others',
          //     colors: [white, white],
          //     onTap: () =>
          //         navPush(context: context, title: 'Others', data: data)),
        ],
      ),
    );
  }

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
                    'assets/images/complaintsIcon$iconNo.png',
                    height: 50,
                    width: 50,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(title,
                  style: const TextStyle(
                      color: black, fontWeight: FontWeight.w500, fontSize: 14))
            ],
          ),
        ),
      );

  navPush(
      {required BuildContext context,
      required String title,
      required AddComplaintProvider data,
      required String subtitle}) {
    data.leaderGetComplaint(status: subtitle).then((value) {
      if (value.isSuccess) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ComplaintDetailScreen(
                      title: title,
                    ))).then((value) {
          data.leaderGetComplaint(status: '');
        });
      } else {
        errorToast(msg: value.message);
      }
    });
  }
}
