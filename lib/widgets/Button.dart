import 'package:google_fonts/google_fonts.dart';
import 'package:rune/imports.dart';

class Button extends StatelessWidget {
  final String text;
  final double? height;
  final void Function()? action;
  const Button({
    required this.text,
    this.action,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
                Size(mediaQuery(context).width * 0.8, height ?? 50)),
            backgroundColor: MaterialStateProperty.all(bgColor)),
        onPressed: () {
          if (action != null) {
            action!();
          }
        },
        child: Text(
          text,
          style: GoogleFonts.raleway(
              color: Colors.white, fontWeight: FontWeight.w700),
        ));
  }
}
