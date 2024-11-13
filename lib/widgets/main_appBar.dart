import 'package:rune/imports.dart';

AppBar MainAppBarWidget({required String title}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(fontFamily: 'Ojuju'),
    ),
    centerTitle: false,
    automaticallyImplyLeading: false,
  );
}
