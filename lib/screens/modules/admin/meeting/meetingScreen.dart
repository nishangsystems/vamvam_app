import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/fontConstant.dart';
import '../../../../utils/imageResources.dart';
import '../../../../utils/paddingConstant.dart';
import '../../../../widgets/commonWidgets/commonWidgets.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({super.key});

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
            child: Padding(
          padding: const EdgeInsets.all(PaddingConstant.m),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),

              // Top Row
              topRow,

              const SizedBox(
                height: 20,
              ),

              // Meeting Box
              meetingBox
            ],
          ),
        )));
  }

  Widget get topRow => const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Meetings.',
            style: TextStyle(
                fontSize: FontConstant.l,
                fontWeight: FontWeight.w600,
                color: white),
          ),
        ],
      );

  Widget get meetingBox => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: const Color(0xffF7F4F4)),
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(5)),
                  margin:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                  padding: const EdgeInsets.all(6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: true, onChanged: (value) {}),
                          const Text(
                            'Meeting With Worker',
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: PaddingConstant.s, vertical: 6),
                          color: primaryDark,
                          child: const Text(
                            '04:00 PM',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: FontConstant.s,
                              fontWeight: FontWeight.w400,
                              height: 1.22,
                              letterSpacing: 0.70,
                            ),
                          )),
                    ],
                  ),
                )),
      );
}
