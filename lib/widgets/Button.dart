import 'package:google_fonts/google_fonts.dart';
import 'package:rune/imports.dart';

class Button extends StatelessWidget {
  final String text;
  final void Function()? action;
  const Button({
    required this.text,
    this.action,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
                Size(mediaQuery(context).width * 0.9, 50)),
            backgroundColor: MaterialStateProperty.all(green1)),
        onPressed: () {
          if (action != null) {
            action!();
          }
        },
        child: Text(
          text,
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.w600),
        ));
  }
}
