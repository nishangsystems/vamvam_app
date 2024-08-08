// ignore_for_file: unused_field, use_build_context_synchronously, avoid_print

import 'dart:async';
import 'dart:io';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:vam_vam/data/model/params/registerComplaintModelParams.dart';
import 'package:vam_vam/helpers/bottomSheetHelper.dart';
import 'package:vam_vam/helpers/commonHelpers.dart';
import 'package:vam_vam/helpers/dialogHelper.dart';
import 'package:vam_vam/helpers/imageHelper.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/addComplaintProvider.dart';
import 'package:vam_vam/providers/locationMapProvider.dart';
import 'package:vam_vam/providers/profileprovider.dart';
import 'package:vam_vam/screens/addComplaint/cameraScreen.dart';
import 'package:vam_vam/screens/addComplaint/recordVideoScreen.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/screens/photo/photoViewScreen.dart';
import 'package:vam_vam/screens/video/videoScreen.dart';
import 'package:vam_vam/utils/constant.dart';
import 'package:vam_vam/utils/fontConstant.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/imageResources.dart';
import '../../../../utils/paddingConstant.dart';
import '../../../../widgets/commonWidgets/appDesign.dart';
import '../../../../widgets/commonWidgets/commonWidgets.dart';
import '../../../../widgets/commonWidgets/customTextFormField.dart';
import '../../helpers/regexHelper.dart';
import '../../utils/stringResources.dart';

class AddComplaintScreen extends StatefulWidget {
  const AddComplaintScreen({super.key});

  @override
  State<AddComplaintScreen> createState() => _AddComplaintScreenState();
}

