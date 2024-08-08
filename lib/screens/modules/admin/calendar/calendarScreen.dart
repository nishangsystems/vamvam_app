// ignore_for_file: avoid_print, unused_local_variable, unused_field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vam_vam/helpers/dialogHelper.dart';
import 'package:vam_vam/helpers/enumHelper.dart';
import 'package:vam_vam/helpers/mockHelper.dart';
import 'package:vam_vam/providers/appointmentProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/utils/stringResources.dart';
import 'package:vam_vam/widgets/commonWidgets/textStyle.dart';

import '../../../../helpers/dateTimeHelper.dart';
import '../../../../helpers/responsiveHelper.dart';
import '../../../../providers/AuthProvider.dart';
import '../../../../providers/myCalendarProvider.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/fontConstant.dart';
import '../../../../utils/imageResources.dart';
import '../../../../utils/paddingConstant.dart';
import '../../../../widgets/commonWidgets/commonWidgets.dart';
import '../home/events/eventScreen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final ScrollController scrollController = ScrollController();
  int length = 10;
  bool isScroll = false;
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      var role = Provider.of<RoleProvider>(context, listen: false);
      if (role.roleType == getRoleType(RoleEnum.student)) {
        Provider.of<AppointmentProvider>(context, listen: false)
            .userGetAppointment(
                'today',
                Provider.of<AuthProvider>(context, listen: false).getUserId(),
                context)
            .then((value) {
          if (!value.isSuccess) {
            if (value.message != unAuthonticated &&
                value.message != 'Appointment Not Found!!') {
              errorToast(msg: value.message);
            }
          }
        });
      }
    });
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        setState(() {
          isScroll = true;
        });
        Future.delayed(Duration(seconds: 1)).then((value) {
          setState(() {
            length += 10;
            isScroll = false;
          });
        });
      }
      if (scrollController.position.pixels ==
          scrollController.position.minScrollExtent) {
        setState(() {
          length = 10;
          isScroll = false;
        });
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

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

                SizedBox(
                  height: 20,
                ),

                // if (data.userAppointmentList.isNotEmpty)
                // if (rolePro.roleType == getRoleType(RoleEnum.student)) ...[
                SizedBox(
                  height: ResponsiveHelper.height(context) * 0.04,
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: MockHelper.userAppointmentList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        var item = MockHelper.userAppointmentList[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectIndex = index;
                            });
                            if (rolePro.roleType ==
                                getRoleType(RoleEnum.student)) {
                              data
                                  .userGetAppointment(
                                      index == 0
                                          ? 'today'
                                          : index == 1
                                              ? 'upcomming'
                                              : 'past',
                                      auth.getUserId(),
                                      context)
                                  .then((value) {
                                if (!value.isSuccess) {
                                  if (value.message != unAuthonticated &&
                                      value.message !=
                                          'Appointment Not Found!!') {
                                    errorToast(msg: value.message);
                                  }
                                }
                              });
                            }
                            if (rolePro.roleType ==
                                getRoleType(RoleEnum.leader)) {
                              data
                                  .leaderGetAppointment(
                                      index == 0
                                          ? 'today'
                                          : index == 1
                                              ? 'upcomming'
                                              : 'past',
                                      auth.getUserId())
                                  .then((value) {
                                if (!value.isSuccess &&
                                    value.message !=
                                        'Appointment Not Found!!') {
                                  errorToast(msg: value.message);
                                }
                              });
                            }
                            if (rolePro.roleType ==
                                getRoleType(RoleEnum.teacher)) {
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
                                    value.message !=
                                        'Appointment Not Found!!') {
                                  errorToast(msg: value.message);
                                }
                              });
                            }
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
                // ],

                // if (data.leaderAppointmentList.isNotEmpty)
                if (rolePro.roleType == getRoleType(RoleEnum.leader)) ...[
                  if (data.leaderAppointmentList.isNotEmpty) ...[
                    bottomList
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

                // if (data.userAppointmentList.isNotEmpty)
                if (rolePro.roleType == getRoleType(RoleEnum.student)) ...[
                  if (data.userAppointmentList.isNotEmpty) ...[
                    bottomuserList
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
                  ],
                  if (isScroll) ...[
                    Center(
                        child: CircularProgressIndicator(
                      color: white,
                    ))
                  ],
                ],
              ]),
            )),
          )),
    );
  }

  Widget get topRow =>
      Consumer3<AuthProvider, AppointmentProvider, RoleProvider>(
        builder: (context, auth, data, role, child) => Row(
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

                // my apointments
                if (role.roleType == getRoleType(RoleEnum.student)) ...[
                  Text(
                    'My Appointments (${data.userAppointmentList.length})',
                    style: TextStyle(
                        fontSize: FontConstant.l,
                        fontWeight: FontWeight.w600,
                        color: white),
                  ),
                ] else ...[
                  Text(
                    'My Appointments (${data.leaderAppointmentList.length})',
                    style: TextStyle(
                        fontSize: FontConstant.l,
                        fontWeight: FontWeight.w600,
                        color: white),
                  ),
                ]
                // bottomList,
              ],
            ),
            InkWell(
              onTap: () {
                context.push(bookAppointment).then((value) {});
              },
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
  Widget get calendar => Consumer<MyCalendarProvider>(
        builder: (context, data, child) => Container(
            color: white,
            child: Column(
              children: [
                TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(4000, 3, 14),
                  focusedDay: data.mySelectedDate,
                  currentDay: data.mySelectedDate,
                  weekendDays: const [DateTime.saturday, DateTime.sunday],
                  calendarStyle: const CalendarStyle(
                      weekendTextStyle: TextStyle(color: red),
                      outsideDaysVisible: true,
                      todayDecoration: BoxDecoration(
                          color: primaryDark, shape: BoxShape.circle),
                      todayTextStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: white,
                          fontSize: FontConstant.l)),
                  onDaySelected: (value, value2) =>
                      data.setMySelectedDate(value),
                  headerStyle: const HeaderStyle(
                    formatButtonShowsNext: true,
                    formatButtonVisible: false,
                    titleCentered: true,
                    leftChevronIcon: Icon(
                      Icons.chevron_left_rounded,
                      color: lightTextColor,
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right_rounded,
                      color: lightTextColor,
                    ),
                    titleTextStyle: TextStyle(
                        height: 3.5,
                        color: lightTextColor,
                        fontSize: FontConstant.l,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            )),
      );

  Widget get bottomList => Consumer<AppointmentProvider>(
        builder: (context, data, child) => Expanded(
            child: ListView.builder(
                itemCount: data.leaderAppointmentList.length > 10 &&
                        length < data.leaderAppointmentList.length
                    ? length
                    : data.leaderAppointmentList.length,
                controller: scrollController,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var item = data.leaderAppointmentList[index];
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
                              width: ResponsiveHelper.width(context) * 0.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Reason: ${item.title}',
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: black,
                                        fontSize: FontConstant.m,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    'Date: ${item.appointmentDate}',
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: lightTextColor,
                                      fontSize: FontConstant.s,
                                      fontWeight: FontWeight.w400,
                                      height: 1.22,
                                      letterSpacing: 0.70,
                                    ),
                                  ),
                                  ReadMoreText(
                                      text: 'Details: ${item.description}',
                                      maxLength: 100),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.all(8.0),
                                width: ResponsiveHelper.width(context) * 0.30,
                                color: primaryDark,
                                child: Text(
                                  '${DateTimeHelper().convertTo12HourFormat('${item.startTime}')} To ${DateTimeHelper().convertTo12HourFormat('${item.endTime}')}',
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: white,
                                    fontSize: FontConstant.s,
                                    fontWeight: FontWeight.w400,
                                    height: 1.22,
                                    letterSpacing: 0.70,
                                  ),
                                )),
                            // const SizedBox(
                            //   width: 10,
                            // ),
                            // Container(
                            //   padding: const EdgeInsets.all(6.0),
                            //   decoration: const BoxDecoration(
                            //     shape: BoxShape.circle,
                            //     color: primaryDark,
                            //   ),
                            //   child: const Icon(
                            //     Icons.chevron_right_outlined,
                            //     color: white,
                            //     size: 18,
                            //   ),
                            // )
                          ],
                        )
                      ],
                    ),
                  );
                })),
      );

