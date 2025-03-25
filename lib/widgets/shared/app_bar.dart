import '../../imports.dart';

AppBar CustomAppBar(BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: AppConstant.bgColor,
    elevation: 0,
    leading: AppConstant.backIcon(context: context),
    title: Text(
      title,
      style: TextStyle(fontSize: 18, color: Colors.white),
    ),
    centerTitle: true,
  );
}
