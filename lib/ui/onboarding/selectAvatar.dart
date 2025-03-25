import 'package:rune/imports.dart';

import 'package:rune/widgets/shared/backgroundWidget.dart';

class SelectAvatar extends StatelessWidget {
  const SelectAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> characters = List.generate(
        8,
        (index) => CircleAvatar(
              radius: 40,
              backgroundColor: index == 0
                  ? const Color.fromARGB(255, 255, 212, 226)
                  : index % 2 == 0
                      ? const Color.fromARGB(255, 152, 199, 153)
                      : const Color.fromARGB(255, 54, 177, 244),
              child: Image.asset('assets/pieces/black-bishop.png'),
            ));

    return BackgroundWidget(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 50),
            // child: CircleAvatar(
            //   radius: 40,
            // ),
          ),
          20.0.sbH,
          const Text(
            'This is what your friends and players will see when you play',
            textAlign: TextAlign.center,
          ),
          50.0.sbH,
          Expanded(
              child: Wrap(
            spacing: 40,
            runSpacing: 20,
            children: [...characters],
          )),
          Button(
            text: 'Next',
            action: () => Navigator.pushNamed(context, 'userName'),
          )
        ],
      ),
    );
  }
}
