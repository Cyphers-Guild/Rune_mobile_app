import 'package:flutter_svg/flutter_svg.dart';

import '../../imports.dart';

class GameBoardButtons extends StatelessWidget {
  const GameBoardButtons({super.key, required this.icon, this.onclick});
  final Function? onclick;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onclick != null) {
          onclick!();
        }
      },
      child: Container(
        width: mediaQuery(context).width * 0.20,
        height: 60,
        decoration: BoxDecoration(
            color: kBorderGray, borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: SvgPicture.asset(
          icon,
          width: 15,
        )),
      ),
    );
  }
}
