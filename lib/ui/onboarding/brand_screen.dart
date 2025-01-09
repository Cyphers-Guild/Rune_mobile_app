import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/imports.dart';
import 'package:rune/widgets/shared/backgroundWidget.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

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
        child: Stack(
          children: [

            Image.asset('assets/images/talos.jpg'),
            Positioned(
              top: 200,
              right: 60,
              child: Text('Tm',style: GoogleFonts.raleway(fontSize: 16,color: Colors.grey,fontWeight:FontWeight.bold),)),
          ],
        ),
      ),
    );
  }
}
