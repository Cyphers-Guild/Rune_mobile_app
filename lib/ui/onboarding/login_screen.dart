import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/imports.dart';
import 'package:rune/ui/onboarding/login.dart';
import 'package:rune/ui/onboarding/register.dart';

import 'package:rune/widgets/shared/backgroundWidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svgs/rune_logo.svg'),
          10.0.sbH,
          SizedBox(
            width: mediaQuery(context).width * 0.6,
            child: Text(
              'Unite. Play. Earn. Level up the fun with friends',
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(color: AppConstant.accentWhite),
            ),
          ),
          50.0.sbH,
          Button(
            text: 'Join Game',
            action: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login())),
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
