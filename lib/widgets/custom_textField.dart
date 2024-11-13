import '../imports.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          fillColor: Color.fromARGB(255, 38, 48, 43),
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          contentPadding: EdgeInsets.all(5),
          filled: false),
    );
  }
}
