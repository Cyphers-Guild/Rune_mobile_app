import 'package:flutter_svg/svg.dart';
import 'package:rune/imports.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  const BackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            'assets/svgs/bgImage.svg',
            width: mediaQuery(context).width,
            height: mediaQuery(context).height,
          ),
          SafeArea(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: child))
        ],
      ),
    );
  }
}
