import 'package:flutter_svg/flutter_svg.dart';

import '../../imports.dart';

class GamePlayerProfile extends StatelessWidget {
  const GamePlayerProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: kBorderGray,
            ),
            10.0.sbW,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Remy Arinze",
                  style: TextStyle(fontSize: 14),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/medal.svg',
                      width: 12,
                    ),
                    3.0.sbW,
                    const Text(
                      'Rank 12',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
}
