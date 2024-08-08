import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget customTextFormFieldLocation(
        {required TextEditingController controller,
        keyboardType = TextInputType.number,
        required String title,
        required Color color,
        double fontSize = 14,
        required RegExp textRegex,
        fontWeight = FontWeight.w500,
        List<TextInputFormatter>? inputFormatter,
        bool isMendatory = true,
        int length = 50}) =>
    TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: inputFormatter,
        autofocus: false,
        cursorColor: color,
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
