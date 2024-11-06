import 'package:flutter_svg/svg.dart';
import 'package:rune/imports.dart';

import 'package:rune/widgets/backgroundWidget.dart';

class SelectLevel extends StatelessWidget {
  const SelectLevel({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> levelDetails = [
      {'title': 'Newbie', 'icon': 'assets/svgs/rook.svg'},
      {'title': 'Beginner', 'icon': 'assets/svgs/knight.svg'},
      {'title': 'Intermediate', 'icon': 'assets/svgs/bishop.svg'},
      {'title': 'Advanced', 'icon': 'assets/svgs/queen.svg'},
    ];
    List<Widget> levels = List.generate(
        4,
        (index) => Container(
              width: mediaQuery(context).width * 0.4,
              height: 130,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 38, 48, 43)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(levelDetails[index]['icon']),
                  5.0.sbH,
                  Text(levelDetails[index]['title'])
                ],
              ),
            ));
    return BackgroundWidget(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40),
            child: CircleAvatar(
              radius: 40,
            ),
          ),
          15.0.sbH,
          const Text(
            'Skill Level',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          10.0.sbH,
          const Text(
            'Your starting Point for match pairings',
            textAlign: TextAlign.center,
          ),
          50.0.sbH,
          Expanded(
              child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [...levels],
          )),
          Button(
            text: 'Next',
            action: () => Navigator.pushNamed(context, 'selectWallet'),
          )
        ],
      ),
    );
  }
}

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          fillColor: Color.fromARGB(255, 38, 48, 43),
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          contentPadding: EdgeInsets.all(5),
          filled: true),
    );
  }
}
