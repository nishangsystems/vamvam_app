import 'dart:io';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/data/model/response/representative/repComplaintModel.dart';
import 'package:vam_vam/data/model/response/user/complaintModel.dart';
import 'package:vam_vam/helpers/commonHelper.dart';
import 'package:vam_vam/helpers/dateTimeHelper.dart';
import 'package:vam_vam/helpers/imageHelper.dart';
import 'package:vam_vam/helpers/regexHelper.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/addComplaintProvider.dart';
import 'package:vam_vam/providers/appointmentProvider.dart';
import 'package:vam_vam/providers/dialogProvider.dart';
import 'package:vam_vam/providers/profileprovider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/providers/settingProvider.dart';
import 'package:vam_vam/screens/audio/audioScreen.dart';
import 'package:vam_vam/screens/photo/photoViewScreen.dart';
import 'package:vam_vam/screens/video/videoScreen.dart';
import 'package:vam_vam/utils/apiConstant.dart';
import 'package:vam_vam/widgets/commonWidgets/textStyle.dart';

import '../utils/colors.dart';
import '../utils/fontConstant.dart';
import '../utils/imageResources.dart';
import '../utils/paddingConstant.dart';
import '../widgets/commonWidgets/appDesign.dart';
import '../widgets/commonWidgets/commonWidgets.dart';
import '../widgets/commonWidgets/customTextFormField.dart';
import '../widgets/dottedBorder.dart';

void showComplaintDialog({required BuildContext context}) {
  final TextEditingController writeCommentsEditingController =
      TextEditingController();
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Consumer<DialogProvider>(
            builder: (context, data, child) => WillPopScope(
              onWillPop: () async {
                data.clearPickedAttachment();
                return true;
              },
              child: Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: white,
                  ),
                  height: 450,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Rate Your Experience",
                                style: commonTextStyle13(color: black)),
                            const Spacer(),
                            Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                    onTap: () {
                                      context.pop();
                                    },
                                    child: const Icon(Icons.cancel_outlined,
                                        size: 18, color: black))),
                          ],
                        ),
                      ),
                      dividerContainer,
                      customRatingBar(initial: 2.0),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                      //   child: Container(
                      //       // height: 45,
                      //       width: double.infinity,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(10.0),
                      //         border: Border.all(color: black.withOpacity(0.1)),
                      //       ),
                      //       child: Column(
                      //         children: [

                      //           Text('Over all your rating',
                      //               style: commonTextStyle12(color: black)),

                      //           SizedBox(
                      //               height:
                      //                   ResponsiveHelper.height(context) * 0.01),
                      //         ],
                      //       )),
                      // ),
                      SizedBox(height: 10),
                      Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: black.withOpacity(0.1)),
                              color: Colors.grey.shade100),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: customTextFormField(
                                textRegex: nameRegex,
                                controller: writeCommentsEditingController,
                                title: 'write comments...',
                                length: 200,
                                keyboardType: TextInputType.text,
                                color: black.withOpacity(0.5),
                                fontSize: 13),
                          )),
                      SizedBox(height: 5),
                      data.pickedAttachments.length != 3
                          ? Bounce(
                              duration: Duration(milliseconds: 100),
                              onPressed: () => data.pickAttachment(),
                              child: Row(
                                children: [
                                  SizedBox(width: 5),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '+',
                                        style: TextStyle(color: primaryDark),
                                      )),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Add Attachments',
                                    style:
                                        commonTextStyle12(color: primaryDark),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox.shrink(),
                      data.pickedAttachments.isNotEmpty
                          ? SizedBox(
                              width: ResponsiveHelper.width(context),
                              height: 100,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  physics: AlwaysScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: data.pickedAttachments.length,
                                  itemBuilder: (context, index) {
                                    var item = data.pickedAttachments[index];
                                    return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: Container(
                                            width: ResponsiveHelper.width(
                                                    context) *
                                                0.75,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 14, vertical: 10),
                                            decoration: BoxDecoration(
                                                color: white.withOpacity(0.5),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: Stack(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      item.name,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: TextStyle(
                                                          color: primaryDark,
                                                          fontSize:
                                                              FontConstant.m,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    SizedBox(
                                                      width: 3,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        '(${ImageHelper().formatFileSize(item.size)})',
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow.clip,
                                                        style: TextStyle(
                                                            color: black,
                                                            fontSize:
                                                                FontConstant.m,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    Bounce(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      onPressed: () => data
                                                          .removePickedAttachment(
                                                              index),
                                                      child: Icon(
                                                        Icons.clear_rounded,
                                                        size: 16,
                                                        color: black
                                                            .withOpacity(0.5),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )));
                                  }),
                            )
                          : SizedBox(
                              height: 50,
                            ),

                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Bounce(
                              duration: const Duration(milliseconds: 110),
                              onPressed: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  boxShadow: const [],
                                  border: Border.all(
                                      color: primaryDark.withOpacity(0.1)),
                                ),
                                height: 40,
                                margin: const EdgeInsets.only(right: 5),
                                child: Center(
                                  child: Text('Skip',
                                      style: commonTextStyle13(
                                          color: primaryDark)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Bounce(
                              duration: const Duration(milliseconds: 110),
                              onPressed: () {},
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
                                        color: primaryDark.withOpacity(0.1)),
                                    color: primaryDark),
                                margin: const EdgeInsets.only(left: 5),
                                child: Center(
                                    child: Text('Submit Review',
                                        style:
                                            commonTextStyle13(color: white))),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: ResponsiveHelper.height(context) * 0.02),
                    ],
                  ),
                ),
              ),
            ),
          ));
}

