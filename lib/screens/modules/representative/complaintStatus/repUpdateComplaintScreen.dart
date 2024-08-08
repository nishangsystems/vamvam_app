// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'package:vam_vam/data/model/params/repComplaintFollowUpModelParams.dart';

import '../../../../helpers/bottomSheetHelper.dart';
import '../../../../helpers/dialogHelper.dart';
import '../../../../helpers/imageHelper.dart';
import '../../../../helpers/responsiveHelper.dart';
import '../../../../providers/AuthProvider.dart';
import '../../../../providers/addComplaintProvider.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/fontConstant.dart';
import '../../../../utils/imageResources.dart';
import '../../../../utils/paddingConstant.dart';
import '../../../../widgets/commonWidgets/appDesign.dart';
import '../../../../widgets/commonWidgets/commonWidgets.dart';
import '../../../addComplaint/cameraScreen.dart';
import '../../../addComplaint/recordVideoScreen.dart';
import '../../../loader/loaderOverlay.dart';
import '../../../photo/photoViewScreen.dart';
import '../../../video/videoScreen.dart';

class RepUpdateComplaintScreen extends StatefulWidget {
  final String complaintId;
  final String assignComplaintId;
  const RepUpdateComplaintScreen(
      {super.key, required this.complaintId, required this.assignComplaintId});

  @override
  State<RepUpdateComplaintScreen> createState() =>
      _RepUpdateComplaintScreenState();
}

class _RepUpdateComplaintScreenState extends State<RepUpdateComplaintScreen> {
  String? selectedStatus;
  final TextEditingController remarkController = TextEditingController();
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
  String? videoRecordingPath;

  @override
  void initState() {
    super.initState();
    recordSub = audioRecorder.onStateChanged().listen((state) {
      setState(() {
        recordState = state;
      });
    });
    amplitudeSub = audioRecorder
        .onAmplitudeChanged(const Duration(milliseconds: 300))
        .listen((amp) => setState(() => amplitude = amp));
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      Provider.of<AddComplaintProvider>(context, listen: false)
          .repGetComplaintFollowUp(
              Provider.of<AuthProvider>(context, listen: false).getUserId(),
              widget.complaintId);
    });
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
  void dispose() {
    timer?.cancel();
    recordSub?.cancel();
    amplitudeSub?.cancel();
    audioRecorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AddComplaintProvider, AuthProvider>(
      builder: (context, data, auth, child) => LoadingOverlay(
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
                            const Text("Update Complaint",
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
                          height: ResponsiveHelper.height(context) * 0.06,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: PaddingConstant.l,
                                right: PaddingConstant.l),
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
                                  items: ['In-progress', 'Resolve', 'Cancel']
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
                                  }),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(PaddingConstant.xs),
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              boxShadow: const [
                                BoxShadow(blurRadius: 2.0, color: white),
                              ],
                              border: Border.all(color: white.withOpacity(0.1)),
                              color: white),
                          child: TextFormField(
                            controller: remarkController,
                            maxLines: null,
                            expands: true,
                            style: TextStyle(fontSize: 12),
                            keyboardType: TextInputType.multiline,
                            // validator: (value) {
                            // if (value!.isEmpty) {
                            //   return "Problem can't be empty";
                            // }
                            // return null;
                            // },
                            decoration: InputDecoration(
                              counterText: '',
                              hintText: 'Write Your Remark',
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

                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '* A maximum size of 20MB should be allowed for media files',
                          style: TextStyle(color: red, fontSize: 12),
                        ),
                        SizedBox(height: 10),
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

                        SizedBox(height: 30),
                        // Submit Button
                        commonButtonWhite(
                            width: double.infinity,
                            bgColors: [Colors.red, Colors.red],
                            title: 'Submit',
                            txtColor: white,
                            fontSize: 12,
                            onTap: () {
                              if (selectedStatus == null) {
                                errorToast(msg: 'Select Status');
                              } else if (remarkController.text.isEmpty) {
                                errorToast(msg: 'Remark can\'t be empty');
                              } else if (recordState == RecordState.record) {
                                errorToast(msg: 'Please Stop Audio Recording!');
                              } else {
                                List<String> list = [];
                                for (var element in data.pickedImages) {
                                  list.add(element.path);
                                }
                                if (data.pickedAttachments.isNotEmpty) {
                                  list.add('${data.pickedAttachments[0].path}');
                                }
                                if (audioFilePath != null) {
                                  list.add('$audioFilePath');
                                }
                                // ['In-progress', 'Resolve', 'Cancel']
                                RepComplaintFollowUpModelParams
                                    remoComplaintFollowUpModelParams =
                                    RepComplaintFollowUpModelParams(
                                        assignComplaintId:
                                            widget.assignComplaintId,
                                        complaintId: widget.complaintId,
                                        status: selectedStatus == 'In-progress'
                                            ? '2'
                                            : selectedStatus == 'Resolve'
                                                ? '3'
                                                : '4',
                                        mediaFile: list,
                                        remarks: remarkController.text
                                            .trim()
                                            .toString());
                                data
                                    .repComplaintFollowUp(
                                        remoComplaintFollowUpModelParams)
                                    .then((value) {
                                  if (value.isSuccess) {
                                    successToast(msg: value.message);
                                    context.pop();
                                  } else {
                                    errorToast(msg: value.message);
                                  }
                                });
                              }
                            }),
                        SizedBox(height: 20),
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
          // audioFileName = '${DateTime.now()}.mp3';
          audioFileName = 'demo.mp3';
        });
        await audioRecorder.start(
            path: '/data/user/0/com.vam.vam/cache/$audioFileName');
        setState(() {
          audioFilePath = '/data/user/0/com.vam.vam/cache/$audioFileName';
        });
        if (recordState != RecordState.stop) {
          customToast(msg: 'Start Recording!', color: primaryDark);
        }
        recordDuration = 0;
        startTimer();
      }
    } catch (e) {
      customToast(msg: '$e', color: errorColor);
      rethrow;
    }
  }

  // Start Recording Timer
  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => recordDuration++);
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
}
