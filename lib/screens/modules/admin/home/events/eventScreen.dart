import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/helpers/enumHelper.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/eventProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/utils/apiConstant.dart';
import 'package:vam_vam/utils/constant.dart';

import '../../../../../helpers/mockHelper.dart';
import '../../../../../helpers/responsiveHelper.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/fontConstant.dart';
import '../../../../../utils/imageResources.dart';
import '../../../../../utils/paddingConstant.dart';
import '../../../../../widgets/commonWidgets/appDesign.dart';
import '../../../../../widgets/commonWidgets/commonWidgets.dart';
import '../../../../../widgets/commonWidgets/textStyle.dart';
import '../../../../photo/photoViewScreen.dart';
import '../../../../video/videoScreen.dart';

class AdminEventScreen extends StatefulWidget {
  const AdminEventScreen({super.key});

  @override
  State<AdminEventScreen> createState() => _AdminEventScreenState();
}

class _AdminEventScreenState extends State<AdminEventScreen> {
  int selectIndex = 0;
  final ScrollController scrollController = ScrollController();
  int length = 10;
  bool isScroll = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      var eventPro = Provider.of<EventProvider>(context, listen: false);
      var role = Provider.of<RoleProvider>(context, listen: false);
      eventPro.getEvents('today', role.roleType, context).then((value) {
        if (!value.isSuccess && value.message != 'Event Not Found!!') {
          errorToast(msg: value.message);
        }
      });
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

