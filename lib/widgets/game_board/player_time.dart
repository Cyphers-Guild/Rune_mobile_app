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
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
   color:const Color.fromARGB(255, 37, 37, 37),
      ),
      child: Row(children: [
        Icon(
          Icons.timer,
          size: 18,
          color: kBgColor,
        ),
        Text(_timeString,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color:
                  _isWhiteTurn ? Colors.white : Colors.grey,
            )),
      ]),
    );
  }
}
