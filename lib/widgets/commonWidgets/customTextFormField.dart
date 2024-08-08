import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vam_vam/utils/colors.dart';
import 'package:vam_vam/widgets/commonWidgets/appDesign.dart';

Widget customTextFormField(
        {required TextEditingController controller,
        keyboardType = TextInputType.number,
        required String title,
        required Color color,
        double fontSize = 14,
        required RegExp textRegex,
        fontWeight = FontWeight.w500,
        List<TextInputFormatter>? inputFormatter,
        bool isMendatory = true,
        int length = 50,
        bool readOnly = false}) =>
    TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: inputFormatter,
        autofocus: false,
        cursorColor: color,
        readOnly: readOnly,
        textInputAction: TextInputAction.done,
        maxLength: length,
        maxLines: null,
        validator: (value) {
          if (isMendatory) {
            if (value!.isEmpty) {
              return "$title can't be empty";
            }
          }
          return null;
        },
        style:
            TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
        decoration: InputDecoration(
            counterText: '',
            hintText: title,
            hintStyle: TextStyle(
                color: color, fontSize: fontSize, fontWeight: fontWeight),
            border: InputBorder.none));

Widget customTextFormField1(
        {required TextEditingController controller,
        keyboardType = TextInputType.number,
        required String title,
        RegExp? textRegex,
        List<TextInputFormatter>? inputFormatter,
        bool isPassword = false,
        Function()? onSuffixTap,
        bool isVisible = false,
        int length = 50}) =>
    Stack(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              inputFormatters: inputFormatter,
              autofocus: false,
              cursorColor: textColor,
              textInputAction: TextInputAction.done,
              maxLength: length,
              validator: (value) {
                if (value!.isEmpty) {
                  return "$title can't be empty";
                } else if (textRegex != null && !textRegex.hasMatch(value)) {
                  return 'Please enter valid $title';
                }
                return null;
              },
              style: TextStyle(
                color: textColor,
              ),
              obscureText: isPassword ? !isVisible : false,
              decoration: InputDecoration(
                  suffixIcon: isPassword
                      ? GestureDetector(
                          onTap: onSuffixTap,
                          child: Icon(
                            isVisible
                                ? Icons.visibility
                                : Icons.visibility_off_rounded,
                            color: textColor,
                            size: 20,
                          ),
                        )
                      : SizedBox.shrink(),
                  errorBorder: errorOutlineBorder,
                  focusedErrorBorder: errorOutlineBorder,
                  enabledBorder: outlineBorder,
                  focusedBorder: outlineBorder,
                  disabledBorder: outlineBorder,
                  counterText: '',
                  hintText: title,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  hintStyle: TextStyle(
                    color: textColor.withOpacity(0.8),
                    fontSize: 14,
                  ),
                  border: outlineBorder)),
        )
      ],
    );

OutlineInputBorder get errorOutlineBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: errorColor,
    ));
OutlineInputBorder get outlineBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: Color(0xff0A2958).withOpacity(0.63),
    ));

Widget customTextFormField2(
        {required TextEditingController controller,
        keyboardType = TextInputType.number,
        required String title,
        bool isRead = false,
        required Color color,
        double fontSize = 14,
        String? hintText,
        RegExp? textRegex,
        fontWeight = FontWeight.w500,
        List<TextInputFormatter>? inputFormatter,
        int length = 10000,
        bool isMendatory = true,
        Function()? onTap,
        Widget? suffix,
        Widget? suffixIcon,
        Color? bgColor,
        bool isBorder = false,
        bool isExpand = false}) =>
    Stack(
      children: [
        // commonContainer(child: SizedBox.shrink(), color: bgColor ?? white),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          decoration: BoxDecoration(
            color: bgColor ?? white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextFormField(
              maxLines: isExpand ? null : 1,
              minLines: 1,
              onTap: onTap ?? () {},
              controller: controller,
              readOnly: isRead,
              keyboardType: keyboardType,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              inputFormatters: inputFormatter,
              autofocus: false,
              cursorColor: primaryDark,
              textInputAction: TextInputAction.done,
              maxLength: length,
              validator: (value) {
                if (isMendatory) {
                  if (value!.isEmpty) {
                    return "$title can't be empty";
                  } else if (textRegex != null && !textRegex.hasMatch(value)) {
                    return 'Please enter valid $title'.replaceAll('.', '');
                  }
                } else {
                  if (value!.isNotEmpty) {
                    if (textRegex != null && !textRegex.hasMatch(value)) {
                      return 'Please enter valid $title'.replaceAll('.', '');
                    }
                  }
                }
                return null;
              },
              style: TextStyle(
                  color: color, fontSize: fontSize, fontWeight: fontWeight),
              decoration: InputDecoration(
                suffix: suffix ?? SizedBox.shrink(),
                suffixIcon: suffixIcon ?? SizedBox.shrink(),
                filled: true,
                counterText: '',
                hintText: hintText ?? title,
                errorStyle: TextStyle(color: errorColor),
                fillColor: bgColor ?? white,
                hintStyle:
                    TextStyle(color: black.withOpacity(0.4), fontSize: 12),
                border: isBorder ? outlineInputBorder : InputBorder.none,
                enabledBorder: isBorder ? outlineInputBorder : InputBorder.none,
                focusedBorder: isBorder ? outlineInputBorder : InputBorder.none,
                disabledBorder:
                    isBorder ? outlineInputBorder : InputBorder.none,
                focusedErrorBorder:
                    isBorder ? outlineErrorInputBorder : InputBorder.none,
                errorBorder:
                    isBorder ? outlineErrorInputBorder : InputBorder.none,
              )),
        )
      ],
    );

OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: vamBorderColor));

OutlineInputBorder get outlineErrorInputBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: errorColor));

Widget customTextFormField3({
  //required TextEditingController controller,
  keyboardType = TextInputType.number,
  required String title,
  bool isRead = false,
  required Color color,
  double fontSize = 14,
  String? hintText,
  required RegExp textRegex,
  fontWeight = FontWeight.w500,
  List<TextInputFormatter>? inputFormatter,
  int length = 50,
  bool isMendatory = true,
  Function()? onTap,
  Widget? suffix,
}) =>
    Stack(
      children: [
        commonContainer(child: SizedBox.shrink()),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: TextFormField(
              onTap: onTap ?? () {},
              // controller: controller,
              readOnly: isRead,
              keyboardType: keyboardType,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              inputFormatters: inputFormatter,
              autofocus: false,
              cursorColor: primaryDark,
              textInputAction: TextInputAction.done,
              maxLength: length,
              validator: (value) {
                if (isMendatory) {
                  if (value!.isEmpty) {
                    return "$title can't be empty";
                  } else if (!textRegex.hasMatch(value)) {
                    return 'Please enter valid $title';
                  }
                } else {
                  if (value!.isNotEmpty) {
                    if (!textRegex.hasMatch(value)) {
                      return 'Please enter valid $title';
                    }
                  }
                }

                return null;
              },
              style: TextStyle(
                  color: color, fontSize: fontSize, fontWeight: fontWeight),
              decoration: InputDecoration(
                  suffixIcon: suffix ?? SizedBox.shrink(),
                  counterText: '',
                  hintText: hintText ?? title,
                  errorStyle: TextStyle(color: errorColor),
                  hintStyle:
                      TextStyle(color: black.withOpacity(0.4), fontSize: 12),
                  border: InputBorder.none)),
        )
      ],
    );

Widget customTextFormField4({
  required TextEditingController controller,
  keyboardType = TextInputType.number,
  String? title,
  Color? hinttextcolor,
  bool isRead = false,
  required Color color,
  double fontSize = 14,
  String? hintText,
  required RegExp textRegex,
  fontWeight = FontWeight.w500,
  List<TextInputFormatter>? inputFormatter,
  int length = 50,
  bool isMendatory = true,
  Function()? onTap,
  Widget? suffix,
}) =>
    Stack(
      children: [
        commonContainer(child: SizedBox.shrink()),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: TextFormField(
              onTap: onTap ?? () {},
              controller: controller,
              readOnly: isRead,
              keyboardType: keyboardType,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              inputFormatters: inputFormatter,
              autofocus: false,
              cursorColor: primaryDark,
              textInputAction: TextInputAction.done,
              maxLength: length,
              // validator: (value) {
              //   if (isMendatory) {
              //     if (value!.isEmpty) {
              //       return "$title can't be empty";
              //     } else if (!textRegex.hasMatch(value)) {
              //       return 'Please enter valid $title';
              //     }
              //   } else {
              //     if (value!.isNotEmpty) {
              //       if (!textRegex.hasMatch(value)) {
              //         return 'Please enter valid $title';
              //       }
              //    }
              //   }

              //   return null;
              // },
              style: TextStyle(
                  color: color, fontSize: fontSize, fontWeight: fontWeight),
              decoration: InputDecoration(
                  suffixIcon: suffix ?? SizedBox.shrink(),
                  counterText: '',
                  hintText: hintText ?? title,
                  errorStyle: TextStyle(color: errorColor),
                  hintStyle: TextStyle(
                      color: hinttextcolor ?? black.withOpacity(0.4),
                      fontSize: 12),
                  border: InputBorder.none)),
        )
      ],
    );

