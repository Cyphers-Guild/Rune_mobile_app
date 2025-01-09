import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rune/imports.dart';
import 'package:rune/ui/views/explore/tournaments.dart';
import 'package:rune/ui/views/play_game/challenge_bot.dart';
import 'package:rune/widgets/shared/app_bar.dart';
import 'package:rune/widgets/shared/backgroundWidget.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import 'challenge_friend.dart';

class GamePlayMenu extends StatefulWidget {
  const GamePlayMenu({Key? key}) : super(key: key);

  @override
  _GamePlayMenuState createState() => _GamePlayMenuState();
}

class _GamePlayMenuState extends State<GamePlayMenu> {
  String _selectedTimeOption =
      '10'; // Stores the currently selected time option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, title: 'Play'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            WidgetAnimator(
              child: SvgPicture.asset(
                'assets/svgs/rune_logo.svg',
                width: 60,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => _showTimeSelectionModal(context),
              child: Container(
                decoration: BoxDecoration(
                  color: AppConstant.accentWhite,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedTimeOption,
                      style: const TextStyle(
                          color: AppConstant.bgColor, fontSize: 16),
                    ),
                    Icon(Icons.arrow_drop_down, color: AppConstant.bgColor),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Button(
              text: 'Start Game',
              borderRadius: 10,
              fontSize: 22,
            ),
            50.0.sbH,
            OptionButton(
              icon: Icons.emoji_events,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TournamentsScreen())),
              label: 'Enter a Tournament',
            ),
            const SizedBox(height: 12),
            OptionButton(
              icon: Icons.handshake,
              label: 'Play a Friend',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlayFriendScreen()),
              ),
            ),
            const SizedBox(height: 12),
            OptionButton(
              icon: Icons.smart_toy,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChallengeBot())),
              label: 'Challenge a Bot',
            ),
          ],
        ),
      ),
    );
  }

  void _showTimeSelectionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppConstant.bgColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Choose Time',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                _buildTimeCategory(
                  context,
                  setModalState: setModalState,
                  title: 'Bullet',
                  icon: Icons.rocket_launch,
                  options: ['1 min', '1 | 1', '2 | 1'],
                ),
                _buildTimeCategory(
                  context,
                  setModalState: setModalState,
                  title: 'Blitz',
                  icon: Icons.flash_on,
                  options: ['3 min', '3 | 2', '5 min'],
                ),
                _buildTimeCategory(
                  context,
                  setModalState: setModalState,
                  title: 'Rapid',
                  icon: Icons.timer,
                  options: ['10 min', '15 | 10', '30 min'],
                ),
                _buildTimeCategory(
                  context,
                  setModalState: setModalState,
                  title: 'Daily (Max time per move)',
                  icon: Icons.wb_sunny,
                  options: ['1 day', '3 days', '7 days'],
                ),
                const SizedBox(height: 8),
                Center(
                  child: TextButton(
                    onPressed: () => print('More Time Controls tapped'),
                    child: const Text(
                      'More Time Controls',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  Widget _buildTimeCategory(
    BuildContext context, {
    required StateSetter setModalState,
    required String title,
    required IconData icon,
    required List<String> options,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 15,
            runSpacing: 8,
            children: options
                .map(
                  (option) => Bounceable(
                    onTap: () {
                      print('option');
                      setModalState(() {
                        _selectedTimeOption = option; // Update local state
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 19, 19, 19),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _selectedTimeOption == option
                              ? AppConstant.accentBlue
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          option,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final void Function()? onTap;

  const OptionButton({
    Key? key,
    required this.icon,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppConstant.opaqueBg,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
