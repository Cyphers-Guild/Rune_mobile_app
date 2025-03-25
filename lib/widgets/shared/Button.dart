import 'package:google_fonts/google_fonts.dart';
import 'package:rune/imports.dart';

class Button extends StatelessWidget {
  final String text;
  final double? height;
  final double? borderRadius; // New borderRadius parameter
  final double? fontSize; // New fontSize parameter
  final Widget? prefixIcon; // Prefix icon parameter
  final Widget? suffixIcon; // Suffix icon parameter
  final bool? enabled;
  final Color? bgColor;
  final Color? color;
  final Color? disabledBgColor; // Custom color for disabled state
  final void Function()? action;

  const Button({
    required this.text,
    this.action,
    this.height,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true, // Default to enabled
    this.color,
    this.bgColor,
    this.disabledBgColor, // Default to null
    this.borderRadius, // New optional parameter
    this.fontSize, // New optional parameter
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          Size(mediaQuery(context).width * 0.8, height ?? 50),
        ),
        backgroundColor: MaterialStateProperty.all(
          enabled == true
              ? bgColor ??
                  AppConstant.buttonGreen // Use custom bgColor if enabled
              : disabledBgColor ??
                  AppConstant.accentBlue.withOpacity(0.2), // Use disabled color
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(borderRadius ?? 25), // Apply borderRadius
          ),
        ),
      ),
      onPressed: enabled == true
          ? () {
              if (action != null) {
                action!(); // Execute action only if enabled
              }
            }
          : null, // Disable action when button is not enabled
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null) prefixIcon!,
          if (prefixIcon != null) 5.0.sbW, // Add spacing if prefixIcon exists
          Text(
            text,
            style: GoogleFonts.chakraPetch(
              color: color ?? AppConstant.accentWhite,
              fontSize: fontSize ?? 18, // Apply fontSize
              fontWeight: FontWeight.w600,
            ),
          ),
          if (suffixIcon != null) 5.0.sbW, // Add spacing if suffixIcon exists
          if (suffixIcon != null) suffixIcon!,
        ],
      ),
    );
  }
}
