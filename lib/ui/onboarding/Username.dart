import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/helpers/constants.dart';
import 'package:rune/imports.dart';

import 'package:rune/widgets/backgroundWidget.dart';

import '../../widgets/custom_textField.dart';

class Username extends StatelessWidget {
  const Username({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: kBorderGray,
              child: SvgPicture.asset(
                'assets/svgs/logo.svg',
                width: 25,
              ),
            ),
          ),
          15.0.sbH,
          const Text(
            'Welcome to Rune!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          2.0.sbH,
          Text(
            'Experience the next level of chess with Rune',
            textAlign: TextAlign.center,
            style: GoogleFonts.raleway(),
          ),
          80.0.sbH,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Input Username',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                5.0.sbH,
                CustomTextField(),
              ],
            ),
          ),
          Button(
            text: 'Next',
            action: () => Navigator.pushNamed(context, 'selectLevel'),
          )
        ],
      ),
    );
  }
}
