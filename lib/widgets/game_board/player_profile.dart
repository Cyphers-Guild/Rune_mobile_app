import 'package:flutter_svg/flutter_svg.dart';
import 'package:rune/widgets/game_board/captured.dart';

import '../../imports.dart';

class GamePlayerProfile extends StatelessWidget {
  const GamePlayerProfile({
    super.key,
    required this.captured,
  });
final List<ChessPiece> captured;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
      
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
            ),
            5.0.sbW,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Remy Arinze",
                  style: TextStyle(fontSize: 16,color: Color.fromARGB(255, 202, 202, 202),fontWeight: FontWeight.w600),
                ),
                      CapturedWidget(whiteCaptured: captured),
              ],
            )
          ],
        ));
  }
}
