import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/imports.dart';
import 'package:rune/widgets/shared/app_bar.dart';

class TournamentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, title: 'Play'),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: tournaments.length,
        itemBuilder: (context, index) {
          final tournament = tournaments[index];
          return TournamentCard(tournament: tournament);
        },
      ),
    );
  }
}

class TournamentCard extends StatelessWidget {
  final Tournament tournament;

  const TournamentCard({required this.tournament});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConstant.opaqueBg,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tournament Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              tournament.imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Title and Description
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tournament.title,
                  style: GoogleFonts.raleway(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                5.0.sbH,
                Text(
                  tournament.description,
                  style: GoogleFonts.raleway(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Tournament {
  final String imageUrl;
  final String title;
  final String description;

  Tournament({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

// Sample data for tournaments
final List<Tournament> tournaments = [
  Tournament(
    imageUrl: 'assets/images/chess1.jpeg', // Replace with actual image URL
    title: 'Titled Cup 2024',
    description: 'Watch Titled Tuesdays at 11am & 5pm ET / 17:00 & 23:00 CEST!',
  ),
  Tournament(
    imageUrl: 'assets/images/chessChild.jpg', // Replace with actual image URL
    title: 'Tata Steel Chess India',
    description:
        'Magnus Carlsen tops the field for Tata Steel Chess India in Kolkata!',
  ),
  Tournament(
    imageUrl: 'assets/images/chessSmile.jpg', // Replace with actual image URL
    title: 'EICC 2024',
    description: 'European Individual Chess Championship - Coming Soon!',
  ),
  // Add more tournament entries here
];