void showCalenderDialog({required BuildContext context}) {
  final TextEditingController startDateTextEditingController =
      TextEditingController();

  final TextEditingController writePurposeTextEditingController =
      TextEditingController();

  String? dropdownValue;

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
            insetPadding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: white,
              ),
              height: ResponsiveHelper.height(context) * 0.55,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: ResponsiveHelper.height(context) * 0.02),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                                onTap: () {
                                  context.pop();
                                },
                                child: const Icon(Icons.cancel_outlined,
                                    size: 18, color: black))),
                      ),
                      dividerContainer,
                      Container(
                        color: Colors.grey[100],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              SizedBox(
                                  height:
                                      ResponsiveHelper.height(context) * 0.03),
                              commonContainer(
                                width: ResponsiveHelper.width(context),
                                height: ResponsiveHelper.height(context) * 0.06,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: PaddingConstant.l,
                                      right: PaddingConstant.l),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      value: dropdownValue,
                                      isExpanded: true,
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      hint: const Text('Select Time',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: black,
                                              fontSize: 12)),
                                      items: items.map((String items) {
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
                                      onChanged: (String? newValue) {
                                        dropdownValue = newValue!;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height:
                                      ResponsiveHelper.height(context) * 0.02),
                              commonContainer(
                                width: ResponsiveHelper.width(context),
                                height: ResponsiveHelper.height(context) * 0.06,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: PaddingConstant.l,
                                      right: PaddingConstant.l),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller:
                                              startDateTextEditingController,
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.done,
                                          maxLength: 40,
                                          style: const TextStyle(
                                              color: black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800),
                                          decoration: const InputDecoration(
                                              counterText: '',
                                              hintText: 'Choose Date ',
                                              hintStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: black,
                                                  fontSize: 12),
                                              border: InputBorder.none),
                                          readOnly: true,
                                          onTap: () async {
                                            DateTime? pickedDate =
                                                await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1950),
                                                    //DateTime.now() - not to allow to choose before today.
                                                    lastDate: DateTime.now());

                                            if (pickedDate != null) {
                                              print(
                                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                              String formattedDate =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(pickedDate);
                                              print(
                                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                                              //   setState(() {
                                              startDateTextEditingController
                                                      .text =
                                                  formattedDate; //set output date to TextField value.
                                              // });
                                            } else {}
                                          },
                                        ),
                                      ),
                                      Image.asset(IconResource.calenderIcon,
                                          height: 20)
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height:
                                      ResponsiveHelper.height(context) * 0.02),
                              commonContainer(
                                height: 100,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: Column(
                                    children: [
                                      customTextFormField(
                                          textRegex: nameRegex,
                                          controller:
                                              writePurposeTextEditingController,
                                          keyboardType: TextInputType.name,
                                          title: 'Enter Description.....',
                                          length: 100,
                                          color: black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                      SizedBox(
                                          width:
                                              ResponsiveHelper.width(context) *
                                                  0.02),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                            height: ResponsiveHelper.height(
                                                    context) *
                                                0.05,
                                            width: ResponsiveHelper.width(
                                                    context) *
                                                0.10,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Image.asset(IconResource
                                                  .addComplaintIcon3),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height:
                                      ResponsiveHelper.height(context) * 0.08),
                              Row(
                                children: [
                                  Expanded(
                                    child: Bounce(
                                      duration:
                                          const Duration(milliseconds: 110),
                                      onPressed: () {
                                        context.pop();
                                      },
                                      child: Container(
                                        height: 45,
                                        width: ResponsiveHelper.width(context) *
                                            0.3,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8)),
                                          border: Border.all(
                                              color:
                                                  primaryDark.withOpacity(0.1)),
                                        ),
                                        margin: const EdgeInsets.only(left: 5),
                                        child: Center(
                                            child: Text('Cancel',
                                                style: commonTextStyle13(
                                                    color: Colors.black))),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: commonButtonWhite(
                                        width: double.infinity,
                                        bgColors: [primaryDark, primaryDark],
                                        title: 'Save',
                                        txtColor: white,
                                        fontSize: 12,
                                        onTap: () {}),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height:
                                      ResponsiveHelper.height(context) * 0.02),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ));
}

void showRepresantativeComplaintDialog(
    {required BuildContext context, required RepCompaintModelData item}) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
            insetPadding: EdgeInsets.all(14),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: white,
              ),
              height: 500,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(height: ResponsiveHelper.height(context) * 0.02),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Image.asset(
                                IconResource.complaintStatusIcon2,
                                height: 22,
                                width: 22),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${item.statusString}',
                                  style: commonTextStyle12(color: primaryDark)),
                              Text(
                                  DateTimeHelper.getUserDate(
                                      '${item.complaintDate}'),
                                  style: commonTextStyle12(color: primaryDark)),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            'Ticket No : #${item.complaintCode}',
                            textAlign: TextAlign.end,
                            style: commonTextStyle12(color: primaryDark),
                          ),
                          const SizedBox(width: 2),
                          Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                  onTap: () {
                                    context.pop();
                                  },
                                  child: const Icon(Icons.cancel_outlined,
                                      size: 18, color: black))),
                        ],
                      ),
                    ),
                    dividerContainer,
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                          child: Container(
                              width: double.infinity,
                              height: 370,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border:
                                      Border.all(color: black.withOpacity(0.1)),
                                  color: dialogBoxGrey),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 16.0, right: 16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                                'Name : ${item.userName}',
                                                style: commonTextStyle12(
                                                    color: black)),
                                          ),
                                          Expanded(
                                            child: Text(
                                                'Ticket No. : ${item.assignComplaintId}',
                                                style: commonTextStyle12(
                                                    color: black)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 4.0, right: 4.0),
                                      child: dividerContainer,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 16.0, right: 16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                                'Department : ${item.departmentName}',
                                                maxLines: 1,
                                                style: commonTextStyle12(
                                                    color: black)),
                                          ),
                                          Expanded(
                                            child: Text(
                                                'Issue : ${item.issueTypeName}',
                                                style: commonTextStyle12(
                                                    color: black)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 4.0, right: 4.0),
                                      child: dividerContainer,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 16.0, right: 16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                                'Phone No : +91${item.userMobile}',
                                                style: commonTextStyle12(
                                                    color: black)),
                                          ),
                                          Expanded(
                                            child: Text(
                                                'Date : ${DateTimeHelper.getUserDate('${item.complaintDate}')}',
                                                style: commonTextStyle12(
                                                    color: black)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 4.0, right: 4.0),
                                      child: dividerContainer,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 16.0, right: 16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                                'Address : ${item.address}',
                                                style: commonTextStyle12(
                                                    color: black)),
                                          )
                                          // Text('Assign To : ${item.}',
                                          //     style: commonTextStyle12(color: black)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 4.0, right: 4.0),
                                      child: dividerContainer,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 16.0, right: 16.0),
                                      child: Text('Details: ',
                                          style:
                                              commonTextStyle12(color: black)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 16.0, right: 16.0),
                                      child: Text('${item.message}',
                                          style:
                                              commonTextStyle11(color: black)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          left: 16.0,
                                          right: 16.0,
                                          bottom: 5),
                                      child: Text('Attachment : ',
                                          style:
                                              commonTextStyle12(color: black)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SizedBox(
                                        height: 160,
                                        child: GridView.builder(
                                          itemCount: item.complaintFile!.length,
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  crossAxisSpacing: 10.0,
                                                  mainAxisSpacing: 10.0,
                                                  childAspectRatio: 2.3 / 1.6),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return GestureDetector(
                                              onTap: () {
                                                item.complaintFile![index]
                                                            .fileType ==
                                                        'mp3'
                                                    ? showAudioPlayerDialog(
                                                        context,
                                                        '${ApiConstant.baseUrl}/${item.complaintFile![index].filePath}')
                                                    : item.complaintFile![index]
                                                                .fileType ==
                                                            'mp4'
                                                        ? Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    VideoScreen(
                                                                        isNetwork:
                                                                            true,
                                                                        video:
                                                                            '${ApiConstant.baseUrl}/${item.complaintFile![index].filePath}')))
                                                        : Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        PhotoViewScreen(
                                                                          url:
                                                                              '${ApiConstant.baseUrl}/${item.complaintFile![index].filePath}',
                                                                          isNetwork:
                                                                              true,
                                                                        )));
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: FancyShimmerImage(
                                                    height: 70,
                                                    width: 70,
                                                    errorWidget: Container(
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        decoration: BoxDecoration(
                                                            color: white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                        child: item
                                                                    .complaintFile![
                                                                        index]
                                                                    .fileType ==
                                                                'mp3'
                                                            ? Image.asset(
                                                                IconResource
                                                                    .micIcon)
                                                            : item.complaintFile![index].fileType ==
                                                                    'mp4'
                                                                ? Image.asset(
                                                                    IconResource
                                                                        .playIcon)
                                                                : Icon(
                                                                    Icons
                                                                        .error_outline_rounded,
                                                                    color:
                                                                        errorColor,
                                                                  )),
                                                    imageUrl:
                                                        '${ApiConstant.baseUrl}/${item.complaintFile![index].filePath}'),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ));
}

