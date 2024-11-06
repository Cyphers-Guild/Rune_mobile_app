import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rune/imports.dart';

import 'package:rune/widgets/backgroundWidget.dart';

class Username extends StatelessWidget {
  const Username({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 50),
            child: CircleAvatar(
              radius: 40,
            ),
          ),
          15.0.sbH,
          const Text(
            'Welcome to Rune!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          10.0.sbH,
          const Text(
            'Experience the next level of chess with Rune',
            textAlign: TextAlign.center,
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
                const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      fillColor: Color.fromARGB(255, 38, 48, 43),
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      contentPadding: EdgeInsets.all(5),
                      filled: false),
                ),
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
