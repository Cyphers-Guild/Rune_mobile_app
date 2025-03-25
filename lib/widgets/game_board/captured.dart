import 'package:rune/imports.dart';

class CapturedWidget extends StatelessWidget {
  const CapturedWidget({
    super.key,
    required this.whiteCaptured,
  });

  final List<ChessPiece> whiteCaptured;

  @override
  Widget build(BuildContext context) {
    return Container(
  
      height: 25,
      width: mediaQuery(context).width * 0.30,
      child: Wrap(
        spacing: 4.0, // Gap between adjacent pieces
        runSpacing: 4.0, // Gap between lines
        children: whiteCaptured
            .map((piece) => Image.asset(piece.imgPath,
                width: 20, height: 20))
            .toList(),
      ),
    );
  }
}