void showUserComplaintDialog(
    {required BuildContext context, required ComplaintModelData item}) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
            insetPadding: EdgeInsets.all(14),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Consumer<ProfileProvider>(
              builder: (context, profileProvider, child) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: white,
                ),
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      SizedBox(height: ResponsiveHelper.height(context) * 0.02),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                  color: getStatusColor('${item.statusString}'),
                                  shape: BoxShape.circle),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${item.statusString}',
                                    style:
                                        commonTextStyle12(color: primaryDark)),
                                Text(
                                    DateTimeHelper.getUserDate(
                                        '${item.complaintDate}'),
                                    style:
                                        commonTextStyle12(color: primaryDark)),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              'Ticket No : #${item.complaintCode}',
                              textAlign: TextAlign.end,
                              style: commonTextStyle12(color: primaryDark),
                            ),
                            const SizedBox(width: 2),
                            Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                    onTap: () {
                                      context.pop();
                                    },
                                    child: const Icon(Icons.cancel_outlined,
                                        size: 18, color: black))),
                          ],
                        ),
                      ),
                      dividerContainer,
                      SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 2.0, bottom: 2.0),
                            child: Container(
                                width: double.infinity,
                                height: 370,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: black.withOpacity(0.1)),
                                    color: dialogBoxGrey),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 16.0, right: 16.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  'Name : ${profileProvider.userProfileInfo.name ?? ''}',
                                                  style: commonTextStyle12(
                                                      color: black)),
                                            ),
                                            Expanded(
                                              child: Text(
                                                  'Ticket No. : ${item.complaintCode}',
                                                  style: commonTextStyle12(
                                                      color: black)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 4.0, right: 4.0),
                                        child: dividerContainer,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 16.0, right: 16.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  'Department : ${item.departmentInfo}',
                                                  maxLines: 1,
                                                  style: commonTextStyle12(
                                                      color: black)),
                                            ),
                                            Expanded(
                                              child: Text(
                                                  'Issue : ${item.issueInfo}',
                                                  style: commonTextStyle12(
                                                      color: black)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 4.0, right: 4.0),
                                        child: dividerContainer,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 16.0, right: 16.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  'Phone No :${profileProvider.userProfileInfo.mobile ?? ''} ',
                                                  style: commonTextStyle12(
                                                      color: black)),
                                            ),
                                            Expanded(
                                              child: Text(
                                                  'Date : ${DateTimeHelper.getUserDate('${item.complaintDate}')}',
                                                  style: commonTextStyle12(
                                                      color: black)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 4.0, right: 4.0),
                                        child: dividerContainer,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 16.0, right: 16.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  'Address : ${item.address}',
                                                  style: commonTextStyle12(
                                                      color: black)),
                                            )
                                            // Text('Assign To : ${item.}',
                                            //     style: commonTextStyle12(color: black)),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 4.0, right: 4.0),
                                        child: dividerContainer,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 16.0, right: 16.0),
                                        child: Text('Details: ',
                                            style: commonTextStyle12(
                                                color: black)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 16.0, right: 16.0),
                                        child: Text('${item.message}',
                                            style: commonTextStyle11(
                                                color: black)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5,
                                            left: 16.0,
                                            right: 16.0,
                                            bottom: 5),
                                        child: Text('Attachment : ',
                                            style: commonTextStyle12(
                                                color: black)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: SizedBox(
                                          height: 160,
                                          child: GridView.builder(
                                            itemCount:
                                                item.complaintFile!.length,
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    crossAxisSpacing: 10.0,
                                                    mainAxisSpacing: 10.0,
                                                    childAspectRatio:
                                                        2.3 / 1.6),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  item.complaintFile![index]
                                                              .fileType ==
                                                          'mp3'
                                                      ? showAudioPlayerDialog(
                                                          context,
                                                          '${ApiConstant.baseUrl}/${item.complaintFile![index].filePath}')
                                                      : item
                                                                  .complaintFile![
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
                                                                          '${ApiConstant.baseUrl}/${item.complaintFile![index].filePath}')))
                                                          : Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          PhotoViewScreen(
                                                                            url:
                                                                                '${ApiConstant.baseUrl}/${item.complaintFile![index].filePath}',
                                                                            isNetwork:
                                                                                true,
                                                                          )));
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: FancyShimmerImage(
                                                      height: 70,
                                                      width: 70,
                                                      errorWidget: Container(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          decoration: BoxDecoration(
                                                              color: white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                          child: item
                                                                      .complaintFile![
                                                                          index]
                                                                      .fileType ==
                                                                  'mp3'
                                                              ? Image.asset(
                                                                  IconResource
                                                                      .micIcon)
                                                              : item
                                                                          .complaintFile![
                                                                              index]
                                                                          .fileType ==
                                                                      'mp4'
                                                                  ? Image.asset(
                                                                      IconResource
                                                                          .playIcon)
                                                                  : Icon(
                                                                      Icons
                                                                          .error_outline_rounded,
                                                                      color:
                                                                          errorColor,
                                                                    )),
                                                      imageUrl:
                                                          '${ApiConstant.baseUrl}/${item.complaintFile![index].filePath}'),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ));
}

