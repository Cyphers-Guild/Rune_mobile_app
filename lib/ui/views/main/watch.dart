import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rune/helpers/constants.dart';
import 'package:rune/imports.dart';

import '../../../widgets/shared/main_appBar.dart';

class Watch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBarWidget(title: 'Watch'),
      body: PageView.builder(
        scrollDirection: Axis.vertical, // Vertical scrolling
        itemCount: chessEvents.length,
        itemBuilder: (context, index) {
          final event = chessEvents[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.0.sbH,
              ChessEventCard(event: event),
              5.0.sbH,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Daniel Ibok ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            10.0.sbW,
                            const Text('Vs'),
                            10.0.sbW,
                            const Text(
                              'Joseph Ibok',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        10.0.sbH,
                        CommentScrollWidget()
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ChessEventCard extends StatelessWidget {
  final ChessEvent event;

  const ChessEventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        color: AppConstant.opaqueBg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Chessboard Placeholder
          SvgPicture.asset(
            'assets/svgs/chess_board.svg',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class CommentScrollWidget extends StatefulWidget {
  @override
  _CommentScrollWidgetState createState() => _CommentScrollWidgetState();
}

class _CommentScrollWidgetState extends State<CommentScrollWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late ScrollController _scrollController;

  final List<String> comments = [
    "John Doe joined",
    "Alice: Hello everyone!",
    "Bob: This game is amazing!",
    "Charlie joined",
    "David: Go Hikaru!",
    "Eve: Wow, what a move!",
    "John Doe: Good luck to both players!",
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    _scrollController = ScrollController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (_scrollController.hasClients) {
        _scrollController
            .animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 10),
          curve: Curves.linear,
        )
            .then((_) {
          _scrollController.jumpTo(0);
          _startAutoScroll();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 100, // Ensure proper constraints for the comment box
      child: ShaderMask(
        shaderCallback: (bounds) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent, // Fade out at the top
              Colors.white, // Fully visible in the center
              Colors.transparent, // Fade out at the bottom (optional)
            ],
            stops: [0.0, 0.4, 1.0],
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstIn,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: comments.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                comments[index],
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ChessEvent {
  final String title;
  final String playerName;
  final String result;
  final String time;

  ChessEvent({
    required this.title,
    required this.playerName,
    required this.result,
    required this.time,
  });
}

// Sample data for events
final List<ChessEvent> chessEvents = [
  ChessEvent(
      title: 'GM', playerName: 'Hikaru', result: 'Black Won', time: '0:34'),
  ChessEvent(
      title: 'GM', playerName: 'Jan-Krzysztof', result: 'Draw', time: '0:05.7'),
  ChessEvent(
      title: 'IM', playerName: 'Marty', result: 'White Won', time: '0:08.6'),
  ChessEvent(title: 'GM', playerName: 'Jeffery', result: '', time: '0:09.9'),
];
