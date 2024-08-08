import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/addComplaintProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/utils/fontConstant.dart';

import '../../../../helpers/mockHelper.dart';
import '../../../../helpers/responsiveHelper.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/imageResources.dart';
import '../../../../utils/paddingConstant.dart';
import '../../../../widgets/commonWidgets/commonWidgets.dart';
import '../../../../widgets/commonWidgets/textStyle.dart';

class RepresantativeComplaintStatusScreen extends StatefulWidget {
  const RepresantativeComplaintStatusScreen({super.key});

  @override
  State<RepresantativeComplaintStatusScreen> createState() =>
      _RepresantativeComplaintStatusScreenState();
}

class _RepresantativeComplaintStatusScreenState
    extends State<RepresantativeComplaintStatusScreen> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer2<AddComplaintProvider, AuthProvider>(
      builder: (context, data, auth, child) => LoadingOverlay(
        isLoading: data.isLoading,
        child: Scaffold(
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
                    right: PaddingConstant.l,
                    top: PaddingConstant.xxl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        commonBackButton(
                            context: context, title: '', backBtnColor: white),
                        const SizedBox(width: 10),
                        const Text("View Complaint",
                            style: TextStyle(
                              fontSize: 17,
                              color: white,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                    SizedBox(height: ResponsiveHelper.height(context) * 0.03),
                    SizedBox(
                      height: ResponsiveHelper.height(context) * 0.04,
                      width: ResponsiveHelper.width(context),
                      child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: MockHelper.complainList.length,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            var item = MockHelper.complainList[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectIndex = index;
                                });

                                data
                                    .getRepComplaints(
                                        auth.getUserId(),
                                        index == 0
                                            ? 'today'
                                            : index == 1
                                                ? 'open  '
                                                : index == 2
                                                    ? 'resolve'
                                                    : 'cancel')
                                    .then((value) {
                                  if (!value.isSuccess &&
                                      value.message !=
                                          'Complaint Not Found!!') {
                                    errorToast(msg: value.message);
                                  }
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Container(
                                    width:
                                        ResponsiveHelper.width(context) * 0.207,
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
                    SizedBox(height: ResponsiveHelper.height(context) * 0.02),
                    data.repComplaintList.isNotEmpty && !data.isLoading
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: data.repComplaintList.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  var item = data.repComplaintList[index];
                                  return complaintStatusBox(
                                      context: context,
                                      index: index,
                                      isAdmin: false,
                                      item: item);
                                }),
                          )
                        : Padding(
                            padding: EdgeInsets.only(
                                top: ResponsiveHelper.height(context) * 0.27),
                            child: Center(
                              child: Text(
                                "No Complaint Found!",
                                style: TextStyle(
                                  fontSize: FontConstant.xxl,
                                  color: white.withOpacity(0.7),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
