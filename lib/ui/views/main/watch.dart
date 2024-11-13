import 'package:flutter_svg/svg.dart';
import 'package:rune/imports.dart';
import 'package:rune/widgets/main_appBar.dart';

class Watch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBarWidget(title: 'Watch'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.8,
          ),
          itemCount: chessEvents.length,
          itemBuilder: (context, index) {
            final event = chessEvents[index];
            return ChessEventCard(event: event);
          },
        ),
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
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 240, 240),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: kTileAccent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    event.title,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  event.playerName,
                  style: const TextStyle(color: Colors.black),
                ),
                const Spacer(),
                const Icon(Icons.flag,
                    color: Colors.white, size: 16), // Placeholder for the flag
              ],
            ),
          ),
          // Chessboard Placeholder
          Expanded(
            child: SvgPicture.asset('assets/svgs/chess_board.svg'),
          ),
          // Game Result
          // Timer
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: kTileAccent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    event.title,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.timer, color: Colors.white, size: 16),
                    const SizedBox(width: 5),
                    Text(
                      event.time,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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
  ChessEvent(title: 'GM', playerName: 'Jeffery', result: '', time: '0:09.9'),
  ChessEvent(title: 'GM', playerName: 'Jeffery', result: '', time: '0:09.9'),
  ChessEvent(title: 'GM', playerName: 'Jeffery', result: '', time: '0:09.9'),
  ChessEvent(title: 'GM', playerName: 'Jeffery', result: '', time: '0:09.9'),
  // Add more events here
];
