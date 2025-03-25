import 'package:flutter/material.dart';
import 'package:rune/imports.dart';
import 'package:rune/widgets/shared/app_bar.dart';

class ChallengeBot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background color
      appBar: CustomAppBar(context, title: 'Challenge Bot'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            20.0.sbH,
            _buildProfileHeader(),
            20.0.sbH,
            _buildModeSection(),
            const Spacer(),
            Button(text: 'Play Game'),
            30.0.sbH
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return const Row(
      children: [
        // Profile image
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(
              'assets/images/profile_placeholder.png'), // Replace with the actual image
        ),
        SizedBox(width: 16),
        // Name and rating
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Wally Jr.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              '400',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Spacer(),
        // Country flag
        Text(
          '🇺🇸',
          style: TextStyle(fontSize: 24),
        ),
      ],
    );
  }

  Widget _buildModeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'I PLAY AS',
          style: TextStyle(
            color: Colors.white54,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildPieceOption(Icons.king_bed, isSelected: true),
            const SizedBox(width: 16),
            _buildPieceOption(Icons.help_outline),
            const SizedBox(width: 16),
            _buildPieceOption(Icons.king_bed),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'MODE',
          style: TextStyle(
            color: Colors.white54,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Column(
          children: [
            _buildModeTile('Challenge', 'No help of any kind', 3,
                isSelected: false),
            _buildModeTile('Friendly', 'Hints & takebacks allowed', 2,
                isSelected: true),
            _buildModeTile('Assisted', 'All the tools available', 1,
                isSelected: false),
            _buildModeTile('Custom', 'Choose the settings you want', 0,
                isSelected: false),
          ],
        ),
      ],
    );
  }

  Widget _buildPieceOption(IconData icon, {bool isSelected = false}) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF1F1F1F) : const Color(0xFF191919),
        border: Border.all(
            color: isSelected ? AppConstant.accentBlue : Colors.transparent,
            width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }

  Widget _buildModeTile(String title, String subtitle, int crownCount,
      {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1F1F1F) : const Color(0xFF191919),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppConstant.accentBlue : Colors.transparent,
            width: 2,
          ),
        ),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(color: Colors.white54),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              3,
              (index) => Icon(
                Icons.star,
                size: 16,
                color: index < crownCount ? Colors.yellow : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
