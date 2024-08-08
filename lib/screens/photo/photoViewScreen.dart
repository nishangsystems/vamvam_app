import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:photo_view/photo_view.dart';

import '../../utils/colors.dart';

class PhotoViewScreen extends StatelessWidget {
  final String url;
  final bool isNetwork;
  const PhotoViewScreen({super.key, required this.url, this.isNetwork = true});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isNetwork) ...[
          PhotoView(
            imageProvider: NetworkImage(url),
          ),
        ] else ...[
          PhotoView(
            imageProvider: FileImage(File(url)),
          ),
        ],
        Positioned(
          top: 45,
          right: 15,
          child: Bounce(
            duration: Duration(milliseconds: 100),
            onPressed: () => Navigator.pop(context),
            child: Icon(
              Icons.close_outlined,
              size: 32,
              color: white,
            ),
          ),
        )
      ],
    );
  }
}
