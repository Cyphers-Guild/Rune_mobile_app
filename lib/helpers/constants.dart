import 'dart:io';

import 'package:flutter/material.dart';

class AppConstant {
  static const white = Colors.white;
  static Color accentBlue = const Color.fromARGB(255, 37, 237, 220);
  static const accentWhite = Color.fromARGB(255, 219, 255, 247);
  static const bgColor = Color.fromARGB(255, 17, 18, 18);
  static const buttonGreen = Color.fromARGB(255, 12, 122, 67);
  static const opaqueBg = Color.fromARGB(10, 21, 76, 56);
  static const bgGreen = Color.fromARGB(255, 15, 212, 123);

  static Widget backIcon({required BuildContext context}) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Icon(
        size: 20,
        Platform.isIOS
            ? Icons.arrow_back_ios
            : Platform.isAndroid
                ? Icons.arrow_back
                : null,
        color: AppConstant.accentWhite,
      ),
    );
  }
}

Color kBgColor = const Color.fromARGB(255, 255, 255, 255);
Color kTileAccent = const Color.fromARGB(255, 20, 31, 26);
Color kTextColor = Color.fromARGB(255, 255, 255, 255);
Color kBorderGray = const Color.fromARGB(255, 13, 13, 13);
Color kGrayAccent = const Color.fromARGB(91, 137, 148, 163);

Color bgColor = const Color(0X141F1A40);
Color green1 = const Color.fromARGB(255, 12, 122, 67);
Color green2 = const Color.fromARGB(255, 22, 159, 97);
Color green3 = const Color.fromARGB(255, 15, 212, 123);
Color gree4 = const Color.fromARGB(255, 71, 224, 155);
Color green5 = const Color.fromARGB(255, 130, 235, 188);
Color kAccentColor = const Color.fromARGB(255, 37, 237, 220);
Color kAccent = Color.fromARGB(255, 91, 140, 140);
Color kAccentGreen = Color.fromARGB(255, 19, 242, 134);