void showComplaintStatusDialog({required BuildContext context}) {
  final TextEditingController commentEditingController =
      TextEditingController();

  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
            insetPadding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: white,
              ),
              height: ResponsiveHelper.height(context) * 0.75,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: ResponsiveHelper.height(context) * 0.02),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Image.asset(
                                  IconResource.complaintStatusIcon2,
                                  height: 22,
                                  width: 22),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Active',
                                    style:
                                        commonTextStyle12(color: primaryDark)),
                                Text('24.Aug.2023',
                                    style:
                                        commonTextStyle12(color: primaryDark)),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              'Ticket No : #121',
                              textAlign: TextAlign.end,
                              style: commonTextStyle12(color: primaryDark),
                            ),
                            const SizedBox(width: 2),
                            Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                    onTap: () {
                                      context.pop();
                                    },
                                    child: const Icon(Icons.cancel_outlined,
                                        size: 18, color: black))),
                          ],
                        ),
                      ),
                      dividerContainer,
                      SizedBox(height: ResponsiveHelper.height(context) * 0.01),
                      Image.asset(
                        IconResource.iconCheck,
                        height: ResponsiveHelper.height(context) * 0.08,
                        width: ResponsiveHelper.width(context) * 0.16,
                      ),
                      Text('Verified!', style: commonTextStyle20(color: black)),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border:
                                    Border.all(color: black.withOpacity(0.1)),
                                color: dialogBoxGrey),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, left: 16.0, right: 16.0, bottom: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Add Comments',
                                      style: commonTextStyle12(color: black)),
                                  SizedBox(
                                      height: ResponsiveHelper.height(context) *
                                          0.01),
                                  commonContainer(
                                    height: 60,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, right: 16),
                                      child: Column(
                                        children: [
                                          customTextFormField(
                                              textRegex: nameRegex,
                                              controller:
                                                  commentEditingController,
                                              keyboardType: TextInputType.name,
                                              title: 'Write Your Purpose',
                                              length: 100,
                                              color: black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                          SizedBox(
                                              width: ResponsiveHelper.width(
                                                      context) *
                                                  0.01),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height: ResponsiveHelper.height(context) *
                                          0.02),
                                  Text('Add Attachment',
                                      style: commonTextStyle12(color: black)),
                                  SizedBox(
                                      height: ResponsiveHelper.height(context) *
                                          0.01),
                                  Center(
                                    child: CustomPaint(
                                      painter: DottedBorderPainter(),
                                      isComplex: true,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16.0,
                                            right: 16,
                                            top: 5,
                                            bottom: 5),
                                        child: Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              width: ResponsiveHelper.width(
                                                      context) *
                                                  0.42,
                                              height: ResponsiveHelper.height(
                                                      context) *
                                                  0.06,
                                              decoration: BoxDecoration(
                                                  color: primaryDark,
                                                  border:
                                                      Border.all(color: white),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12.0,
                                                    right: 12,
                                                    top: 2,
                                                    bottom: 2),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                        decoration: BoxDecoration(
                                                            color: white,
                                                            border: Border.all(
                                                                color: white),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        60)),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  4.0),
                                                          child: Icon(Icons.add,
                                                              color:
                                                                  primaryDark),
                                                        )),
                                                    const SizedBox(width: 20),
                                                    Text('Upload File',
                                                        style:
                                                            commonTextStyle12(
                                                                color: white)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                                height: ResponsiveHelper.height(
                                                        context) *
                                                    0.01),
                                            Text('Drag & Drop File/Folder Here',
                                                style: commonTextStyle12(
                                                    color: black)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height: ResponsiveHelper.height(context) *
                                          0.01),
                                  Text('Uploaded File',
                                      style: commonTextStyle12(color: black)),
                                  SizedBox(
                                      height: ResponsiveHelper.height(context) *
                                          0.01),
                                  SizedBox(
                                    height:
                                        ResponsiveHelper.height(context) * 0.16,
                                    child: GridView.builder(
                                      itemCount: 6,
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              crossAxisSpacing: 4.0,
                                              mainAxisSpacing: 4.0,
                                              childAspectRatio: 3 / 1.5),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                  color:
                                                      black.withOpacity(0.1)),
                                              color: white),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                      height: ResponsiveHelper.height(context) *
                                          0.01),
                                ],
                              ),
                            )),
                      ),
                      SizedBox(height: ResponsiveHelper.height(context) * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Bounce(
                            duration: const Duration(milliseconds: 110),
                            onPressed: () {
                              context.pop();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  boxShadow: const [],
                                  border:
                                      Border.all(color: black.withOpacity(0.1)),
                                  color: white),
                              height: 30,
                              width: ResponsiveHelper.width(context) * 0.3,
                              margin: const EdgeInsets.only(right: 5),
                              child: Center(
                                child: Text('Close',
                                    style:
                                        commonTextStyle13(color: primaryDark)),
                              ),
                            ),
                          ),
                          Bounce(
                            duration: const Duration(milliseconds: 110),
                            onPressed: () {
                              context.pop();
                            },
                            child: Container(
                              height: 30,
                              width: ResponsiveHelper.width(context) * 0.3,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 2.0, color: primaryDark),
                                  ],
                                  border: Border.all(
                                      color: primaryDark.withOpacity(0.1)),
                                  color: primaryDark),
                              margin: const EdgeInsets.only(left: 5),
                              child: Center(
                                  child: Text('Submit',
                                      style: commonTextStyle13(color: white))),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: ResponsiveHelper.height(context) * 0.02),
                    ],
                  ),
                ),
              ),
            ),
          ));
}

