import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/helpers/constants.dart';

import 'package:rune/imports.dart';

import 'package:rune/widgets/backgroundWidget.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40),
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
            'Welcome',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Runeo123',
            style: GoogleFonts.raleway(),
            textAlign: TextAlign.center,
          ),
          50.0.sbH,
          Expanded(
            child: Column(
              children: [
                SvgPicture.asset('assets/svgs/logo.svg'),
                40.0.sbH,
                // ignore: prefer_const_constructors
              ],
            ),
          ),
          Button(
            text: 'Continue',
            action: () => Navigator.pushNamed(context, 'home'),
          )
        ],
      ),
    );
  }
}
