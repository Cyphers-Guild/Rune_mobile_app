import 'dart:ffi';

import 'package:lottie/lottie.dart';
import 'package:rune/imports.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel();
  }
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

class Pref {
  static setString({required String value, required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(key, value);
  }

  static getString({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(key);
  }

  static setBool({required bool value, required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool(key, value);
  }

  static setDouble({required double value, required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setDouble(key, value);
  }
}

bool isWhite(index) {
  int x = index ~/ 8; //GIves us the integer division. row
  int y = index % 8; //GIves us the remainder col
  bool isWhite = (x + y) % 2 == 0;
  return isWhite;
}

bool isInBoard(int row, int col) {
  return row >= 0 && row < 8 && col >= 0 && col < 8;
}

Future<void> showLoadingScreen(BuildContext context, {bool? isLoading}) async {
  // Use Navigator to push the DialogRoute onto the navigation stack
  Navigator.of(context).push(
    DialogRoute(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Dialog(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          child: Center(
            child: CircularProgressIndicator(
              color: AppConstant.accentWhite,
            ),
          ),
        );
      },
    ),
  );
}

void loadingScreenPopper(BuildContext context) {
  if (Navigator.of(context).canPop()) {
    Navigator.of(context).pop();
  }
}
