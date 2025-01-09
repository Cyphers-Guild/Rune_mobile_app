import 'package:rune/imports.dart';

AppBar MainAppBarWidget({required String title}) {
  return AppBar(
    backgroundColor: AppConstant.bgColor,
    title: Text(
      title,
      style: TextStyle(fontFamily: 'Ojuju', color: AppConstant.white),
    ),
    centerTitle: false,
    automaticallyImplyLeading: false,
  );
}
