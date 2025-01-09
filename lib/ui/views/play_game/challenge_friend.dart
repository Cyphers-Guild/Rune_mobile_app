import 'package:flutter/material.dart';
import 'package:rune/helpers/constants.dart';
import 'package:rune/imports.dart';
import 'package:rune/widgets/shared/custom_textField.dart';

class PlayFriendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Play a Friend',
          style: TextStyle(
            fontSize: 20,
            color: AppConstant.accentWhite,
          ),
        ),
        backgroundColor: AppConstant.bgColor,
        elevation: 0,
        leading: AppConstant.backIcon(context: context),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.qr_code_scanner,
              color: AppConstant.accentWhite,
            ),
            onPressed: () {
              // Add action for QR Code button
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFeatureButton(
              context,
              icon: Icons.link,
              title: 'Send Challenge Link',
              subtitle: 'Start a game with anyone',
            ),
            const SizedBox(height: 16),
            _buildFeatureButton(
              context,
              icon: Icons.person_search,
              title: 'Find friends',
              subtitle: 'See who already has the app',
            ),
            const SizedBox(height: 16),
            _buildFeatureButton(
              context,
              icon: Icons.mail,
              title: 'Invite Friends',
              subtitle: 'Invite a friend join Rune',
            ),
            16.0.sbH,
            Divider(color: Colors.grey.shade700),
            16.0.sbH,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: CustomTextField(
                    hintText: 'Search by name or username',
                    filled: true,
                    bgColor: AppConstant.accentWhite,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.leaderboard, color: AppConstant.accentBlue),
                  onPressed: () {
                    // Add action for Leaderboard button
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Friends',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  _buildFriendTile(
                    context,
                    name: 'FedeSmith',
                    subtitle: 'Federico Smith',
                    score: 822,
                    flag: '🇨🇴',
                    icon: Icons.safety_check,
                  ),
                  _buildFriendTile(
                    context,
                    name: 'dannii001',
                    subtitle: 'daniel etim',
                    score: 485,
                    flag: '🇳🇬',
                    icon: Icons.checklist_sharp,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureButton(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle}) {
    return Container(
      decoration: BoxDecoration(
        color: AppConstant.opaqueBg,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(icon, size: 25, color: AppConstant.accentWhite),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.white60, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFriendTile(BuildContext context,
      {required String name,
      required String subtitle,
      required int score,
      required String flag,
      required IconData icon}) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8.0),
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
        child: Text(
          flag,
          style: const TextStyle(fontSize: 24),
        ),
      ),
      title: Row(
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          5.0.sbW,
          Text(
            flag,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.white60),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$score',
            style: const TextStyle(color: Colors.red, fontSize: 12),
          ),
          const SizedBox(width: 8),
          Icon(icon, color: AppConstant.accentBlue),
        ],
      ),
    );
  }
}