  @override
  Widget build(BuildContext context) {
    return Consumer3<EventProvider, RoleProvider, AuthProvider>(
      builder: (context, data, role, auth, child) => Scaffold(
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
              top: false,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: PaddingConstant.l,
                    right: PaddingConstant.l,
                    top: PaddingConstant.xxl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            commonBackButton(
                                context: context,
                                title: '',
                                backBtnColor: white),
                            const SizedBox(width: 10),
                            const Text("Events",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: white,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        if (role.roleType == getRoleType(RoleEnum.leader)) ...[
                          Bounce(
                            duration: Duration(milliseconds: 100),
                            onPressed: () {
                              context.push(adminCreateEvent).then((value) {
                                setState(() {
                                  selectIndex = 0;
                                });
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: white),
                              child: Icon(
                                Icons.add,
                                size: 18,
                                color: primaryDark,
                              ),
                            ),
                          )
                        ]
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: ResponsiveHelper.height(context) * 0.04,
                      child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: MockHelper.eventList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            var item = MockHelper.eventList[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectIndex = index;
                                });
                                data
                                    .getEvents(
                                        index == 0
                                            ? 'today'
                                            : index == 1
                                                ? 'upcomming'
                                                : 'past',
                                        role.roleType,
                                        context)
                                    .then((value) {
                                  if (auth.isLoggedIn()) {
                                    if (!value.isSuccess &&
                                        value.message != 'Event Not Found!!') {
                                      errorToast(msg: value.message);
                                      //errorToast(msg: "Please Login");
                                      //context.push(login);
                                    }
                                  } else {
                                    context.go(login);
                                  }
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Container(
                                    width:
                                        ResponsiveHelper.width(context) * 0.285,
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
                    if (data.eventList.isNotEmpty) ...[
                      Expanded(
                        child: ListView.builder(
                            itemCount: data.eventList.length > 10 &&
                                    length < data.eventList.length
                                ? length
                                : data.eventList.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              var item = data.eventList[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: commonContainerList(
                                    child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 10),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${item.title}',
                                                  style: commonTextStyle14(
                                                    color: primaryDark,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                ReadMoreText(
                                                    text:
                                                        'Details: ${item.description}',
                                                    maxLength: 100),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                SizedBox(
                                                    height:
                                                        ResponsiveHelper.height(
                                                                context) *
                                                            0.001),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.location_on,
                                                      size: 16,
                                                      color: primaryDark,
                                                    ),
                                                    Text(
                                                      '${item.address}',
                                                      style: commonTextStyle12(
                                                          color: black),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                    height:
                                                        ResponsiveHelper.height(
                                                                context) *
                                                            0.005),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      if (item.image != null &&
                                          item.image!.isNotEmpty)
                                        Text(
                                          'Image / Video : ',
                                          style:
                                              commonTextStyle12(color: black),
                                        ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          if (item.image != null &&
                                              item.image!.isNotEmpty) ...[
                                            Bounce(
                                              duration:
                                                  Duration(milliseconds: 100),
                                              onPressed: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          PhotoViewScreen(
                                                            url:
                                                                '${ApiConstant.baseUrl}/${item.image}',
                                                            isNetwork: true,
                                                          ))),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: FancyShimmerImage(
                                                  imageUrl:
                                                      '${ApiConstant.baseUrl}/${item.image}',
                                                  boxFit: BoxFit.fill,
                                                  height: 70,
                                                  width: 70,
                                                  errorWidget: Container(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                          color: white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      child: Icon(
                                                        Icons
                                                            .error_outline_rounded,
                                                        color: errorColor,
                                                      )),
                                                ),
                                              ),
                                            )
                                          ],
                                          SizedBox(
                                            width: 10,
                                          ),
                                          if (item.video != null &&
                                              item.video!.isNotEmpty) ...[
                                            Bounce(
                                              duration:
                                                  Duration(milliseconds: 100),
                                              onPressed: () => Navigator.of(
                                                      context)
                                                  .push(MaterialPageRoute(
                                                      builder: (context) =>
                                                          VideoScreen(
                                                              isNetwork: true,
                                                              video:
                                                                  '${ApiConstant.baseUrl}/${item.video}'))),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: FancyShimmerImage(
                                                  imageUrl:
                                                      '${ApiConstant.baseUrl}/${item.video}',
                                                  boxFit: BoxFit.fill,
                                                  height: 70,
                                                  width: 70,
                                                  errorWidget: Container(
                                                      padding:
                                                          EdgeInsets.all(16),
                                                      decoration: BoxDecoration(
                                                          color: black
                                                              .withOpacity(0.3),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      child: Icon(Icons
                                                          .play_arrow_rounded)),
                                                ),
                                              ),
                                            )
                                          ],
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Text(
                                            'Start Date & Time : ',
                                            style:
                                                commonTextStyle12(color: black),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.calendar_month,
                                                  size: 18),
                                              SizedBox(width: 5),
                                              Text(
                                                item.startDateTime!
                                                    .split(' ')[0],
                                                style: commonTextStyle12(
                                                    color: black),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                              width: ResponsiveHelper.height(
                                                      context) *
                                                  0.02),
                                          Row(
                                            children: [
                                              const Icon(Icons.access_time,
                                                  size: 18),
                                              SizedBox(width: 5),
                                              Text(
                                                item.startDateTime!
                                                    .split(' ')[1],
                                                style: commonTextStyle12(
                                                    color: black),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height:
                                              ResponsiveHelper.height(context) *
                                                  0.01),
                                      Row(
                                        children: [
                                          Text(
                                            'End   Date & Time : ',
                                            style:
                                                commonTextStyle12(color: black),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.calendar_month,
                                                  size: 18),
                                              SizedBox(width: 5),
                                              Text(
                                                item.endDateTime!.split(' ')[0],
                                                style: commonTextStyle12(
                                                    color: black),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                              width: ResponsiveHelper.height(
                                                      context) *
                                                  0.02),
                                          Row(
                                            children: [
                                              const Icon(Icons.access_time,
                                                  size: 18),
                                              SizedBox(width: 5),
                                              Text(
                                                item.endDateTime!.split(' ')[1],
                                                style: commonTextStyle12(
                                                    color: black),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height:
                                              ResponsiveHelper.height(context) *
                                                  0.02),
                                    ],
                                  ),
                                )),
                              );
                            }),
                      ),
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
                    if (!data.isLoading && data.eventList.isEmpty) ...[
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: ResponsiveHelper.height(context) * 0.3),
                          child: Text(
                            'No Event Found!',
                            style: TextStyle(
                                color: white.withOpacity(0.8),
                                fontSize: FontConstant.xxl,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ]
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLength;

  const ReadMoreText({
    super.key,
    required this.text,
    this.maxLength = 100,
  });

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: TextStyle(letterSpacing: 1.0, fontFamily: 'Urbanist'),
            children: [
          TextSpan(
              text: isExpanded
                  ? widget.text
                  : (widget.text.length > widget.maxLength
                      ? '${widget.text.substring(0, widget.maxLength)}...'
                      : widget.text),
              style: TextStyle(
                color: lightTextColor,
                fontSize: FontConstant.s,
                fontWeight: FontWeight.w400,
                height: 1.22,
                letterSpacing: 0.70,
              )),
          if (widget.text.length > widget.maxLength) ...[
            TextSpan(
              text: isExpanded ? 'Read less' : 'Read more',
              style: TextStyle(
                color: Colors.blue,
                fontSize: FontConstant.s,
                fontWeight: FontWeight.w400,
                height: 1.22,
                letterSpacing: 0.70,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
            ),
          ]
        ]));
  }
}
