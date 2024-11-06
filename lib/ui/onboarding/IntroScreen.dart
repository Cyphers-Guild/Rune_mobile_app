import 'package:flutter_svg/svg.dart';
import 'package:rune/imports.dart';
import 'package:rune/widgets/backgroundWidget.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svgs/titledLogo.svg'),
            30.0.sbH,
            const Text(
              'There is grandeur in this view of life, with its several powers, having been originally breathed by the Creator into a few forms or into one; and that, whilst this planet has gone circling on according to the fixed law of gravity, from so simple a beginning endless forms most beautiful and most wonderful have been, and are being evolved.',
              textAlign: TextAlign.center,
            ),
            50.0.sbH,
            Button(
              text: 'Continue',
              action: () => Navigator.pushNamed(context, 'loginScreen'),
            )
          ],
        ),
      ),
    );
  }
}
