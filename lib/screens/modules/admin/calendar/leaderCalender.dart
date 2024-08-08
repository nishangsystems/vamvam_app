// ignore_for_file: avoid_print, unused_local_variable, unused_field
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vam_vam/helpers/dialogHelper.dart';
import 'package:vam_vam/helpers/enumHelper.dart';
import 'package:vam_vam/helpers/mockHelper.dart';
import 'package:vam_vam/providers/appointmentProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/widgets/commonWidgets/textStyle.dart';

import '../../../../helpers/responsiveHelper.dart';
import '../../../../providers/AuthProvider.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/fontConstant.dart';
import '../../../../utils/imageResources.dart';
import '../../../../utils/paddingConstant.dart';
import '../../../../widgets/commonWidgets/commonWidgets.dart';
import '../home/events/eventScreen.dart';

class LeaderCalendarScreen extends StatefulWidget {
  const LeaderCalendarScreen({super.key});

  @override
  State<LeaderCalendarScreen> createState() => _LeaderCalendarScreenState();
}

class _LeaderCalendarScreenState extends State<LeaderCalendarScreen> {
  // List<Appointment> appointments = <Appointment>[];
  // CalendarDataSource? _events;
  // final CalendarController _controller = CalendarController();

  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer3<AppointmentProvider, RoleProvider, AuthProvider>(
      builder: (context, data, rolePro, auth, child) => Scaffold(
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
              child: Column(children: [
                const SizedBox(
                  height: 10,
                ),
                topRow,
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: ResponsiveHelper.height(context) * 0.04,
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: MockHelper.leaderAppointmentList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        var item = MockHelper.leaderAppointmentList[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectIndex = index;
                            });
                            data
                                .repGetAppointment(
                                    index == 0
                                        ? 'today'
                                        : index == 1
                                            ? 'upcomming'
                                            : 'past',
                                    auth.getUserId())
                                .then((value) {
                              if (!value.isSuccess &&
                                  value.message == "Appointment Not Found!!") {
                                errorToast(msg: value.message);
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                                width: ResponsiveHelper.width(context) * 0.285,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 2.0,
                                          color: selectIndex == index
                                              ? Colors.white
                                              : Colors.white38),
                                    ],
                                    border: Border.all(
                                        color: selectIndex == index
                                            ? Colors.white
                                            : Colors.white38),
                                    color: selectIndex == index
                                        ? Colors.white
                                        : Colors.white38),
                                child: Center(
                                    child: Text(item['title'],
                                        style: commonTextStyle13(
                                            color: selectIndex == index
                                                ? primaryDark
                                                : primaryDark
                                                    .withOpacity(0.5))))),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                if (rolePro.roleType == getRoleType(RoleEnum.teacher)) ...[
                  if (data.repAppointmentList.isNotEmpty) ...[
                    bottomrepList
                  ] else if (!data.isLoading) ...[
                    Padding(
                      padding: EdgeInsets.only(
                          top: ResponsiveHelper.height(context) * 0.3),
                      child: Center(
                        child: Text(
                          'No Appointment Found!',
                          style: TextStyle(
                            fontSize: FontConstant.xxl,
                            color: white.withOpacity(0.8),
                          ),
                        ),
                      ),
                    )
                  ]
                ],
              ]),
            )),
          )),
    );
  }

  Widget get topRow => Consumer2<AuthProvider, AppointmentProvider>(
        builder: (context, auth, data, child) => Row(
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
                  'My Appointments (${data.repAppointmentList.length})',
                  style: TextStyle(
                      fontSize: FontConstant.l,
                      fontWeight: FontWeight.w600,
                      color: white),
                ),
              ],
            ),
            InkWell(
              onTap: () => context.push(repbookAppointment),
              child: Container(
                margin: EdgeInsets.only(right: 5),
                decoration: BoxDecoration(shape: BoxShape.circle, color: white),
                child: Icon(
                  Icons.add,
                  size: 24,
                  color: primaryDark,
                ),
              ),
            )
          ],
        ),
      );

// representative or executive list

  Widget get bottomrepList => Consumer<AppointmentProvider>(
        builder: (context, data, child) => Expanded(
            // height: 100 * 5,
            // width: ResponsiveHelper.width(context),
            child: ListView.builder(
                itemCount: data.repAppointmentList.length,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var item = data.repAppointmentList[index];
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: PaddingConstant.m),
                    padding: const EdgeInsets.all(PaddingConstant.m),
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: primaryDark),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: ResponsiveHelper.width(context) * 0.6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Reason: ${item.reason}',
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: black,
                                        fontSize: FontConstant.m,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  ReadMoreText(
                                      text: 'Details: ${item.description}',
                                      maxLength: 100),
                                  SizedBox(height: 3),
                                  Row(
                                    children: [
                                      Text(
                                        'Date: ${item.appointmentDate},',
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: lightTextColor,
                                          fontSize: FontConstant.m,
                                          fontWeight: FontWeight.w400,
                                          height: 1.22,
                                          letterSpacing: 0.70,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '${item.appointmentTime}',
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: lightTextColor,
                                          fontSize: FontConstant.m,
                                          fontWeight: FontWeight.w400,
                                          height: 1.22,
                                          letterSpacing: 0.70,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    'Name: ${item.executiveName}',
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: lightTextColor,
                                      fontSize: FontConstant.s,
                                      fontWeight: FontWeight.w400,
                                      height: 1.22,
                                      letterSpacing: 0.70,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    'Status: ${item.statusString}',
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: lightTextColor,
                                      fontSize: FontConstant.m,
                                      fontWeight: FontWeight.w400,
                                      height: 1.22,
                                      letterSpacing: 0.70,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            showAppointmentExcDeleteDialog(
                                context: context,
                                executiveId: '${item.id}',
                                appointmentId: '${item.executiveId}');
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: primaryLight.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              Icons.delete,
                              color: red,
                              size: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                })),
      );

  Future<bool> doesJsonAssetExist(String assetPath) async {
    ByteData data = await rootBundle.load(assetPath);
    return data.buffer.asUint8List().isNotEmpty;
  }

  Future<String> loadAsset(path) async {
    return await rootBundle.loadString(path);
  }

  void prompt(String url) async {
    // if (await canLaunchUrl(Uri.parse('https://www.google.com/'))) {
    print(url);
    await launchUrl(Uri.parse(url));
    // } else {
    // throw 'Could not launch $url';
    // }
  }
}