Widget customTextFormField5({
  required TextEditingController controller,
  keyboardType = TextInputType.number,
  required String title,
  bool isRead = false,
  required Color color,
  double fontSize = 14,
  String? hintText,
  required RegExp textRegex,
  fontWeight = FontWeight.w500,
  List<TextInputFormatter>? inputFormatter,
  int length = 50,
  int? maxLines = 1,
  bool isMendatory = true,
  Function()? onTap,
  Widget? suffix,
}) =>
    TextFormField(
        onTap: onTap ?? () {},
        controller: controller,
        readOnly: isRead,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: inputFormatter,
        autofocus: false,
        cursorColor: primaryDark,
        maxLines: maxLines,
        textInputAction: TextInputAction.done,
        maxLength: length,
        validator: (value) {
          if (isMendatory) {
            if (value!.isEmpty) {
              return "$title can't be empty";
            } else if (!textRegex.hasMatch(value)) {
              return 'Please enter valid $title';
            }
          } else {
            if (value!.isNotEmpty) {
              if (!textRegex.hasMatch(value)) {
                return 'Please enter valid $title';
              }
            }
          }

          return null;
        },
        style:
            TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
        decoration: InputDecoration(
          suffixIcon: suffix ?? SizedBox.shrink(),
          fillColor: Colors.white,
          filled: true,
          counterText: '',
          hintText: hintText ?? title,
          contentPadding: EdgeInsets.all(8),
          errorStyle: TextStyle(color: errorColor),
          hintStyle: TextStyle(color: black.withOpacity(0.4), fontSize: 12),
          border: OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            // borderSide: BorderSide(color: Colors.white24)
            borderSide: const BorderSide(width: 0, color: Colors.white),
          ),
          errorBorder: OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            // borderSide: BorderSide(color: Colors.white24)
            borderSide: const BorderSide(width: 0, color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            // borderSide: BorderSide(color: Colors.white24)
            borderSide: const BorderSide(width: 0, color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            // borderSide: BorderSide(color: Colors.white24)
            borderSide: const BorderSide(width: 0, color: Colors.white),
          ),
          disabledBorder: OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            // borderSide: BorderSide(color: Colors.white24)
            borderSide: const BorderSide(width: 0, color: Colors.white),
          ),
          focusedErrorBorder: OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            // borderSide: BorderSide(color: Colors.white24)
            borderSide: const BorderSide(width: 0, color: Colors.white),
          ),
        ));
// Stack(
//   children: [
//     commonContainer(child: SizedBox.shrink()),
//     Padding(
//       padding: const EdgeInsets.only(left: 12),
//       child: TextFormField(
//           onTap: onTap ?? () {},
//           controller: controller,
//           readOnly: isRead,
//           keyboardType: keyboardType,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           inputFormatters: inputFormatter,
//           autofocus: false,
//           cursorColor: primaryDark,
//           maxLines: maxLines,
//           textInputAction: TextInputAction.done,
//           maxLength: length,
//           validator: (value) {
//             if (isMendatory) {
//               if (value!.isEmpty) {
//                 return "$title can't be empty";
//               } else if (!textRegex.hasMatch(value)) {
//                 return 'Please enter valid $title';
//               }
//             } else {
//               if (value!.isNotEmpty) {
//                 if (!textRegex.hasMatch(value)) {
//                   return 'Please enter valid $title';
//                 }
//               }
//             }

//             return null;
//           },
//           style: TextStyle(
//               color: color, fontSize: fontSize, fontWeight: fontWeight),
//           decoration: InputDecoration(
//               suffixIcon: suffix ?? SizedBox.shrink(),
//               counterText: '',
//               hintText: hintText ?? title,
//               errorStyle: TextStyle(color: errorColor),
//               hintStyle:
//                   TextStyle(color: black.withOpacity(0.4), fontSize: 12),
//               border: InputBorder.none)),
//     )
//   ],
// );