void showWithdrawDialog(
    {required BuildContext context, required String complaintId}) {
  showDialog(
      context: context,
      builder: (context) {
        return Platform.isAndroid
            ? Consumer<AddComplaintProvider>(
                builder: (context, complaint, child) => AlertDialog(
                  title: Text(
                    'Withdraw Complaint',
                    style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: FontConstant.l),
                  ),
                  content:
                      Text('Are you sure want to withdraw your complaint?'),
                  actions: [
                    commonButton(
                        width: 70,
                        onTap: () => context.pop(),
                        child: Text(
                          'No',
                          style: TextStyle(color: white),
                        )),
                    commonButton(
                        width: 100,
                        onTap: () {
                          context.pop();
                          complaint
                              .withdrawComplaint(complaintId)
                              .then((value) {
                            if (value.isSuccess) {
                              successToast(msg: value.message);
                            } else {
                              errorToast(msg: value.message);
                            }
                          });
                        },
                        child: Text(
                          'Withdraw',
                          style: TextStyle(color: white),
                        )),
                  ],
                ),
              )
            : Consumer<AddComplaintProvider>(
                builder: (context, complaint, child) => CupertinoAlertDialog(
                  title: Text(
                    'Withdraw Complaint',
                    style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: FontConstant.l),
                  ),
                  content:
                      Text('Are you sure want to withdraw your complaint?'),
                  actions: [
                    commonButton(
                        width: 70,
                        onTap: () => context.pop(),
                        child: Text(
                          'No',
                          style: TextStyle(color: white),
                        )),
                    commonButton(
                        width: 100,
                        onTap: () {
                          context.pop();
                          complaint
                              .withdrawComplaint(complaintId)
                              .then((value) {
                            if (value.isSuccess) {
                              successToast(msg: value.message);
                            } else {
                              errorToast(msg: value.message);
                            }
                          });
                        },
                        child: Text(
                          'Withdraw',
                          style: TextStyle(color: white),
                        )),
                  ],
                ),
              );
      });
}

