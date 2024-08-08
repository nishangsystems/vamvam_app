import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:go_router/go_router.dart';
import 'package:googleapis/calendar/v3.dart';
import "package:googleapis_auth/auth_io.dart";
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/toDoProvider.dart';
import 'package:vam_vam/screens/modules/representative/toDo/createToDoScreen.dart';

import '../../../../providers/myCalendarProvider.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/fontConstant.dart';
import '../../../../utils/imageResources.dart';
import '../../../../utils/paddingConstant.dart';
import '../../../../widgets/commonWidgets/commonWidgets.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  int length = 10;
  bool isScroll = false;
  bool showCalendar = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
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

  void _toggleVisibility() {
    setState(() {
      showCalendar = !showCalendar;
      if (showCalendar) {
        _controller.forward(); // Play forward animation
      } else {
        _controller.reverse(); // Play reverse animation
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

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
                height: 10,
              ),
              Bounce(
                duration: Duration(milliseconds: 500),
                onPressed: () {
                  _toggleVisibility();
                },
                child: Row(
                  children: [
                    Text(
                      !showCalendar ? 'Show Calendar' : 'Hide Calendar',
                      style: TextStyle(color: white),
                    ),
                    Icon(
                      !showCalendar
                          ? Icons.keyboard_arrow_down_rounded
                          : Icons.keyboard_arrow_up_rounded,
                      size: 24,
                      color: white,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // Calendar Widget
              if (showCalendar) ...[
                AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) =>
                        Opacity(opacity: _animation.value, child: calendar)),
                const SizedBox(
                  height: 20,
                ),
              ],

              // Bottom list
              bottomList(length: length, controller: scrollController),

              if (isScroll) ...[
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: CircularProgressIndicator(
                  color: white,
                ))
              ],
            ],
          ),
        )));
  }

  Widget get topRow => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Bounce(
                  duration: Duration(milliseconds: 100),
                  onPressed: () => context.pop(),
                  child: Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                const Text(
                  'To-Do',
                  style: TextStyle(
                      fontSize: FontConstant.l,
                      fontWeight: FontWeight.w600,
                      color: white),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CreateToDoScreen()));
                // const scopes = [CalendarApi.calendarEventsScope];
                // // showCalenderDialog(context: context);
                // ClientId credentials;
                // if (Platform.isAndroid) {
                //   credentials = ClientId(
                //       "311129299728-4ejhh6j8njgqgtojk6o4o91adp6v4lik.apps.googleusercontent.com",
                //       "");
                // } else if (Platform.isIOS) {
                //   credentials = ClientId(
                //       "YOUR_CLIENT_ID_FOR_IOS_APP_RETRIEVED_FROM_Google_Console_Project_EARLIER",
                //       "");
                // }
                // Event event = Event(); // Create object of event
                // event.summary = 'summaryText'; //Setting summary of object

                // EventDateTime start = EventDateTime(); //Setting start time
                // start.dateTime = DateTime.now();
                // start.timeZone = "GMT+05:00";
                // event.start = start;

                // EventDateTime end = EventDateTime(); //setting end time
                // end.timeZone = "GMT+05:00";
                // end.dateTime =
                //     DateTime.now().add(Duration(milliseconds: 1000 * 10));
                // event.end = end;
                // insertEvent(event, credentials, scopes);
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                      color: primaryLight),
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Icon(Icons.add, color: white),
                  )),
            ),
          ]);

  Widget get calendar => Consumer<MyCalendarProvider>(
        builder: (context, data, child) =>
            Consumer2<ToDoProvider, AuthProvider>(
          builder: (context, todo, auth, child) => Container(
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
                    onDaySelected: (value, value2) {
                      data.setMySelectedDate(value);
                      todo
                          .getToDo(
                              executiveId: auth.getUserId(),
                              filterDate: value.toString().split(' ')[0])
                          .then((value) {
                        if (!value.isSuccess) {
                          errorToast(msg: value.message);
                        }
                      });
                    },
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
                  // SfCalendar(
                  //   view: CalendarView.week,
                  //   firstDayOfWeek: 1,
                  //   initialSelectedDate: DateTime(2019, 12, 20, 12),
                  //   dataSource: _events,
                  //   controller: _controller,

                  //   // headerStyle: const CalendarHeaderStyle(
                  //   // Customize the header as needed

                  //   // ),
                  // ),
                  // Container(
                  //     color: greyBgColor,
                  //     alignment: Alignment.centerLeft,
                  //     padding: const EdgeInsets.all(PaddingConstant.m),
                  //     child: const Text(
                  //       'Upcoming Event',
                  //       textAlign: TextAlign.left,
                  //       style: TextStyle(
                  //         color: Color(0xff454444),
                  //       ),
                  //     )),
                  const SizedBox(
                    height: 5,
                  )
                ],
              )),
        ),
      );

  Widget bottomList(
          {required ScrollController controller, required int length}) =>
      Consumer3<ToDoProvider, MyCalendarProvider, AuthProvider>(
        builder: (context, todo, myCalendar, auth, child) => Expanded(
            child: ListView.builder(
                itemCount:
                    todo.toDoList.length > 10 && length < todo.toDoList.length
                        ? length
                        : todo.toDoList.length,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                controller: controller,
                itemBuilder: (context, index) {
                  var item = todo.toDoList[index];
                  return Container(
                    width: ResponsiveHelper.width(context),
                    margin: const EdgeInsets.symmetric(
                        vertical: PaddingConstant.xs),
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: ResponsiveHelper.width(context) - 120,
                                  child: Text(
                                    '${item.message}',
                                    style: TextStyle(
                                        color: black,
                                        fontSize: FontConstant.m,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Text(
                                  myCalendar.mySelectedDate
                                      .toString()
                                      .split(' ')[0],
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: lightTextColor,
                                    fontSize: FontConstant.s,
                                    fontWeight: FontWeight.w400,
                                    height: 1.22,
                                    letterSpacing: 0.70,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Checkbox(
                            value: item.status == '1',
                            onChanged: (value) {
                              if (item.status != '1') {
                                todo
                                    .updateToDoStatus(
                                        executiveId: auth.getUserId(),
                                        id: item.id!)
                                    .then((value) {
                                  if (!value.isSuccess) {
                                    errorToast(msg: value.message);
                                  } else {
                                    todo
                                        .getToDo(
                                            executiveId: auth.getUserId(),
                                            filterDate: myCalendar
                                                .mySelectedDate
                                                .toString()
                                                .split(' ')[0])
                                        .then((value) {
                                      if (!value.isSuccess) {
                                        errorToast(msg: value.message);
                                      }
                                    });
                                  }
                                });
                              }
                            }),
                        // Row(
                        //   children: [
                        //     Container(
                        //         padding: const EdgeInsets.all(8.0),
                        //         width: ResponsiveHelper.width(context) * 0.35,
                        //         color: primaryDark,
                        //         child: const Text(
                        //           '10:00 AM To 12:00 PM',
                        //           maxLines: 2,
                        //           style: TextStyle(
                        //             color: white,
                        //             fontSize: FontConstant.s,
                        //             fontWeight: FontWeight.w400,
                        //             height: 1.22,
                        //             letterSpacing: 0.70,
                        //           ),
                        //         )),
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
}

insertEvent(event, clienId, scopes) {
  try {
    clientViaUserConsent(clienId, scopes, prompt).then((AuthClient client) {
      print(client);
      var calendar = CalendarApi(client);
      String calendarId = "primary";
      // calendar.events.list(calendarId).then((value) => print(value));
      calendar.events.insert(event, calendarId).then((value) {
        print("ADDEDDD_________________${value.status}");
        if (value.status == "confirmed") {
          print('Event added in google calendar');
        } else {
          print("Unable to add event in google calendar");
        }
      });
    });
  } catch (e) {
    print('Error creating event $e');
  }
}

void prompt(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
