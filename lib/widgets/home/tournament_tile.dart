import 'package:rune/imports.dart';

class TournamentListTile extends StatelessWidget {
  final Widget? leading;
  final String player;
  final String rank;
  final String status;
  final bool live;
  final bool? isPlayingNow;

  TournamentListTile({
    required this.player,
    this.leading,
    this.isPlayingNow,
    required this.rank,
    required this.status,
    this.live = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppConstant.opaqueBg,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        tileColor: AppConstant.opaqueBg,
        leading: leading ??
            CircleAvatar(
              radius: 14,
              backgroundColor: AppConstant.accentWhite,
              child: Text(player[0]),
            ),
        title: Text(
          "$player ($rank)",
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            isPlayingNow == null
                ? const Text('91.4', style: TextStyle(color: Colors.white))
                : SizedBox(),
            10.0.sbW,
            Text(status, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