showDeleteDialog(BuildContext context,
    {required Function() onDelete,
    required String title,
    required String subTitle}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder: (_, __, ___) {
      return AlertDialog(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            letterSpacing: 0.3,
            color: black,
          ),
        ),
        content: Text(
          subTitle,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            letterSpacing: 0.3,
            color: Color(0xff212121),
          ),
        ),
        actions: [
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Text(
              'No     ',
              style: TextStyle(
                fontSize: 14,
                color: primaryLight,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
          ),
          InkWell(
            onTap: onDelete,
            child: Text(
              'Yes',
              style: TextStyle(
                fontSize: 14,
                color: primaryLight,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
          )
        ],
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return FadeTransition(
        opacity: anim,
        child: child,
      );
    },
  );
}

void showReopenComplaintDialog(
    {required BuildContext context,
    required String complaintId,
    required String filterBy}) {
  showDialog(
      context: context,
      builder: (context) {
        return Platform.isAndroid
            ? Consumer2<AddComplaintProvider, AuthProvider>(
                builder: (context, complaint, auth, child) => AlertDialog(
                  title: Text(
                    'Reopen Complaint',
                    style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: FontConstant.l),
                  ),
                  content: Text('Are you sure want to reopen your complaint?'),
                  actions: [
                    commonButton(
                        width: 70,
                        onTap: () => context.pop(),
                        child: Text(
                          'No',
                          style: TextStyle(color: white),
                        )),
                    commonButton(
                        width: 100,
                        onTap: () {
                          context.pop();
                          complaint.reopenComplaint(complaintId).then((value) {
                            if (value.isSuccess) {
                              successToast(msg: value.message);
                              complaint.getComplaints(
                                  auth.getUserId(), filterBy, context);
                            } else {
                              errorToast(msg: value.message);
                            }
                          });
                        },
                        child: Text(
                          'Reopen',
                          style: TextStyle(color: white),
                        )),
                  ],
                ),
              )
            : Consumer<AddComplaintProvider>(
                builder: (context, complaint, child) => CupertinoAlertDialog(
                  title: Text(
                    'Withdraw Complaint',
                    style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: FontConstant.l),
                  ),
                  content:
                      Text('Are you sure want to withdraw your complaint?'),
                  actions: [
                    commonButton(
                        width: 70,
                        onTap: () => context.pop(),
                        child: Text(
                          'No',
                          style: TextStyle(color: white),
                        )),
                    commonButton(
                        width: 100,
                        onTap: () {
                          context.pop();
                          complaint
                              .withdrawComplaint(complaintId)
                              .then((value) {
                            if (value.isSuccess) {
                              successToast(msg: value.message);
                            } else {
                              errorToast(msg: value.message);
                            }
                          });
                        },
                        child: Text(
                          'Withdraw',
                          style: TextStyle(color: white),
                        )),
                  ],
                ),
              );
      });
}

