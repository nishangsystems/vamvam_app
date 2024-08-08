import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

import '../../utils/colors.dart';

Decoration get textFieldDecoration => BoxDecoration(
      border: Border.all(color: primaryDark),

      /* boxShadow: const [
    BoxShadow(
      color: Color(0xffE2E2E2),
    ),
    BoxShadow(
      color: Colors.white,
      spreadRadius: -5.0,
      blurRadius: 12.0,
    )
  ],*/

      borderRadius: BorderRadius.circular(10),
    );

Widget commonContainer(
        {required Widget child,
        double height = 45,
        double width = double.infinity,
        color = Colors.white,
        VoidCallback? onTap}) =>
    Bounce(
      onPressed: onTap ?? () {},
      duration: const Duration(milliseconds: 100),
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              boxShadow: const [
                BoxShadow(blurRadius: 2.0, color: white),
              ],
              border: Border.all(color: color.withOpacity(0.1)),
              color: color),
          child: child),
    );

Widget commonContainerList(
        {required Widget child, double width = double.infinity}) =>
    Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            boxShadow: const [
              BoxShadow(blurRadius: 2.0, color: white),
            ],
            border: Border.all(color: Colors.white.withOpacity(0.1)),
            color: Colors.white),
        child: child);

Widget commonBorderContainer(
        {required Widget child,
        double height = 40,
        double width = double.infinity,
        color = Colors.black,
        VoidCallback? onTap}) =>
    Bounce(
      onPressed: onTap ?? () {},
      duration: const Duration(milliseconds: 100),
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: color)),
          child: child),
    );
