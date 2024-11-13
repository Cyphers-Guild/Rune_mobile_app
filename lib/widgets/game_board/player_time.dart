import '../../imports.dart';

class PlayerTimer extends StatelessWidget {
  const PlayerTimer({
    super.key,
    required String timeString,
    required bool isWhiteTurn,
    required this.isWhite,
  })  : _timeString = timeString,
        _isWhiteTurn = isWhiteTurn;

  final String _timeString;
  final bool _isWhiteTurn;
  final bool isWhite;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: kBorderGray,
      ),
      child: Row(children: [
        Icon(
          Icons.timer,
          color: Color.fromARGB(255, 0, 140, 255),
        ),
        Text(_timeString as String,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color:
                  _isWhiteTurn ? Color.fromARGB(255, 0, 140, 255) : kTileAccent,
            )),
      ]),
    );
  }
}