void showDeleteAccountDialog({required BuildContext context}) {
  showDialog(
      context: context,
      builder: (context) {
        return Consumer3<SettingProvider, AuthProvider, RoleProvider>(
          builder: (context, data, auth, role, child) => Platform.isAndroid
              ? AlertDialog(
                  title: Text(
                    'Delete Account',
                    style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: FontConstant.l),
                  ),
                  content: Text('Are you sure want to delete your account?'),
                  actions: [
                    commonButton(
                        width: 70,
                        onTap: () => context.pop(),
                        child: Text(
                          'NO',
                          style: TextStyle(color: white),
                        )),
                    commonButton(
                        width: 100,
                        onTap: () {
                          data
                              .deleteAccount(
                                  auth.getUserId(), context, role.roleType)
                              .then((value) {
                            if (value.isSuccess) {
                              auth.logout(context);
                              successToast(
                                msg: value.message,
                              );
                            } else {
                              context.pop();
                              errorToast(
                                msg: value.message,
                              );
                            }
                          });
                        },
                        child: Text(
                          'YES',
                          style: TextStyle(color: white),
                        )),
                  ],
                )
              : CupertinoAlertDialog(
                  title: Text(
                    'Delete Account',
                    style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: FontConstant.l),
                  ),
                  content: Text('Are you sure want to delete your account?'),
                  actions: [
                    commonButton(
                        width: 70,
                        onTap: () => context.pop(),
                        child: Text(
                          'NO',
                          style: TextStyle(color: white),
                        )),
                    commonButton(
                        width: 100,
                        onTap: () => context.pop(),
                        child: Text(
                          'YES',
                          style: TextStyle(color: white),
                        )),
                  ],
                ),
        );
      });
}

void unAuthenticatedPopUp({required BuildContext context}) {
  showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Consumer<AuthProvider>(
        builder: (context, auth, child) => WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: Platform.isAndroid
              ? AlertDialog(
                  title: Text(
                    'Already Logged In!',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  content: Text('You are logged in another device.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () async {
                        auth.logout(context);
                      },
                      child: Text(
                        'LOG OUT',
                        style: TextStyle(color: errorColor),
                      ),
                    ),
                  ],
                )
              : CupertinoAlertDialog(
                  title: Text(
                    'Already Logged In!',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  content: Text('You are logged in another device.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () async {
                        auth.logout(context);
                      },
                      child: Text(
                        'LOG OUT',
                        style: TextStyle(color: errorColor),
                      ),
                    ),
                  ],
                ),
        ),
      );
    },
  );
}

showAudioPlayerDialog(BuildContext context, String url) {
  print(url);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AudioScreen(
        audioUrl: url, // Replace with your audio URL or file path
      );
    },
  );
}

