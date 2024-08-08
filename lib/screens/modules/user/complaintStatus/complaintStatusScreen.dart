import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/helpers/dialogHelper.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/addComplaintProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/utils/constant.dart';
import 'package:vam_vam/utils/fontConstant.dart';
import 'package:vam_vam/utils/stringResources.dart';

import '../../../../data/model/response/user/complaintModel.dart';
import '../../../../helpers/commonHelper.dart';
import '../../../../helpers/responsiveHelper.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/imageResources.dart';
import '../../../../utils/paddingConstant.dart';
import '../../../../widgets/commonWidgets/appDesign.dart';
import '../../../../widgets/commonWidgets/commonWidgets.dart';
import '../../../../widgets/commonWidgets/textStyle.dart';

class UserComplaintStatusScreen extends StatefulWidget {
  const UserComplaintStatusScreen({super.key});

  @override
  State<UserComplaintStatusScreen> createState() =>
      _UserComplaintStatusScreenState();
}

class _UserComplaintStatusScreenState extends State<UserComplaintStatusScreen> {
  String isSelected = 'open';

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<AddComplaintProvider>(context, listen: false)
          .getComplaints(
              Provider.of<AuthProvider>(context, listen: false).getUserId(),
              'open',
              context)
          .then((value) {
        if (value.isSuccess) {
          successToast(msg: value.message);
        } else if (value.message != unAuthonticated) {
          errorToast(msg: value.message);
        }
      });
    });
  }

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
                        const Text("Complaint Status",
                            style: TextStyle(
                              fontSize: 16,
                              color: white,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                    SizedBox(height: ResponsiveHelper.height(context) * 0.04),
                    Row(
                      children: [
                        Expanded(
                          child: Bounce(
                            duration: const Duration(milliseconds: 110),
                            onPressed: () {
                              isSelected = 'open';
                              setState(() {});
                              data
                                  .getComplaints(
                                      auth.getUserId(), 'open', context)
                                  .then((value) {
                                if (value.isSuccess) {
                                } else {
                                  errorToast(msg: value.message);
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2.0,
                                        color: isSelected == 'open'
                                            ? Colors.white
                                            : Colors.white38),
                                  ],
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.1)),
                                  color: isSelected == 'open'
                                      ? Colors.white
                                      : Colors.white38),
                              height: 40,
                              margin: const EdgeInsets.only(right: 5),
                              child: Center(
                                child: Text('Open',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        color: isSelected == 'open'
                                            ? primaryDark
                                            : primaryDark.withOpacity(0.5))),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Bounce(
                            duration: const Duration(milliseconds: 110),
                            onPressed: () {
                              isSelected = 'reopen';
                              setState(() {});
                              data
                                  .getComplaints(
                                      auth.getUserId(), 'reopen', context)
                                  .then((value) {
                                if (value.isSuccess) {
                                } else {
                                  // errorToast(msg: value.message);
                                }
                              });
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2.0,
                                        color: isSelected != 'reopen'
                                            ? Colors.white38
                                            : Colors.white),
                                  ],
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.1)),
                                  color: isSelected != 'reopen'
                                      ? Colors.white38
                                      : Colors.white),
                              margin: const EdgeInsets.only(left: 5),
                              child: Center(
                                  child: Text(
                                'Reopen',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: isSelected != 'reopen'
                                        ? primaryDark.withOpacity(0.5)
                                        : primaryDark),
                              )),
                            ),
                          ),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Bounce(
                            duration: const Duration(milliseconds: 110),
                            onPressed: () {
                              isSelected = 'close';
                              setState(() {});
                              data
                                  .getComplaints(
                                      auth.getUserId(), 'close', context)
                                  .then((value) {
                                if (value.isSuccess) {
                                } else {
                                  // errorToast(msg: value.message);
                                }
                              });
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2.0,
                                        color: isSelected != 'close'
                                            ? Colors.white38
                                            : Colors.white),
                                  ],
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.1)),
                                  color: isSelected != 'close'
                                      ? Colors.white38
                                      : Colors.white),
                              margin: const EdgeInsets.only(left: 5),
                              child: Center(
                                  child: Text(
                                'Close',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: isSelected != 'close'
                                        ? primaryDark.withOpacity(0.5)
                                        : primaryDark),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ResponsiveHelper.height(context) * 0.03),
                    data.complaintList.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: data.complaintList.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  var item = data.complaintList[index];
                                  return box(item, data);
                                }),
                          )
                        : SizedBox.shrink(),
                    if (data.complaintList.isEmpty && !data.isLoading) ...[
                      Padding(
                        padding: EdgeInsets.only(
                            top: ResponsiveHelper.height(context) * 0.25),
                        child: Center(
                          child: Text(
                            'No Complaint Found!',
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
            )),
      ),
    );
  }

  Widget box(ComplaintModelData item, AddComplaintProvider data) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () {
          // showViewComplaintDialog(context: context, item: data);
          showUserComplaintDialog(context: context, item: item);
        },
        child: commonContainerList(
            child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                        color: getStatusColor('${item.statusString}'),
                        shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                        color: black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      '${item.statusString}',
                      style: TextStyle(
                          color: primaryDark,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '#${item.complaintCode}',
                    textAlign: TextAlign.end,
                    style: commonTextStyle12(color: primaryDark),
                  )
                ],
              ),
              SizedBox(height: ResponsiveHelper.height(context) * 0.01),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${item.issueInfo}',
                          style: commonTextStyle13(color: primaryDark),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '  ${item.message}',
                          style: commonTextStyle12(color: black),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: ResponsiveHelper.height(context) * 0.02),
              isSelected == 'open' || isSelected == 'reopen'
                  ? Row(
                      children: [
                        Expanded(
                          child: Bounce(
                            duration: const Duration(milliseconds: 110),
                            onPressed: () => showWithdrawDialog(
                                context: context, complaintId: '${item.id}'),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 2.0, color: primaryDark),
                                  ],
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.1)),
                                  color: primaryDark),
                              height: 40,
                              margin: const EdgeInsets.only(right: 5),
                              child: Center(
                                child: Text('Withdraw',
                                    style: commonTextStyle13(color: white)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Bounce(
                            duration: const Duration(milliseconds: 110),
                            onPressed: () {
                              data
                                  .getComplaintFollowUp('${item.id}')
                                  .then((value) {
                                if (value.isSuccess) {
                                  context.push(track);
                                } else {
                                  errorToast(msg: value.message);
                                }
                              });
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 2.0, color: primaryDark),
                                  ],
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.1)),
                                  color: primaryDark),
                              margin: const EdgeInsets.only(left: 5),
                              child: Center(
                                  child: Text('Track',
                                      style: commonTextStyle13(color: white))),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: Bounce(
                            duration: const Duration(milliseconds: 110),
                            onPressed: () {
                              showReopenComplaintDialog(
                                  context: context,
                                  complaintId: '${item.id}',
                                  filterBy: isSelected);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                    color: primaryDark.withOpacity(0.1)),
                              ),
                              height: 40,
                              margin: const EdgeInsets.only(right: 5),
                              child: Center(
                                child: Text('Reopen Complaint',
                                    style:
                                        commonTextStyle13(color: primaryDark)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Bounce(
                            duration: const Duration(milliseconds: 110),
                            onPressed: () => showViewComplaintDialog(
                                context: context, item: item),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                boxShadow: const [],
                                border: Border.all(
                                    color: primaryDark.withOpacity(0.1)),
                              ),
                              margin: const EdgeInsets.only(left: 5),
                              child: Center(
                                  child: Text('View Complaint',
                                      style: commonTextStyle13(
                                          color: primaryDark))),
                            ),
                          ),
                        ),
                      ],
                    ),
              SizedBox(height: ResponsiveHelper.height(context) * 0.02),
              if (isSelected != 'close') ...[
                commonButtonWhite(
                    width: ResponsiveHelper.width(context) * 0.5,
                    onTap: () {
                      // showComplaintDialog(context: context);
                      context.push('$reviewComplaint/${item.id}');
                    },
                    title: 'Write Your Review',
                    txtColor: white,
                    bgColors: [primaryDark, primaryDark],
                    fontSize: 12),
                SizedBox(height: ResponsiveHelper.height(context) * 0.02),
              ]
            ],
          ),
        )),
      ),
    );
  }
}
