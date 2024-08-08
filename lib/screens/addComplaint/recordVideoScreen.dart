// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vam_vam/utils/colors.dart';

import '../../helpers/commonHelpers.dart';

class VideoPage extends StatefulWidget {
  final CameraDescription camera;
  const VideoPage({Key? key, required this.camera}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late CameraController controller;
  late Future<void> initializeControllerFuture;
  bool isRecording = false;
  int secondsRecorded = 0;
  late Timer timer;
  String? path;
  String? dirPath;

  @override
  void dispose() {
    controller.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getDirPath();
    // initCamera();
    controller = CameraController(
      widget.camera,
      ResolutionPreset.low,
    );
    initializeControllerFuture = controller.initialize();
  }

  initCamera() async {
    // final cameras = await availableCameras();
    // final firstCamera = cameras.first;

    setState(() {
      controller = CameraController(
        widget.camera,
        ResolutionPreset.low,
      );
      initializeControllerFuture = controller.initialize();
    });
    setState(() {});
  }

  getDirPath() async {
    dirPath = (await getTemporaryDirectory()).path.toString();
    setState(() {});
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String formattedTime =
        '$minutes:${remainingSeconds < 10 ? '0' : ''}$remainingSeconds';
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    // if (!controller.value.isInitialized) {
    //   return Container(
    //     color: white,
    //     child: Center(
    //       child: Text(
    //         'Camera Not Found!',
    //         style: TextStyle(
    //             fontSize: 24,
    //             color: black.withOpacity(0.65),
    //             decoration: TextDecoration.none),
    //       ),
    //     ),
    //   );
    // }
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: FutureBuilder<void>(
        future: initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return Stack(
              children: [
                CameraPreview(controller),
                Positioned(
                  top: 50,
                  left: 14,
                  right: 14,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Icon(Icons.cross)
                      Text(
                        'X',
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.black.withOpacity(0.4)),
                        child: Text(
                          _formatTime(secondsRecorded),
                          style: TextStyle(fontSize: 14, color: white),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                )
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (!isRecording) {
            setState(() {
              path = '$dirPath/vidrec-${generateRandomString(12)}.mp4';
            });
            controller.enableAudio;

            await controller.startVideoRecording();
            // controller.
            timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
              setState(() {
                secondsRecorded++;
                if (secondsRecorded == 30) {
                  stopVideoRecording();
                }
              });
            });
          } else {
            stopVideoRecording();
          }
          setState(() {
            isRecording = !isRecording;
          });
        },
        child: Icon(isRecording ? Icons.stop : Icons.videocam),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  stopVideoRecording() async {
    XFile videoFile = await controller.stopVideoRecording();
    // print(videoFile.path);
    // int sizeInBytes = File(videoFile.path.toString()).lengthSync();
    // double sizeInMb = sizeInBytes / (1024 * 1024);
    // print(sizeInMb);
    timer.cancel();
    Navigator.of(context).pop(videoFile.path);
  }
}
