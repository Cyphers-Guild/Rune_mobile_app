import 'dart:ui';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:rune/imports.dart';

class GameOptionCard extends StatelessWidget {
  final Widget title;
  final IconData icon;
  final String? playerCount;
  final String? level;
  final Color color;
  final bool? hasOpacity;
  final Color textColor;
  final List<dynamic>? players;
  final Widget? widget;
  final void Function()? ontap;

  GameOptionCard({
    required this.title,
    required this.icon,
    this.playerCount,
    this.ontap,
    this.level,
    this.players,
    this.hasOpacity,
    required this.color,
    this.widget,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
       if(ontap != null){
        ontap!();
       }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12), // Clipping for rounded edges
        child: Stack(
          children: [
            // Backdrop filter for the blur effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: color.withOpacity(
                    0.3), // Adjust the opacity to control blur visibility
              ),
            ),
            // Main content of the card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: hasOpacity != null ? color : color.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget != null
                      ? widget!
                      : Icon(icon, color: textColor, size: 25),
                  const SizedBox(height: 8),
                  title,
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (playerCount != null)
                        Text(
                          playerCount!,
                          style: TextStyle(color: textColor, fontSize: 13),
                        ),
                      if (level != null)
                        Text(
                          level!,
                          style: TextStyle(color: textColor, fontSize: 13),
                        ),
                      if (players != null)
                        Stack(
                          children: [
                            ...List.generate(
                                4,
                                (index) => const Align(
                                      child: CircleAvatar(
                                        radius: 12,
                                        child: Icon(
                                          Icons.person,
                                          size: 13,
                                        ),
                                      ),
                                    ))
                          ],
                        ),
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.yellow,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
