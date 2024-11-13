import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/imports.dart';
import 'package:rune/ui/views/explore/tournaments.dart';
import 'package:rune/widgets/main_appBar.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBarWidget(title: 'Explore'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Events Today Section
              20.0.sbH,
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TournamentsScreen()));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Open Tournaments',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 16,
                    ),
                  ],
                ),
              ),
              EventCard(
                title: 'Titled Cup 2024',
                dateRange: '2 Jan 2024 - 31 Dec 2024',
                image: 'assets/images/chessChild.jpg',
              ),
              EventCard(
                title: 'European Chess Championship 2024',
                dateRange: '8 Nov 2024 - 20 Nov 2024',
                image: 'assets/images/chessSmile.jpg',
              ),

              30.0.sbH,

              // Playing Now Section
              Text(
                'Ongoing Games',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              ...ongoingGames
                  .map((game) => PlayingNowCard(game: game))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}

// EventCard Widget
class EventCard extends StatelessWidget {
  final String title;
  final String dateRange;
  final String image;

  EventCard({
    required this.title,
    required this.dateRange,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: Color.fromARGB(255, 250, 250, 250),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 1),
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(image),
        ),
        title: Text(title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        subtitle: Text(dateRange),
      ),
    );
  }
}

// NewsCard Widget

class OngoingGame {
  final String username;
  final String title;
  final int rating;
  final String countryFlagUrl;

  OngoingGame({
    required this.username,
    required this.title,
    required this.rating,
    required this.countryFlagUrl,
  });
}

// Sample data for Ongoing Games
List<OngoingGame> ongoingGames = [
  OngoingGame(
      username: 'chito89',
      title: 'GM',
      rating: 2931,
      countryFlagUrl: 'https://via.placeholder.com/20'),
  OngoingGame(
      username: 'OK97',
      title: 'GM',
      rating: 2922,
      countryFlagUrl: 'https://via.placeholder.com/20'),
  OngoingGame(
      username: 'MightyGMpretender',
      title: 'NM',
      rating: 2905,
      countryFlagUrl: 'https://via.placeholder.com/20'),
  // Add more games as needed
];

// PlayingNowCard Widget
class PlayingNowCard extends StatelessWidget {
  final OngoingGame game;

  PlayingNowCard({required this.game});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 1),
        leading: CircleAvatar(
          backgroundColor: kBorderGray,
          backgroundImage: NetworkImage(game.countryFlagUrl),
        ),
        title: Text('${game.title} ${game.username}',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        subtitle: Text('${game.rating}'),
      ),
    );
  }
}
