import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/providers/addComplaintProvider.dart';

import '../../helpers/dialogHelper.dart';
import '../../utils/apiConstant.dart';
import '../../utils/colors.dart';
import '../../utils/imageResources.dart';
import '../../utils/paddingConstant.dart';
import '../../widgets/commonWidgets/commonWidgets.dart';
import '../photo/photoViewScreen.dart';
import '../video/videoScreen.dart';

class TrackScreen extends StatefulWidget {
  const TrackScreen({super.key});

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
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
            top: false,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: PaddingConstant.l,
                  //right: PaddingConstant.l,
                  top: PaddingConstant.xxl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      commonBackButton(
                          context: context, title: '', backBtnColor: white),
                      const SizedBox(width: 10),
                      const Text("Track Complaint Status",
                          style: TextStyle(
                            fontSize: 16,
                            color: white,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      // height: ResponsiveHelper.height(context) * 0.8,
                      // width: ResponsiveHelper.width(context),
                      child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: data.comlaintFollowUpList.length,
                          itemBuilder: (context, index) {
                            var item = data.comlaintFollowUpList[index];
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.radio_button_checked_rounded,
                                        size: 18,
                                        color: white,
                                      ),
                                      if (item.statusString != null &&
                                          item.statusString != '' &&
                                          item.executiveName != null &&
                                          item.executiveName != '') ...[
                                        if (item.statusString ==
                                            'Assigned') ...[
                                          Text(
                                            '  ${item.statusString} to ${item.executiveName}',
                                            style: TextStyle(
                                                color: white, fontSize: 12),
                                          ),
                                        ] else ...[
                                          Text(
                                            '  ${item.statusString}',
                                            style: TextStyle(
                                                color: white, fontSize: 12),
                                          ),
                                        ]
                                      ],
                                      Expanded(
                                          child: Text(
                                        '  (${item.executiveName != null && item.executiveName!.isNotEmpty ? '${item.executiveName}:- ' : ''}${item.remarks})',
                                        style: TextStyle(
                                            color: white, fontSize: 12),
                                      ))
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: Text(
                                      '  ${item.date} (${item.time!.split(':')[0]}:${item.time!.split(':')[1]})',
                                      style:
                                          TextStyle(color: white, fontSize: 12),
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (index !=
                                          data.comlaintFollowUpList.length -
                                              1) ...[
                                        Container(
                                          margin:
                                              EdgeInsets.only(left: 8, top: 8),
                                          height: 60,
                                          width: 1.5,
                                          color: white,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: SizedBox(
                                          width:
                                              ResponsiveHelper.width(context) *
                                                  0.8,
                                          height: 50,
                                          child: ListView.builder(
                                              itemCount: item.mediaFile!.length,
                                              shrinkWrap: true,
                                              physics:
                                                  AlwaysScrollableScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 8),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      item.mediaFile![index]
                                                                  .fileType ==
                                                              'mp3'
                                                          ? showAudioPlayerDialog(
                                                              context,
                                                              '${ApiConstant.baseUrl}/${item.mediaFile![index].filePath}')
                                                          : item
                                                                      .mediaFile![
                                                                          index]
                                                                      .fileType ==
                                                                  'mp4'
                                                              ? Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) => VideoScreen(
                                                                          isNetwork:
                                                                              true,
                                                                          video:
                                                                              '${ApiConstant.baseUrl}/${item.mediaFile![index].filePath}')))
                                                              : Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          PhotoViewScreen(
                                                                            url:
                                                                                '${ApiConstant.baseUrl}/${item.mediaFile![index].filePath}',
                                                                            isNetwork:
                                                                                true,
                                                                          )));
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: FancyShimmerImage(
                                                          height: 50,
                                                          width: 60,
                                                          errorWidget:
                                                              Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  decoration: BoxDecoration(
                                                                      color:
                                                                          white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8)),
                                                                  child: item.mediaFile![index].fileType ==
                                                                          'mp3'
                                                                      ? Image.asset(
                                                                          IconResource
                                                                              .micIcon)
                                                                      : item.mediaFile![index].fileType ==
                                                                              'mp3'
                                                                          ? Image.asset(IconResource
                                                                              .playIcon)
                                                                          : Icon(
                                                                              Icons.error_outline_rounded,
                                                                              color: errorColor,
                                                                            )),
                                                          imageUrl:
                                                              '${ApiConstant.baseUrl}/${item.mediaFile![index].filePath}'),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          }))
                ],
              ),
            ),
          )),
    );
  }
}