// userlist

  Widget get bottomuserList => Consumer<AppointmentProvider>(
        builder: (context, data, child) => Expanded(
            // height: 100 * 5,
            // width: ResponsiveHelper.width(context),
            child: ListView.builder(
                itemCount: data.userAppointmentList.length,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var item = data.userAppointmentList[index];
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
                                          letterSpacing: 0.50,
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
                                    'Name: ${item.customerName}',
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
                            showAppointmentUserDeleteDialog(
                                context: context,
                                userId: '${item.id}',
                                appointmentId: '${item.userId}');
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

                        // Row(
                        //   children: [
                        //     // Container(
                        //     //     padding: const EdgeInsets.all(8.0),
                        //     //     width: ResponsiveHelper.width(context) * 0.35,
                        //     //     color: primaryDark,
                        //     //     child: Text(
                        //     //       '${DateTimeHelper().convertTo12HourFormat('${item.appointmentTime}')} To ${DateTimeHelper().convertTo12HourFormat('${item.endTime}')}',
                        //     //       maxLines: 2,
                        //     //       style: TextStyle(
                        //     //         color: white,
                        //     //         fontSize: FontConstant.s,
                        //     //         fontWeight: FontWeight.w400,
                        //     //         height: 1.22,
                        //     //         letterSpacing: 0.70,
                        //     //       ),
                        //     //     )),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     Container(
                        //       padding: const EdgeInsets.all(6.0),
                        //       decoration: const BoxDecoration(
                        //         shape: BoxShape.circle,
                        //         color: primaryDark,
                        //       ),
                        //       child: const Icon(
                        //         Icons.chevron_right_outlined,
                        //         color: white,
                        //         size: 18,
                        //       ),
                        //     )
                        //   ],
                        // )
                      ],
                    ),
                  );
                })),
      );

  // _AppointmentDataSource _getCalendarDataSource() {
  //   appointments.add(Appointment(
  //     startTime: DateTime.now(),
  //     endTime: DateTime.now().add(Duration(minutes: 10)),
  //     subject: 'Meeting',
  //     color: black,
  //     startTimeZone: '',
  //     endTimeZone: '',
  //   ));

  //   return _AppointmentDataSource(appointments);
  // }

  // test() async {
  //   final authorizationEndpoint =
  //       Uri.parse('https://accounts.google.com/o/oauth2/auth');
  //   final tokenEndpoint = Uri.parse('https://oauth2.googleapis.com/token');
  //   final identifier = Secret.getId();
  //   const secret = '';
  //   final redirectUrl = Uri.parse('https://www.googleapis.com/oauth2/v1/certs');
  //   var filePath = 'assets/files/client_secret.json';
  //   final credentialsFile = doesJsonAssetExist(filePath);
  //   credentialsFile.then((value) async {
  //     if (value) {
  //       var credentials =
  //           oauth2.Credentials.fromJson(await loadAsset(filePath));
  //       var client =
  //           oauth2.Client(credentials, identifier: identifier, secret: secret);
  //       print(client);
  //     } else {
  //       print("Json file does not exist in your project");
  //     }
  //   });
  // }

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

  // getGoogleEventsData() async {
  //   try {
  //     print("sign indfskls");
  //     final GoogleSignIn googleSignIn = GoogleSignIn(
  //       clientId: Secret.getId(),
  //       scopes: <String>[
  //         CalendarApi.calendarScope,
  //       ],
  //     );
  //     googleSignIn.signIn().then((value) async {
  //       final googleUser = value;
  //       // final httpClient =
  //       //  GoogleHttp (await googleUser!.authHeaders);
  //       final CalendarApi calendarAPI =
  //           CalendarApi((await googleUser!.authHeaders) as Client);
  //       final Events calEvents = await calendarAPI.events.list(
  //         "primary",
  //       );
  //       print(calEvents);
  //       print('object');
  //       final List<Event> appointments = <Event>[];
  //       if (calEvents != null && calEvents.items != null) {
  //         for (int i = 0; i < calEvents.items!.length; i++) {
  //           final Event event = calEvents.items![i];
  //           if (event.start == null) {
  //             continue;
  //           }
  //           appointments.add(event);
  //         }
  //       }
  //       print(appointments);
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}

// class _AppointmentDataSource extends CalendarDataSource {
//   _AppointmentDataSource(List<Appointment> source) {
//     appointments = source;
//   }
// }
