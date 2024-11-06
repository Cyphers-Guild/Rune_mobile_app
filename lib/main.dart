import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Set the status bar color
      statusBarIconBrightness:
          Brightness.light, // Light or dark status bar icons
      statusBarBrightness:
          Brightness.dark, // Light or dark status bar (for iOS)
    ));
    return MaterialApp(
      title: 'Rune',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
          ),
          textTheme: TextTheme(
              bodyLarge: GoogleFonts.montserrat(color: kTextColor),
              bodySmall: GoogleFonts.montserrat(color: kTextColor),
              bodyMedium: GoogleFonts.montserrat(color: kTextColor))),
      home: const SplashScreen(),
      routes: {
        'loginScreen': (context) => const LoginScreen(),
        'selectAvatar': (context) => const SelectAvatar(),
        'userName': (context) => const Username(),
        'selectLevel': (context) => const SelectLevel(),
        'selectWallet': (context) => const SelectWallet(),
        'home': (context) => const BottomNav(),
        'gameboard': (context) => GameBoard()
      },
    );
  }
}
// Theres a bug on queena dn king
// need to fix that