// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/data/model/params/createEventModelParams.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/addComplaintProvider.dart';
import 'package:vam_vam/providers/eventProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';

import '../../../../../helpers/bottomSheetHelper.dart';
import '../../../../../helpers/imageHelper.dart';
import '../../../../../helpers/regexHelper.dart';
import '../../../../../helpers/responsiveHelper.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/fontConstant.dart';
import '../../../../../utils/imageResources.dart';
import '../../../../../utils/paddingConstant.dart';
import '../../../../../widgets/commonWidgets/commonWidgets.dart';
import '../../../../../widgets/commonWidgets/customTextFormField.dart';
import '../../../../addComplaint/cameraScreen.dart';
import '../../../../photo/photoViewScreen.dart';
import '../../../../video/videoScreen.dart';

class AdminCreateEventScreen extends StatefulWidget {
  const AdminCreateEventScreen({super.key});

  @override
  State<AdminCreateEventScreen> createState() => _AdminCreateEventScreenState();
}

class _AdminCreateEventScreenState extends State<AdminCreateEventScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  String? descriptionError;

  setDescriptionError(String? value) {
    setState(() {
      descriptionError = value;
    });
  }

  @override
  void initState() {
    super.initState();
    Provider.of<AddComplaintProvider>(context, listen: false).disposeMethod();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer4<EventProvider, AddComplaintProvider, AuthProvider,
        RoleProvider>(
      builder: (context, data, complaintPro, auth, role, child) =>
          LoadingOverlay(
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
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            commonBackButton(
                                context: context,
                                title: '',
                                backBtnColor: white),
                            const SizedBox(width: 10),
                            const Text("Create Event",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: white,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        customTextFormField5(
                            controller: titleController,
                            title: "Title",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: black,
                            keyboardType: TextInputType.text,
                            textRegex: addressReg),
                        SizedBox(
                          height: 15,
                        ),
                        customTextFormField5(
                          suffix: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Image.asset(
                              IconResource.calenderIcon,
                              height: 16,
                              width: 16,
                            ),
                          ),
                          isRead: true,
                          controller: startDateController,
                          title: 'Start Date',
                          color: black,
                          textRegex: addressReg,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: startDateController.text.isEmpty
                                    ? DateTime.now().add(Duration(days: 1))
                                    : DateTime.parse(startDateController.text),
                                firstDate:
                                    DateTime.now().add(Duration(days: 1)),
                                lastDate: DateTime.now()
                                    .add(Duration(days: 365 * 10)));

                            if (pickedDate != null) {
                              selectStartTime(context, pickedDate);
                            }
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        customTextFormField5(
                          suffix: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Image.asset(
                              IconResource.calenderIcon,
                              height: 16,
                              width: 16,
                            ),
                          ),
                          isRead: true,
                          controller: endDateController,
                          title: 'End Date',
                          color: black,
                          textRegex: addressReg,
                          onTap: () async {
                            if (startDateController.text.isEmpty) {
                              errorToast(msg: 'Select Start Date');
                            } else {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: endDateController.text.isEmpty
                                      ? DateTime.parse(startDateController.text)
                                      : DateTime.parse(endDateController.text),
                                  firstDate: startDateController.text.isEmpty
                                      ? DateTime.now().add(Duration(days: 1))
                                      : DateTime.parse(
                                          startDateController.text),
                                  lastDate: DateTime.now()
                                      .add(Duration(days: 365 * 10)));

                              if (pickedDate != null) {
                                selectEndTime(context, pickedDate);
                              }
                            }
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        customTextFormField5(
                            textRegex: addressReg,
                            controller: addressController,
                            title: 'Address',
                            // length: 100,
                            color: black,
                            fontSize: 12,
                            keyboardType: TextInputType.text,
                            fontWeight: FontWeight.w400),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(PaddingConstant.xs),
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              boxShadow: const [
                                BoxShadow(blurRadius: 2.0, color: white),
                              ],
                              border: Border.all(color: white.withOpacity(0.1)),
                              color: white),
                          child: TextFormField(
                            controller: descriptionController,
                            maxLines: null,
                            expands: true,
                            style: TextStyle(fontSize: 12),
                            keyboardType: TextInputType.multiline,
                            validator: (value) {
                              if (value!.isEmpty) {
                                setDescriptionError(
                                    "Description can't be empty");
                              } else {
                                setDescriptionError(null);
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              counterText: '',
                              hintText: 'Write Your Description',
                              errorStyle: TextStyle(color: errorColor),
                              hintStyle: TextStyle(
                                  color: black.withOpacity(0.4), fontSize: 12),
                              border: InputBorder.none,
                              errorBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        if (descriptionError != null) ...[
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "   ${descriptionError!}",
                            style: TextStyle(color: errorColor, fontSize: 12),
                          )
                        ],
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Bounce(
                              duration: Duration(milliseconds: 100),
                              onPressed: () =>
                                  BottomSheetHelper().showImageBottomSheet(
                                context: context,
                                onCamera: () async {
                                  context.pop();
                                  // complaintPro.pickCameraImg();
                                  final cameras = await availableCameras();
                                  final firstCamera = cameras.first;
                                  final image = await Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) =>
                                        CameraScreen(camera: firstCamera),
                                  ));
                                  print('Camera imagesdf>> $image');
                                  if (image != null) {
                                    complaintPro.setPickedImage(File(image));
                                  }
                                },
                                onGallery: () {
                                  context.pop();
                                  complaintPro.pickGalleryImg();
                                },
                              ),
                              child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: white, shape: BoxShape.circle),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset(
                                        IconResource.addComplaintIcon1),
                                  )),
                            ),
                            SizedBox(
                                width: ResponsiveHelper.width(context) * 0.02),
                            Bounce(
                              duration: Duration(milliseconds: 100),
                              onPressed: () => complaintPro.pickAttachment(),
                              child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: white, shape: BoxShape.circle),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset(
                                        IconResource.addComplaintIcon2),
                                  )),
                            ),
                          ],
                        ),
                        if (complaintPro.pickedAttachments.isNotEmpty) ...[
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Attachment',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, color: white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => VideoScreen(
                                          isNetwork: false,
                                          video:
                                              '${complaintPro.pickedAttachments[0].path}',
                                        ))),
                            child: Container(
                                width: ResponsiveHelper.width(context) * 0.75,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 10),
                                decoration: BoxDecoration(
                                    color: white.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Stack(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          complaintPro
                                              .pickedAttachments[0].name,
                                          maxLines: 1,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                              color: primaryDark,
                                              fontSize: FontConstant.m,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Expanded(
                                          child: Text(
                                            '(${ImageHelper().formatFileSize(complaintPro.pickedAttachments[0].size)})',
                                            maxLines: 1,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                                color: black,
                                                fontSize: FontConstant.m,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Bounce(
                                          duration: Duration(milliseconds: 300),
                                          onPressed: () => complaintPro
                                              .clearPickedAttachment(),
                                          child: Icon(
                                            Icons.clear_rounded,
                                            size: 16,
                                            color: black.withOpacity(0.5),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                          )
                        ],
                        if (complaintPro.pickedImages.isNotEmpty) ...[
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            ' Images',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, color: white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: ResponsiveHelper.width(context),
                            height: 120,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: AlwaysScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: complaintPro.pickedImages.length,
                                itemBuilder: (context, index) {
                                  var item = complaintPro.pickedImages[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PhotoViewScreen(
                                                      url: item.path.toString(),
                                                      isNetwork: false,
                                                    )));
                                      },
                                      child: Card(
                                        elevation: 1,
                                        color: primaryDark,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Stack(
                                              children: [
                                                Image.file(
                                                  item,
                                                  height: 120,
                                                  width: 120,
                                                  fit: BoxFit.fill,
                                                ),
                                                Positioned(
                                                  top: 5,
                                                  right: 5,
                                                  child: Bounce(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    onPressed: () =>
                                                        complaintPro
                                                            .removePickedImage(
                                                                index),
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: white),
                                                      child: Icon(
                                                        Icons.clear_rounded,
                                                        size: 16,
                                                        color: black
                                                            .withOpacity(0.5),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                        SizedBox(height: 50),

                        // Submit Button
                        commonButtonWhite(
                            width: double.infinity,
                            bgColors: [Colors.red, Colors.red],
                            title: 'Submit',
                            txtColor: white,
                            fontSize: 12,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                if (descriptionError == null) {
                                  CreateEventParamsModel
                                      createEventParamsModel =
                                      CreateEventParamsModel(
                                          leaderId: auth.getUserId(),
                                          title: titleController.text
                                              .toString()
                                              .trim(),
                                          description: descriptionController
                                              .text
                                              .toString()
                                              .trim(),
                                          address: addressController.text
                                              .toString()
                                              .trim(),
                                          startDateTime: startDateController
                                              .text
                                              .toLowerCase()
                                              .trim(),
                                          endDateTime: endDateController.text
                                              .toLowerCase()
                                              .trim(),
                                          image: complaintPro.pickedImages,
                                          video: complaintPro
                                                  .pickedAttachments.isNotEmpty
                                              ? [
                                                  complaintPro
                                                      .pickedAttachments[0]
                                                      .path!
                                                ]
                                              : [],
                                          lat: '',
                                          lng: '');
                                  data
                                      .createEvent(
                                          createEventParamsModel, context)
                                      .then((value) {
                                    if (value.isSuccess) {
                                      successToast(msg: value.message);
                                      data.getEvents(
                                          'today', role.roleType, context);
                                      context.pop();
                                    } else {
                                      errorToast(msg: value.message);
                                    }
                                  });
                                }
                              }
                            }),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }

  Future<void> selectStartTime(
      BuildContext context, DateTime selectedDate) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final selectedDateTime = DateTime(selectedDate.year, selectedDate.month,
          selectedDate.day, picked.hour, picked.minute);
      String formattedTime =
          DateFormat('yyyy-MM-dd HH:mm').format(selectedDateTime);
      setState(() {
        startDateController.clear();
        endDateController.clear();
        startDateController.text = formattedTime;
      });
    }
  }

  Future<void> selectEndTime(
      BuildContext context, DateTime selectedDate) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final selectedDateTime = DateTime(selectedDate.year, selectedDate.month,
          selectedDate.day, picked.hour, picked.minute);
      String formattedTime =
          DateFormat('yyyy-MM-dd HH:mm').format(selectedDateTime);
      setState(() {
        endDateController.clear();
        endDateController.text = formattedTime;
      });
    }
  }
}
