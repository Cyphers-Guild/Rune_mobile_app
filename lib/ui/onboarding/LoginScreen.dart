import 'package:flutter_svg/svg.dart';
import 'package:rune/imports.dart';

import 'package:rune/widgets/backgroundWidget.dart';
import 'package:rune/widgets/select_wallet_modal.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svgs/logo.svg'),
          30.0.sbH,
          const Text(
            'Welcome to Rune',
            textAlign: TextAlign.center,
          ),
          50.0.sbH,
          Button(
            text: 'Connect a wallet',
            action: () => showWalletDialog(context),
          ),
          20.0.sbH,
          Button(
            text: 'Continue as guest',
            action: () => Navigator.pushNamed(context, 'home'),
          )
        ],
      ),
    );
  }
}