void showViewComplaintDialog(
    {required BuildContext context, required ComplaintModelData item}) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
            insetPadding: EdgeInsets.all(14),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: white,
              ),
              height: 500,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(height: ResponsiveHelper.height(context) * 0.02),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        getStatusColor('${item.statusString}')),
                              )),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${item.statusString}',
                                  style: commonTextStyle12(color: primaryDark)),
                              Text(
                                  DateTimeHelper.getUserDate(
                                      '${item.complaintDate}'),
                                  style: commonTextStyle12(color: primaryDark)),
                            ],
                          ),
                          const Spacer(),
                          const SizedBox(width: 2),
                          Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                  onTap: () {
                                    context.pop();
                                  },
                                  child: const Icon(Icons.cancel_outlined,
                                      size: 18, color: black))),
                        ],
                      ),
                    ),
                    dividerContainer,
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                          child: Container(
                              width: double.infinity,
                              height: 370,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border:
                                      Border.all(color: black.withOpacity(0.1)),
                                  color: dialogBoxGrey),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 16.0, right: 16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                                'Address : ${item.address}',
                                                style: commonTextStyle12(
                                                    color: black)),
                                          )
                                          // Text('Assign To : ${item.}',
                                          //     style: commonTextStyle12(color: black)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 4.0, right: 4.0),
                                      child: dividerContainer,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 16.0, right: 16.0),
                                      child: Text('Details: ',
                                          style:
                                              commonTextStyle12(color: black)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 16.0, right: 16.0),
                                      child: Text('${item.message}',
                                          style:
                                              commonTextStyle11(color: black)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          left: 16.0,
                                          right: 16.0,
                                          bottom: 5),
                                      child: Text('Attachment : ',
                                          style:
                                              commonTextStyle12(color: black)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SizedBox(
                                        height: 160,
                                        child: GridView.builder(
                                          itemCount: item.complaintFile!.length,
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  crossAxisSpacing: 10.0,
                                                  mainAxisSpacing: 10.0,
                                                  childAspectRatio: 2.3 / 1.6),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return GestureDetector(
                                              onTap: () {
                                                item.complaintFile![index]
                                                            .fileType ==
                                                        'mp3'
                                                    ? showAudioPlayerDialog(
                                                        context,
                                                        '${ApiConstant.baseUrl}/${item.complaintFile![index].filePath}')
                                                    : item.complaintFile![index]
                                                                .fileType ==
                                                            'mp4'
                                                        ? Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    VideoScreen(
                                                                        isNetwork:
                                                                            true,
                                                                        video:
                                                                            '${ApiConstant.baseUrl}/${item.complaintFile![index].filePath}')))
                                                        : Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        PhotoViewScreen(
                                                                          url:
                                                                              '${ApiConstant.baseUrl}/${item.complaintFile![index].filePath}',
                                                                          isNetwork:
                                                                              true,
                                                                        )));
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: FancyShimmerImage(
                                                    height: 70,
                                                    width: 70,
                                                    errorWidget: Container(
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        decoration: BoxDecoration(
                                                            color: white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                        child: item
                                                                    .complaintFile![
                                                                        index]
                                                                    .fileType ==
                                                                'mp3'
                                                            ? Image.asset(
                                                                IconResource
                                                                    .micIcon)
                                                            : item.complaintFile![index].fileType ==
                                                                    'mp4'
                                                                ? Image.asset(
                                                                    IconResource
                                                                        .playIcon)
                                                                : Icon(
                                                                    Icons
                                                                        .error_outline_rounded,
                                                                    color:
                                                                        errorColor,
                                                                  )),
                                                    imageUrl:
                                                        '${ApiConstant.baseUrl}/${item.complaintFile![index].filePath}'),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Bounce(
                        //       duration: const Duration(milliseconds: 110),
                        //       onPressed: () {
                        //         context.pop();
                        //         showComplaintStatusDialog(context: context);
                        //       },
                        //       child: Container(
                        //         decoration: BoxDecoration(
                        //             borderRadius: const BorderRadius.all(
                        //                 Radius.circular(8)),
                        //             boxShadow: const [],
                        //             border: Border.all(
                        //                 color: primaryDark.withOpacity(0.1)),
                        //             color: primaryDark),
                        //         height: 30,
                        //         width: ResponsiveHelper.width(context) * 0.3,
                        //         margin: const EdgeInsets.only(right: 5),
                        //         child: Center(
                        //           child: Text('Verify',
                        //               style: commonTextStyle13(color: white)),
                        //         ),
                        //       ),
                        //     ),
                        //     Bounce(
                        //       duration: const Duration(milliseconds: 110),
                        //       onPressed: () {
                        //         context.pop();
                        //       },
                        //       child: Container(
                        //         height: 30,
                        //         width: ResponsiveHelper.width(context) * 0.3,
                        //         decoration: BoxDecoration(
                        //             borderRadius: const BorderRadius.all(
                        //                 Radius.circular(8)),
                        //             boxShadow: const [
                        //               BoxShadow(blurRadius: 2.0, color: red),
                        //             ],
                        //             border: Border.all(
                        //                 color: primaryDark.withOpacity(0.1)),
                        //             color: red),
                        //         margin: const EdgeInsets.only(left: 5),
                        //         child: Center(
                        //             child: Text('Cancel',
                        //                 style:
                        //                     commonTextStyle13(color: white))),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ));
}

void showAppointmentExcDeleteDialog(
    {required BuildContext context,
    required String executiveId,
    required String appointmentId}) {
  showDialog(
      context: context,
      builder: (context) {
        return Consumer<AppointmentProvider>(
          builder: (context, appoinment, child) => AlertDialog(
            title: Text(
              'Alert!',
              style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.w500,
                  fontSize: FontConstant.l),
            ),
            content: Text('Are you sure want to Delete Appointment?'),
            actions: [
              commonButton(
                  width: 70,
                  onTap: () => context.pop(),
                  child: Text(
                    'No',
                    style: TextStyle(color: white),
                  )),
              commonButton(
                  width: 100,
                  onTap: () {
                    context.pop();
                    context.pop();
                    appoinment
                        .deleteBookAppointment(appointmentId, executiveId)
                        .then((value) {
                      if (value.isSuccess) {
                        successToast(msg: value.message);
                        appoinment.repGetAppointment;
                      } else {
                        errorToast(msg: value.message);
                      }
                    });
                  },
                  child: Text(
                    'Yes',
                    style: TextStyle(color: white),
                  )),
            ],
          ),
        );
      });
}

void showAppointmentUserDeleteDialog(
    {required BuildContext context,
    required String userId,
    required String appointmentId}) {
  showDialog(
      context: context,
      builder: (context) {
        return Consumer<AppointmentProvider>(
          builder: (context, appoinments, child) => AlertDialog(
            title: Text(
              'Alert!',
              style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.w500,
                  fontSize: FontConstant.l),
            ),
            content: Text('Are you sure want to Delete Appointment?'),
            actions: [
              commonButton(
                  width: 70,
                  onTap: () => context.pop(),
                  child: Text(
                    'No',
                    style: TextStyle(color: white),
                  )),
              commonButton(
                  width: 100,
                  onTap: () {
                    context.pop();
                    context.pop();
                    appoinments
                        .deleteuserBookAppointment(appointmentId, userId)
                        .then((value) {
                      if (value.isSuccess) {
                        successToast(msg: value.message);
                        appoinments.userGetAppointment;
                      } else {
                        errorToast(msg: value.message);
                      }
                    });
                  },
                  child: Text(
                    'Yes',
                    style: TextStyle(color: white),
                  )),
            ],
          ),
        );
      });
}
