import 'dart:ui';

import 'package:flutter/material.dart';
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
            'Username',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          10.0.sbH,
          const Text(
            'This is what your friends and players will see when you play',
            textAlign: TextAlign.center,
          ),
          50.0.sbH,
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  fillColor: Color.fromARGB(255, 38, 48, 43),
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  contentPadding: EdgeInsets.all(5),
                  filled: true),
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
