import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rune/core/models/auth_data_model.dart';
import 'package:rune/imports.dart';
import 'package:rune/ui/onboarding/loading_screen.dart';
import 'package:rune/widgets/shared/backgroundWidget.dart';

import '../view_models/auth_view_model.vm.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _textSlideAnimation;
  late Animation<double> _columnFadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Slide animation for the top text
    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.6), // Starts slightly below center
      end: const Offset(0, -0.1), // Moves up slightly
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Fade animation for the bottom column
    _columnFadeAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    // Simulate login check
    Future.delayed(const Duration(seconds: 2), () async {
      AuthData? token = await AuthData.loadTokensFromLocal();

      if (token != null && token.accessToken!.isEmpty) {
        _controller.forward(); // Start the animation if user is not logged in
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoadingScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Top content: Logo and main text
          SlideTransition(
            position: _textSlideAnimation,
            child: Column(
              children: [
                SvgPicture.asset('assets/svgs/rune_logo.svg'),
                Text(
                  "Rune",
                  style: TextStyle(
                    fontSize: 30,
                    color: kAccentColor,
                    fontFamily: 'Ojuju',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Your move",
                  style: TextStyle(
                    fontSize: 15,
                    color: AppConstant.accentWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Bottom content: Column that fades in
          FadeTransition(
            opacity: _columnFadeAnimation,
            child: Column(
              children: [
                40.0.sbH,
                const Text(
                  'Welcome to Rune!',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Ojuju',
                    color: AppConstant.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Enter the realm where minds clash. In this battleground, every move is a stroke of fate, every wager a test of valor. Be one with your strategy, and let your legend be etched in The RUNE.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                Button(
                  text: 'Get Started',
                  enabled: true,
                  action: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen())),
                  prefixIcon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: AppConstant.accentWhite,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
