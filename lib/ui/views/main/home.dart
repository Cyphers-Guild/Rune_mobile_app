import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/imports.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: kGrayAccent,
                  child: SvgPicture.asset(
                    'assets/svgs/menu.svg',
                    width: 30,
                  ),
                ),
                10.0.sbW,
                const Text("hi.! Jay",
                    style: TextStyle(color: Colors.black, fontSize: 14)),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text("1500p",
                      style: TextStyle(color: Colors.black, fontSize: 12)),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: kBorderGray,
                  radius: 15,
                  child: SvgPicture.asset(
                    'assets/svgs/medal.svg',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rune Header Section

            // Main Game Options Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: [
                  const Text("Rune",
                      style: TextStyle(
                          fontSize: 60,
                          fontFamily: 'Ojuju',
                          fontWeight: FontWeight.w700)),
                  Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset('assets/svgs/b.svg')),
                  Padding(
                    padding: const EdgeInsets.only(top: 58.0),
                    child: Row(
                      children: [
                        SizedBox(
                          height: mediaQuery(context).height * 0.30,
                          width: mediaQuery(context).width * 0.45,
                          child: Expanded(
                            child: GameOptionCard(
                              title: "Competitive\nPlayer vs player",
                              icon: Icons.sports_esports,
                              widget: SvgPicture.asset(
                                  'assets/svgs/play_piece.svg'),
                              hasOpacity: false,
                              playerCount: "84 / 24",
                              color: Colors.black,
                              textColor: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            children: [
                              GameOptionCard(
                                title: "Play against AI",
                                icon: Icons.computer,
                                level: "Level 2",
                                color: Colors.grey.shade700,
                                textColor: Colors.white,
                              ),
                              const SizedBox(height: 8),
                              GameOptionCard(
                                title: "Challenge a friend",
                                icon: Icons.group,
                                color: Colors.grey.shade300,
                                textColor: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // View More Section

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, bottom: 5),
                    child: Text(
                      'Ongoing Tournament',
                      style: GoogleFonts.inter(
                          fontSize: 13, color: Colors.grey.shade500),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: mediaQuery(context).width,
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade500),
                              borderRadius: BorderRadius.circular(10)),
                          height: 50,
                          width: mediaQuery(context).width * 0.7,
                        ),
                        const SizedBox(width: 8),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade500),
                              borderRadius: BorderRadius.circular(10)),
                          height: 50,
                          width: mediaQuery(context).width * 0.7,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Ongoing Tournament Section
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10, top: 20),
              child: Text(
                'Last Game Analysis',
                style: GoogleFonts.inter(
                    fontSize: 13, color: Colors.grey.shade500),
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                TournamentListTile(
                    player: "Fredrick",
                    rank: "#23",
                    status: "Blitz",
                    live: true),
                TournamentListTile(
                    player: "Adams", rank: "#10", status: "Rapid", live: false),
              ],
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
    );
  }
}

class GameOptionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? playerCount;
  final String? level;
  final Color color;
  final bool? hasOpacity;
  final Color textColor;
  final Widget? widget;

  GameOptionCard({
    required this.title,
    required this.icon,
    this.playerCount,
    this.level,
    this.hasOpacity,
    required this.color,
    this.widget,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
              children: [
                widget != null
                    ? widget!
                    : Icon(icon, color: textColor, size: 25),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
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
                Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.arrow_forward,
                    color: textColor,
                    size: 16,
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

class TournamentListTile extends StatelessWidget {
  final String player;
  final String rank;
  final String status;
  final bool live;

  TournamentListTile({
    required this.player,
    required this.rank,
    required this.status,
    this.live = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        child: Text(player[0]),
      ),
      title: Text(
        player,
        style: const TextStyle(fontSize: 14),
      ),
      subtitle: Text(
        rank,
        style: const TextStyle(fontSize: 13),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(status, style: const TextStyle(color: Colors.black)),
          if (live)
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text("live", style: TextStyle(color: Colors.green)),
            ),
        ],
      ),
    );
  }
}
