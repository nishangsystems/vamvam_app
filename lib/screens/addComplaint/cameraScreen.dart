// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;
  const CameraScreen({Key? key, required this.camera}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
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

  _pickImage() async {
    final file = await controller.takePicture();
    Navigator.pop(context, file.path);
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
            return SizedBox(
                height: ResponsiveHelper.height(context),
                width: ResponsiveHelper.width(context),
                child: CameraPreview(controller));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _pickImage();
        },
        child: Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
