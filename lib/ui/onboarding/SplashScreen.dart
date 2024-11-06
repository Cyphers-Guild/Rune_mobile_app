import 'package:flutter_svg/svg.dart';
import 'package:rune/imports.dart';
import 'package:rune/widgets/backgroundWidget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void _navigateToNextScreen(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LoginScreen()), // Replace with your new screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    _navigateToNextScreen(context);

    return BackgroundWidget(
      child: Center(
        child: SvgPicture.asset('assets/svgs/logo.svg'),
      ),
    );
  }
}
