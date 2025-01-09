import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:rune/imports.dart';
import 'package:rune/ui/views/explore/tournaments.dart';
import 'package:rune/ui/views/main/Profile.dart';
import 'package:rune/ui/views/play_game/challenge_bot.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../../widgets/home/game_card.dart';
import '../../../widgets/home/tournament_tile.dart';
import '../play_game/game_play_menu.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController();
  late Timer _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    // Initialize the timer to auto-scroll every second
    _autoScrollTimer = Timer.periodic(
      const Duration(seconds: 2),
      (Timer timer) {
        if (_pageController.hasClients) {
          int nextPage =
              (_pageController.page!.toInt() + 1) % 3; // Loop back to the start
          _pageController.animateToPage(
            nextPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _autoScrollTimer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Rune Header Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Text("hi.! Jay",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("1500p",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile()));
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            radius: 15,
                            child: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Main Game Options Grid
                Stack(
                  children: [
                    Text("Rune",
                        style: TextStyle(
                            fontSize: 60,
                            fontFamily: 'Ojuju',
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w700)),
                    Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset('assets/svgs/b.svg')),
                    Padding(
                      padding: const EdgeInsets.only(top: 35.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: GameOptionCard(
                              title: const Text(
                                "Competitive\nPlayer vs \n Player",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              icon: Icons.sports_esports,
                              widget: WidgetAnimator(
                                atRestEffect: WidgetRestingEffects.wave(),
                                child: Image.asset(
                                  'assets/images/rook1.png',
                                  width: 50,
                                ),
                              ),
                              hasOpacity: false,
                              playerCount: "84 / 24",
                              ontap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GamePlayMenu())),
                              color: Color.fromARGB(146, 19, 19, 19),
                              textColor: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              children: [
                                GameOptionCard(
                                  title: const Text(
                                    'Challenge a\nBot',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  ontap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChallengeBot())),
                                  icon: Icons.computer,
                                  widget: Lottie.asset(
                                      animate: true,
                                      'assets/json/robot_3.json',
                                      width: 45),
                                  level: "Lois",
                                  color: Color.fromARGB(255, 27, 50, 39),
                                  textColor: AppConstant.accentWhite,
                                ),
                                const SizedBox(height: 8),
                                GameOptionCard(
                                  players: [],
                                  title: const Text(
                                    "Enter a Tournament",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  ontap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TournamentsScreen()));
                                  },
                                  widget: SizedBox(),
                                  icon: Icons.group,
                                  color: const Color.fromARGB(255, 25, 119, 74),
                                  textColor: AppConstant.accentWhite,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // View More Section
                5.0.sbH,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Playing now',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppConstant.accentWhite),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              size: 15,
                              Icons.arrow_forward_ios,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 80, // Set height for the carousel
                      child: PageView.builder(
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        itemCount: 3, // Adjust based on the number of items
                        itemBuilder: (context, index) {
                          return const Playing();
                        },
                      ),
                    ),
                  ],
                ),
                // Ongoing Tournament Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Game Analysis',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppConstant.accentWhite,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          size: 15,
                          Icons.arrow_forward_ios,
                        ))
                  ],
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
                        player: "Adams",
                        rank: "#10",
                        status: "Rapid",
                        live: false),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // Bottom Navigation Bar
    );
  }
}

class Playing extends StatelessWidget {
  const Playing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      decoration: BoxDecoration(
          color: AppConstant.opaqueBg,
          border: Border.all(color: Colors.grey.shade900),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      width: mediaQuery(context).width,
      child: Row(
        children: [
          Container(
            color: Colors.red,
            padding: const EdgeInsets.all(2),
            child: const Text(
              'GM',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
          5.0.sbW,
          const Text(
            ' Daniel Ibok',
            style: TextStyle(fontSize: 15),
          ),
          5.0.sbW,
          const Text('(233)'),
          const Spacer(),
          const Row(
            children: [
              Icon(Icons.electric_rickshaw_rounded),
              Text('Blitz'),
            ],
          )
        ],
      ),
    );
  }
}
