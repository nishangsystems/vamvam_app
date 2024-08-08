import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vam_vam/utils/colors.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({Key? key, required this.child, required this.isLoading})
      : super(key: key);

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          const Opacity(
            opacity: 0.1,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (isLoading)
          Center(
            child: SpinKitFadingCircle(
              color: hinduColor,
            ),
            // Container(
            //   alignment: Alignment.center,
            //   height: 120,
            //   width: 120,
            //   padding: EdgeInsets.all(12),
            //   decoration: BoxDecoration(
            //     color: white,
            //     borderRadius: BorderRadius.circular(12)
            //   ),
            //   child: const Center(
            //     child: SpinKitFoldingCube(
            //       color: primaryDark,
            //     ),
            //   ),
            // ),
          ),
      ],
    );
  }
}