class _AddComplaintScreenState extends State<AddComplaintScreen>
    with SingleTickerProviderStateMixin {
  int recordDuration = 0;
  Timer? timer;
  final audioRecorder = Record();
  StreamSubscription<RecordState>? recordSub;
  RecordState recordState = RecordState.stop;
  StreamSubscription<Amplitude>? amplitudeSub;
  Amplitude? amplitude;
  String audioFileName = '';
  String? audioFilePath;
  bool isRecordComplete = false;
  final formKey = GlobalKey<FormState>();
  SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;
  String lastWords = '';
  late AnimationController animationController;
  var iosSpeechToText = SpeechToText();
  String? videoRecordingPath;

  bool _isLoading = true;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    recordSub = audioRecorder.onStateChanged().listen((state) {
      setState(() {
        recordState = state;
      });
    });
    amplitudeSub = audioRecorder
        .onAmplitudeChanged(const Duration(milliseconds: 300))
        .listen((amp) => setState(() => amplitude = amp));
    _initSpeech();
  }

  @override
  void dispose() {
    animationController.dispose();
    timer?.cancel();
    recordSub?.cancel();
    amplitudeSub?.cancel();
    audioRecorder.dispose();
    super.dispose();
  }

  _recordVideo(BuildContext ctx) async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    Navigator.of(ctx)
        .push(MaterialPageRoute(
            builder: (context) => VideoPage(
                  camera: firstCamera,
                )))
        .then((value) {
      setState(() {
        videoRecordingPath = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer4<AddComplaintProvider, AuthProvider, ProfileProvider,
        LocationMapProvider>(
      builder: (context, data, auth, profile, locationmap, child) =>
          LoadingOverlay(
        isLoading: data.isLoading,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
                child: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.only(
                      left: PaddingConstant.l,
                      right: PaddingConstant.l,
                      top: PaddingConstant.xxl),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),

                        // Add Complaint title
                        Row(
                          children: [
                            commonBackButton(
                                context: context,
                                title: '',
                                backBtnColor: white),
                            const SizedBox(width: 10),
                            const Text("Add Complaint",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: white,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        SizedBox(height: 20),

                        // Write Your Problem Field
                        Stack(children: [
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
                                border:
                                    Border.all(color: white.withOpacity(0.1)),
                                color: white),
                            child: TextFormField(
                              controller: data.problemController,
                              maxLines: null,
                              expands: true,
                              style: TextStyle(fontSize: 12),
                              keyboardType: TextInputType.multiline,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Problem can't be empty";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                counterText: '',
                                hintText: 'Write Your Problem...',
                                errorStyle: TextStyle(color: errorColor),
                                hintStyle: TextStyle(
                                    color: black.withOpacity(0.4),
                                    fontSize: 12),
                                border: InputBorder.none,
                                errorBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: Bounce(
                                duration: Duration(milliseconds: 300),
                                onPressed: () {
                                  _startListening();

                                  openSearchSheet(context);
                                },
                                child: Image.asset(IconResource.voicerec,
                                    height: 35,
                                    width: 35,
                                    color: Colors.black)),
                          )
                        ]),

                        SizedBox(height: 15),
                        // Select Department Field
                        commonContainer(
                          width: ResponsiveHelper.width(context),
                          height: ResponsiveHelper.height(context) * 0.06,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: PaddingConstant.l,
                                right: PaddingConstant.l),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: data.selectedDepartment,
                                isExpanded: true,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                hint: const Text('Select Department',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: black,
                                        fontSize: 12)),
                                items: data.departmentList.map((items) {
                                  return DropdownMenuItem(
                                    value: items.name,
                                    child: Text('${items.name}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: black,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) =>
                                    data.setSelectedDepartment(newValue),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),

                        // Select Complaint Category
                        commonContainer(
                          width: ResponsiveHelper.width(context),
                          height: ResponsiveHelper.height(context) * 0.06,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: PaddingConstant.l,
                                right: PaddingConstant.l),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: data.selectedComplaintCategory,
                                isExpanded: true,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                hint: const Text('Select Complaint Category',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: black,
                                        fontSize: 12)),
                                items: data.complaintCategoryList.map((items) {
                                  return DropdownMenuItem(
                                    value: items.name,
                                    child: Text('${items.name}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: black,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) =>
                                    data.setSelectedCategory(newValue),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),

                        //enter current address',
                        customTextFormField2(
                            textRegex: addressReg,
                            controller: data.locController,
                            // title: locationmap.currentAddress,
                            title: 'Address',
                            hintText: "Enter Address",
                            // hinttextcolor: Colors.black,
                            length: 100,
                            color: black,
                            isRead: false,
                            fontSize: 12,
                            keyboardType: TextInputType.text,
                            fontWeight: FontWeight.w400),

                        SizedBox(height: 15),

                        // Enter select Location Field
                        customTextFormField2(
                            textRegex: addressReg,
                            controller: data.addressController,
                            title: 'Choose Current Address',
                            length: 100,
                            color: black,
                            isMendatory: false,
                            fontSize: 12,
                            isRead: true,
                            suffix: InkWell(
                                onTap: () {
                                  if (recordState == RecordState.record) {
                                    warningToast(msg: 'Stop Recording!');
                                  } else {
                                    context.push('$locationMapScreen/1');
                                  }
                                },
                                child: Icon(Icons.location_on)),
                            keyboardType: TextInputType.text,
                            onTap: () {
                              context.push('$locationMapScreen/1');
                            },
                            fontWeight: FontWeight.w400),

                        SizedBox(height: 10),
                        Text(
                          '* A maximum size of 20MB should be allowed for media files',
                          style: TextStyle(color: red, fontSize: 12),
                        ),
                        SizedBox(height: 10),
                        // Icons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Bounce(
                              duration: Duration(milliseconds: 100),
                              onPressed: () {
                                if (recordState == RecordState.record) {
                                  warningToast(msg: 'Stop Recording!');
                                } else {
                                  BottomSheetHelper().showImageBottomSheet(
                                      context: context,
                                      onCamera: () async {
                                        context.pop();
                                        // data.pickCameraImg();
                                        final cameras =
                                            await availableCameras();
                                        final firstCamera = cameras.first;
                                        final image =
                                            await Navigator.of(context)
                                                .push(MaterialPageRoute(
                                          builder: (context) =>
                                              CameraScreen(camera: firstCamera),
                                        ));
                                        print('Camera imagesdf>> $image');
                                        if (image != null) {
                                          data.setPickedImage(File(image));
                                        }
                                      },
                                      onGallery: () {
                                        context.pop();
                                        data.pickGalleryImg();
                                      });
                                }
                              },
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
                              onPressed: () {
                                if (recordState == RecordState.record) {
                                  warningToast(msg: 'Stop Recording!');
                                } else {
                                  _recordVideo(context);
                                }
                              },
                              child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: white, shape: BoxShape.circle),
                                  child: Center(
                                      child: Icon(
                                    Icons.play_arrow_rounded,
                                    size: 28,
                                  ))),
                            ),
                            SizedBox(
                                width: ResponsiveHelper.width(context) * 0.02),
                            Bounce(
                              duration: Duration(milliseconds: 100),
                              onPressed: () {
                                if (recordState == RecordState.record) {
                                  warningToast(msg: 'Stop Recording!');
                                } else {
                                  data.pickAttachment();
                                }
                              },
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

                            SizedBox(
                                width: ResponsiveHelper.width(context) * 0.02),
                            // RecordButton(controller: animationController),
                            Bounce(
                              duration: Duration(milliseconds: 100),
                              onPressed: () {
                                if (recordState != RecordState.stop) {
                                  stop();
                                } else {
                                  start();
                                }
                              },
                              child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: white, shape: BoxShape.circle),
                                  child: Center(
                                      child: recordState != RecordState.stop
                                          ? Icon(
                                              Icons.stop,
                                              color: red,
                                            )
                                          : Icon(
                                              Icons.mic,
                                              color: black,
                                            ))),
                            ),

                            // video recording
                            SizedBox(
                                width: ResponsiveHelper.width(context) * 0.02),

                            // Column(
                            //   children: [
                            //     CameraPreview(_cameraController),
                            //     Bounce(
                            //       duration: Duration(milliseconds: 100),
                            //       onPressed: () => _recordVideo(),
                            //       child: Container(
                            //           height: 40,
                            //           width: 40,
                            //           decoration: BoxDecoration(
                            //               color: white, shape: BoxShape.circle),
                            //           child: Center(
                            //             child: Icon(_isRecording
                            //                 ? Icons.stop
                            //                 : Icons.play_arrow),
                            //           )),
                            //     ),
                            //   ],
                            // ),
                            //
                            // SizedBox(
                            //     width: ResponsiveHelper.width(context) * 0.02),

//
                          ],
                        ),

                        if (data.pickedAttachments.isNotEmpty) ...[
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

                          // video file uploaded
                          GestureDetector(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => VideoScreen(
                                          isNetwork: false,
                                          video:
                                              '${data.pickedAttachments[0].path}',
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
                                          data.pickedAttachments[0].name,
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
                                            '(${ImageHelper().formatFileSize(data.pickedAttachments[0].size)})',
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
                                          onPressed: () =>
                                              data.clearPickedAttachment(),
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

                        if (videoRecordingPath != null) ...[
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Video Recording',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, color: white),
                          ),
                          SizedBox(
                            height: 5,
                          ),

                          // video file uploaded
                          GestureDetector(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => VideoScreen(
                                          isNetwork: false,
                                          video: File(videoRecordingPath!).path,
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
                                          videoRecordingPath!
                                              .split('/')
                                              .last
                                              .toString(),
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
                                        // Expanded(
                                        //   child: Text(
                                        //     '(${ImageHelper().formatFileSize(data.pickedAttachments[0].size)})',
                                        //     maxLines: 1,
                                        //     overflow: TextOverflow.clip,
                                        //     style: TextStyle(
                                        //         color: black,
                                        //         fontSize: FontConstant.m,
                                        //         fontWeight: FontWeight.w500),
                                        //   ),
                                        // ),
                                        Bounce(
                                          duration: Duration(milliseconds: 300),
                                          onPressed: () {
                                            setState(() {
                                              videoRecordingPath = null;
                                            });
                                          },
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

                        // audio file
                        if (isRecordComplete || recordDuration != 0) ...[
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                recordDuration != 0
                                    ? 'Audio Recording : '
                                    : 'Audio Recording...',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, color: white),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              recordDuration != 0
                                  ? buildTimer()
                                  : SizedBox.shrink()
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          isRecordComplete
                              ? GestureDetector(
                                  onTap: () => showAudioPlayerDialog(
                                      context, '$audioFilePath'),
                                  child: Container(
                                      // width: ResponsiveHelper.width(context) *
                                      //     0.85,
                                      height: 40,
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                audioFileName,
                                                maxLines: 1,
                                                overflow: TextOverflow.clip,
                                                style: TextStyle(
                                                    color: primaryDark,
                                                    fontSize: FontConstant.m,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Bounce(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                onPressed: () {
                                                  setState(() {
                                                    isRecordComplete = false;
                                                    audioFileName = '';
                                                    audioFileName = '';
                                                  });
                                                },
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
                              : SizedBox.shrink()
                        ],

                        if (data.pickedImages.isNotEmpty) ...[
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
                                itemCount: data.pickedImages.length,
                                itemBuilder: (context, index) {
                                  var item = data.pickedImages[index];
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
                                                        data.removePickedImage(
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
                            child: Text('Submit'),
                            txtColor: white,
                            fontSize: 12,
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              // if (profile.userProfileInfo.isProfileComplete ==
                              //     '0') {
                              //   showProfileSnackbar(
                              //       context: context,
                              //       bottomMargin:
                              //           ResponsiveHelper.height(context) *
                              //               0.85);
                              // } else {

                              if (formKey.currentState!.validate()) {
                                if (data.getDepartmentId(
                                        '${data.selectedDepartment}') ==
                                    null) {
                                  errorToast(msg: 'Select Department');
                                } else if (data.getCategoryId(
                                        '${data.selectedComplaintCategory}') ==
                                    null) {
                                  errorToast(msg: 'Select Complaint Category');
                                } else if (data
                                    .problemController.text.isEmpty) {
                                  errorToast(msg: 'Problem can\'t be empty');
                                  // }
                                  // else if (data.lat == null ||
                                  //     data.lng == null) {
                                  //   errorToast(
                                  //       msg: 'Please Pick Current Location');
                                } else if (recordState != RecordState.stop) {
                                  errorToast(
                                      msg: 'Please Stop Recording First');
                                } else {
                                  List<String> list = [];
                                  for (var element in data.pickedImages) {
                                    list.add(element.path);
                                  }
                                  if (data.pickedAttachments.isNotEmpty) {
                                    list.add(
                                        '${data.pickedAttachments[0].path}');
                                  }
                                  if (audioFilePath != null &&
                                      audioFilePath != '') {
                                    list.add('$audioFilePath');
                                  }
                                  if (videoRecordingPath != null) {
                                    list.add('$videoRecordingPath');
                                  }
                                  RegisterComplaintModelParams
                                      registerComplaintModelParams =
                                      RegisterComplaintModelParams(
                                          userId: auth.getUserId(),
                                          departmentId:
                                              '${data.getDepartmentId('${data.selectedDepartment}')}',
                                          issueTypeId:
                                              '${data.getCategoryId('${data.selectedComplaintCategory}')}',
                                          message: data.problemController.text
                                              .trim()
                                              .toString(),
                                          latitude: '${data.lat}',
                                          longitude: '${data.lng}',
                                          address: data.locController.text
                                              .trim()
                                              .toString(),
                                          complaintFile: list);
                                  debugPrint(registerComplaintModelParams
                                      .toJson()
                                      .toString());
                                  data
                                      .registerComplaint(
                                          registerComplaintModelParams, context)
                                      .then((value) {
                                    if (value.isSuccess) {
                                      successToast(msg: value.message);
                                      context.pop();
                                    } else if (value.message !=
                                        unAuthonticated) {
                                      errorToast(msg: value.message);
                                    }
                                  });
                                }
                              }
                              // }
                            }),

                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                )),
              )),
        ),
      ),
    );
  }

  // Start Recording
  Future<void> start() async {
    try {
      if (await audioRecorder.hasPermission()) {
        final isSupported = await audioRecorder.isEncoderSupported(
          AudioEncoder.aacLc,
        );
        if (kDebugMode) {
          print('${AudioEncoder.aacLc.name} supported: $isSupported');
        }
        setState(() {
          isRecordComplete = false;
          // audioFileName = 'demo.mp3';

          audioFileName = 'aud-rec${generateRandomString(16)}.mp3';
        });
        await audioRecorder.start(
            path: '/data/user/0/com.vam.vam/cache/$audioFileName');
        setState(() {
          audioFilePath = '/data/user/0/com.vam.vam/cache/$audioFileName';
        });
        if (recordState != RecordState.stop) {
          successToast(msg: 'Start Recording!');
        }
        recordDuration = 0;
        startTimer();
      }
    } catch (e) {
      errorToast(msg: '$e');
      rethrow;
    }
  }

  // Start Recording Timer
  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        recordDuration++;
        if (recordDuration == 30) {
          stop();
        }
      });
    });
  }

  Widget buildText() {
    if (recordState != RecordState.stop) {
      return buildTimer();
    }
    return const Text("");
  }

  Widget buildTimer() {
    final String minutes = _formatNumber(recordDuration ~/ 60);
    final String seconds = _formatNumber(recordDuration % 60);
    return Text(
      '$minutes : $seconds',
      style: const TextStyle(color: Colors.white),
    );
  }

  // Format Recording timing
  String _formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0$numberStr';
    }

    return numberStr;
  }

  // Stop Recording
  Future<void> stop() async {
    timer?.cancel();
    recordDuration = 0;
    final path = await audioRecorder.stop();
    setState(() {
      if (path != null) {
        isRecordComplete = true;
        print(path);
        audioFilePath = path;
        // widget.onStop(path);
      } else {
        audioFileName = '';
      }
    });
  }

  // Initialize Speech To Text
  void _initSpeech() async {
    speechEnabled = await speechToText.initialize();
    setState(() {});
  }

  // Start Speech Listening to convert text
  void _startListening() async {
    await speechToText.listen(onResult: (SpeechRecognitionResult result) {
      setState(() {
        // lastWords = '$lastWords ${result.recognizedWords}';
        lastWords = result.recognizedWords;
      });

      Provider.of<AddComplaintProvider>(context, listen: false)
          .addSpeechToText(lastWords);
    });
  }

