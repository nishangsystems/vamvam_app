import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/helpers/enumHelper.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/approvalProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/screens/modules/representative/reqApproval/updateApprovalStatusScreen.dart';

import '../../../../helpers/mockHelper.dart';
import '../../../../helpers/responsiveHelper.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/imageResources.dart';
import '../../../../utils/paddingConstant.dart';
import '../../../../widgets/commonWidgets/appDesign.dart';
import '../../../../widgets/commonWidgets/commonWidgets.dart';
import '../../../../widgets/commonWidgets/textStyle.dart';

class RequestApprovalScreen extends StatefulWidget {
  const RequestApprovalScreen({super.key});

  @override
  State<RequestApprovalScreen> createState() => _RequestApprovalScreenState();
}

class _RequestApprovalScreenState extends State<RequestApprovalScreen> {
  var selectIndex = 0;
  String? selectedStatus;

  @override
  Widget build(BuildContext context) {
    return Consumer3<RoleProvider, ApprovalProvider, AuthProvider>(
      builder: (context, role, approval, auth, child) => Scaffold(
          backgroundColor: primaryDark,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(appBarHeight),
              child: homeAppbar(
                  context: context,
                  profileImage: ImageResources.profileImage,
                  name: 'deepak',
                  location: 'H 106')),
          body: LoadingOverlay(
            isLoading: approval.isLoading,
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
                      children: [
                        commonBackButton(
                            context: context, title: '', backBtnColor: white),
                        const SizedBox(width: 10),
                        Text(
                            role.roleType == getRoleType(RoleEnum.teacher)
                                ? "Request For Approval"
                                : 'Approvals',
                            style: TextStyle(
                              fontSize: 17,
                              color: white,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    commonContainer(
                      width: ResponsiveHelper.width(context),
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: PaddingConstant.l, right: PaddingConstant.l),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: selectedStatus,
                              isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              hint: const Text('Select Status',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: black,
                                      fontSize: 12)),
                              items: ['Pending', 'Accepted', 'Rejected']
                                  .map((items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                      )),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedStatus = newValue;
                                });
                                approval
                                    .getRequestApproval(
                                        filterBy: selectIndex == 0
                                            ? 'today'
                                            : selectIndex == 1
                                                ? 'upcomming'
                                                : 'past',
                                        executiveId: auth.getUserId(),
                                        roleType: role.roleType,
                                        status: selectedStatus ?? '')
                                    .then((value) {
                                  if (!value.isSuccess &&
                                      value.message !=
                                          'Approval Request Not Found!!') {
                                    errorToast(msg: value.message);
                                  }
                                });
                              }),
                        ),
                      ),
                    ),
                    SizedBox(height: ResponsiveHelper.height(context) * 0.03),
                    SizedBox(
                      height: ResponsiveHelper.height(context) * 0.04,
                      child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: MockHelper.approvalList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            var item = MockHelper.approvalList[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectIndex = index;
                                });
                                approval
                                    .getRequestApproval(
                                        filterBy: index == 0
                                            ? 'today'
                                            : index == 1
                                                ? 'upcomming'
                                                : 'past',
                                        executiveId: auth.getUserId(),
                                        roleType: role.roleType,
                                        status: selectedStatus ?? '')
                                    .then((value) {
                                  if (!value.isSuccess &&
                                      value.message !=
                                          'Approval Request Not Found!!') {
                                    errorToast(msg: value.message);
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
                    SizedBox(height: ResponsiveHelper.height(context) * 0.02),
                    if (!approval.isLoading &&
                        approval.approvalList.isEmpty) ...[
                      Padding(
                        padding: EdgeInsets.only(
                            top: ResponsiveHelper.height(context) * 0.2),
                        child: Center(
                          child: Text(
                            'No Approval Request Found!',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: white.withOpacity(0.65)),
                          ),
                        ),
                      ),
                    ],
                    approval.approvalList.isNotEmpty && !approval.isLoading
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: approval.approvalList.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  var item = approval.approvalList[index];
                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
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
                                              Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Container(
                                                    height: 12,
                                                    width: 12,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: item.statusString ==
                                                              'Pending'
                                                          ? primaryLight
                                                          : item.statusString ==
                                                                  'Accepted'
                                                              ? successColor
                                                              : errorColor,
                                                    ),
                                                  )),
                                              const SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(item.statusString ?? '',
                                                      style: commonTextStyle12(
                                                          color: primaryDark)),
                                                  Text(item.ticketDate!,
                                                      style: commonTextStyle12(
                                                          color: primaryDark)),
                                                ],
                                              ),
                                              const Spacer(),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute(
                                                          builder: (context) =>
                                                              UpdateApprovalStatusScreen(
                                                                  approvalId:
                                                                      item.id!)))
                                                      .then((value) {
                                                    approval
                                                        .getRequestApproval(
                                                            filterBy: selectIndex ==
                                                                    0
                                                                ? 'today'
                                                                : selectIndex ==
                                                                        1
                                                                    ? 'upcomming'
                                                                    : 'past',
                                                            executiveId: auth
                                                                .getUserId(),
                                                            roleType:
                                                                role.roleType,
                                                            status:
                                                                selectedStatus ??
                                                                    '')
                                                        .then((value) {
                                                      if (!value.isSuccess) {
                                                        errorToast(
                                                            msg: value.message);
                                                      }
                                                    });
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: primaryDark,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 1.0,
                                                            bottom: 1.0,
                                                            left: 8,
                                                            right: 8),
                                                    child: Text(
                                                      'Update',
                                                      style: commonTextStyle12(
                                                          color: white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                'Ticket No : #${item.ticketNo}',
                                                textAlign: TextAlign.end,
                                                style: commonTextStyle12(
                                                    color: primaryDark),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                              height: ResponsiveHelper.height(
                                                      context) *
                                                  0.01),
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
                                                      '${item.message}',
                                                      style: commonTextStyle12(
                                                          color: black),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          if (item.leaderName != null &&
                                              item.leaderName!.isNotEmpty &&
                                              role.roleType ==
                                                  getRoleType(
                                                      RoleEnum.teacher)) ...[
                                            Text(
                                              'Assign : ${item.leaderName} (${item.replyMessage ?? ''})',
                                              textAlign: TextAlign.start,
                                              style: commonTextStyle12(
                                                  color: black),
                                            ),
                                          ] else if (role.roleType ==
                                              getRoleType(RoleEnum.leader)) ...[
                                            Text(
                                              'Request By : ${item.executiveName} (${item.message ?? ''})',
                                              textAlign: TextAlign.start,
                                              style: commonTextStyle12(
                                                  color: black),
                                            ),
                                          ],
                                          SizedBox(height: 10),
                                        ],
                                      ),
                                    )),
                                  );
                                }),
                          )
                        : SizedBox.shrink()
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
