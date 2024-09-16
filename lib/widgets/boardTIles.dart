import 'package:rune/imports.dart';

class Tile extends StatelessWidget {
  final bool isWhite;
  final ChessPiece? piece;
  final bool isSelected;
  bool isValidMove;
  void Function()? onTap;
  Tile(
      {super.key,
      required this.isWhite,
      required this.piece,
      required this.isValidMove,
      this.onTap,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    Color? tileColor;
    ;
    if (isSelected) {
      tileColor = const Color.fromARGB(255, 85, 244, 90);
    } else if (isValidMove) {
      tileColor = Color.fromARGB(255, 111, 196, 0);
    } else {
      tileColor = isWhite ? kTileAccent : kBgColor;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(isValidMove ? 3 : 0),
        decoration: BoxDecoration(
            color: tileColor, border: Border.all(color: Colors.black)),
        child: piece != null ? Image.asset(piece!.imgPath) : null,
      ),
    );
  }
}
