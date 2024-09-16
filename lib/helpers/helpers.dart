import 'package:rune/imports.dart';

bool isWhite(index) {
  int x = index ~/ 8; //GIves us the integer division. row
  int y = index % 8; //GIves us the remainder col
  bool isWhite = (x + y) % 2 == 0;
  return isWhite;
}

bool isInBoard(int row, int col) {
  return row >= 0 && row < 8 && col >= 0 && col < 8;
}

class MediaqueryClass {
  final double width;
  final double height;

  MediaqueryClass({required this.width, required this.height});
}

MediaqueryClass mediaQuery(BuildContext context) {
  return MediaqueryClass(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height);
}

extension SizedBoxExtension on double {
  SizedBox get sbH => SizedBox(height: this);
  SizedBox get sbW => SizedBox(width: this);
}
