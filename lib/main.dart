import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rune/core/services/locator.dart';
import 'package:rune/imports.dart';
import 'package:rune/ui/view_models/auth_view_model.vm.dart';

void main() async {
  setupLocator();
  await dotenv.load(fileName: ".env");
  runApp(ChangeNotifierProvider(
    create: (_) => AuthViewModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: bgColor, // Set the status bar color
      statusBarIconBrightness:
          Brightness.light, // Light or dark status bar icons
      statusBarBrightness:
          Brightness.dark, // Light or dark status bar (for iOS)
    ));
    return MaterialApp(
      title: 'Rune',
      theme: ThemeData(
          scaffoldBackgroundColor: AppConstant.bgColor,
          useMaterial3: true,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
          ),
          textTheme: TextTheme(
              bodyLarge:
                  GoogleFonts.chakraPetch(color: AppConstant.accentWhite),
              bodySmall:
                  GoogleFonts.chakraPetch(color: AppConstant.accentWhite),
              bodyMedium:
                  GoogleFonts.chakraPetch(color: AppConstant.accentWhite))),
      home: const SplashScreen(),
      routes: {
        'loginScreen': (context) => const LoginScreen(),
        'selectAvatar': (context) => const SelectAvatar(),
        'userName': (context) => const Username(),
        'selectLevel': (context) => const SelectLevel(),
        'selectWallet': (context) => const Welcome(),
        'home': (context) => const BottomNav(),
        'gameboard': (context) => GameBoard()
      },
    );
  }
}
