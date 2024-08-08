import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/helpers/commonHelper.dart';
import 'package:vam_vam/helpers/dateTimeHelper.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/providers/addComplaintProvider.dart';
import 'package:vam_vam/utils/constant.dart';
import 'package:vam_vam/widgets/commonWidgets/appDesign.dart';
import 'package:vam_vam/widgets/commonWidgets/textStyle.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/fontConstant.dart';
import '../../../../utils/imageResources.dart';
import '../../../../utils/paddingConstant.dart';
import '../../../../widgets/commonWidgets/commonWidgets.dart';

class ComplaintDetailScreen extends StatefulWidget {
  final String title;
  const ComplaintDetailScreen({super.key, required this.title});

  @override
  State<ComplaintDetailScreen> createState() => _ComplaintDetailScreenState();
}

class _ComplaintDetailScreenState extends State<ComplaintDetailScreen> {
  final ScrollController scrollController = ScrollController();
  int length = 10;
  bool isScroll = false;

  @override
  void initState() {
    super.initState();
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
                data.leaderComplaintList.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                            itemCount: data.leaderComplaintList.length > 10 &&
                                    length < data.leaderComplaintList.length
                                ? length
                                : data.leaderComplaintList.length,
                            shrinkWrap: true,
                            controller: scrollController,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var item = data.leaderComplaintList[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: GestureDetector(
                                  onTap: () => context
                                      .push('$leaderTrackComplaint/${item.id}'),
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
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 16,
                                              width: 16,
                                              decoration: BoxDecoration(
                                                  color: getStatusColor(
                                                      '${item.statusString}'),
                                                  shape: BoxShape.circle),
                                            ),
                                            const SizedBox(width: 10),
                                            Text('${item.statusString}',
                                                style: TextStyle(
                                                    color: primaryDark,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12)),
                                            const Spacer(),
                                            const SizedBox(width: 5),
                                            Text(
                                              '#${item.id}',
                                              textAlign: TextAlign.end,
                                              style: commonTextStyle12(
                                                  color: primaryDark),
                                            )
                                          ],
                                        ),
                                        Text(
                                          '       ${DateTimeHelper.getUserDate('${item.complaintDate}')}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: primaryDark),
                                        ),
                                        SizedBox(height: 5),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${item.address}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: primaryDark),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[100],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4.0,
                                                    bottom: 4.0,
                                                    left: 6,
                                                    right: 6),
                                                child: Text(
                                                  '${item.message}',
                                                  style: commonTextStyle13(
                                                      color: black),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            height: ResponsiveHelper.height(
                                                    context) *
                                                0.01),
                                      ],
                                    ),
                                  )),
                                ),
                              );
                            }))
                    : Padding(
                        padding: EdgeInsets.only(
                            top: ResponsiveHelper.height(context) * 0.3),
                        child: Center(
                            child: Text(
                          'No Complaint Found!',
                          style: TextStyle(
                              fontSize: FontConstant.xxl,
                              color: white.withOpacity(0.8)),
                        )),
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
            ),
          ))),
    );
  }

  Widget get topRow => Consumer<AddComplaintProvider>(
        builder: (context, data, child) => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              '${widget.title} (${data.leaderComplaintList.length})',
              style: TextStyle(
                  fontSize: FontConstant.l,
                  fontWeight: FontWeight.w600,
                  color: white),
            ),
            // Image.asset(
            //   ImageResources.addImage,
            //   height: 20,
            //   width: 20,
            //   fit: BoxFit.fill,
            // )
          ],
        ),
      );
}
