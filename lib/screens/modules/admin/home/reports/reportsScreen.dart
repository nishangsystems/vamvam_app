import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/utils/apiConstant.dart';

import '../../../../../providers/addComplaintProvider.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/imageResources.dart';
import '../../../../../utils/paddingConstant.dart';
import '../../../../../widgets/commonWidgets/commonWidgets.dart';
import '../../../../loader/loaderOverlay.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
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
                            context: context, title: '', backBtnColor: white),
                        const SizedBox(width: 10),
                        const Text("Reports",
                            style: TextStyle(
                              fontSize: 17,
                              color: white,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),

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
          ),
          gridItem(
            iconNo: '4',
            title: 'Pending ($pendingCount)',
            colors: [white, white],
          ),
          // gridItem(
          //   iconNo: '3',
          //   title: 'Assigned ($assignedCount)',
          //   colors: [white, white],
          // ),
          gridItem(
            iconNo: '3',
            title: 'In-Process ($inProcessCount)',
            colors: [white, white],
          ),
          gridItem(
            iconNo: '3',
            title: 'Reopen ($reOpenCount)',
            colors: [white, white],
          ),
          gridItem(
            iconNo: '2',
            title: 'Resolved ($resolvedCount)',
            colors: [white, white],
          ),

          gridItem(
            iconNo: '5',
            title: 'Cancelled ($cancelledCount)',
            colors: [white, white],
          ),
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
          required List<Color> colors}) =>
      Container(
        decoration: BoxDecoration(
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
      );
}
