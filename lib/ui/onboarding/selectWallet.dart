import 'package:flutter_svg/svg.dart';
import 'package:rune/helpers/constants.dart';
import 'package:rune/imports.dart';

import 'package:rune/widgets/backgroundWidget.dart';

class SelectWallet extends StatelessWidget {
  const SelectWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40),
            child: CircleAvatar(
              radius: 40,
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
            style: TextStyle(color: green3),
            textAlign: TextAlign.center,
          ),
          50.0.sbH,
          Expanded(
            child: Column(
              children: [
                SvgPicture.asset('assets/svgs/titledLogo.svg'),
                40.0.sbH,
                // ignore: prefer_const_constructors
                Text(
                  'To keep track of your data and rewards please connect app to a wellet of your choice ',
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Button(
            text: 'Select Wallet',
            action: () => Navigator.pushNamed(context, ''),
          )
        ],
      ),
    );
  }
}