// listing voice

  Future<void> openSearchSheet(BuildContext? context) {
    return showModalBottomSheet(
        context: context!,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async {
              if (iosSpeechToText.isAvailable) {
                iosSpeechToText.stop();
              }
              return true;
            },
            child: Stack(
              children: [
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setter) =>
                      Container(
                    margin: EdgeInsets.only(top: 45),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 2,
                          width: 100,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(color: white),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          height: height * 0.25,
                          width: width,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          child: Container(
                              child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Listening...',
                                style: TextStyle(
                                    fontSize: 18, fontStyle: FontStyle.italic),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              AvatarGlow(
                                glowColor: primaryLight,
                                endRadius: 50,
                                repeat: true,
                                animate: true,
                                showTwoGlows: true,
                                repeatPauseDuration:
                                    Duration(milliseconds: 100),
                                child: FloatingActionButton(
                                  onPressed:
                                      // If not yet listening for speech start, otherwise stop
                                      // toggleRecord,
                                      _startListening,
                                  tooltip: 'Listen',
                                  child: InkWell(
                                      onTap: () {
                                        _startListening();
                                      },
                                      child: Icon(Icons.mic)),
                                ),
                              ),
                            ],
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 5,
                  child: IconButton(
                    onPressed: () {
                      if (iosSpeechToText.isAvailable) {
                        iosSpeechToText.stop();
                      }
                      context.pop();
                    },
                    icon: Icon(
                      Icons.clear,
                      size: 30,
                      color: white,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  // Find Speech Result
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      print(result.recognizedWords);
      lastWords = result.recognizedWords;
    });
  }
}
