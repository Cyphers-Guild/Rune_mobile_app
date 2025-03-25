import 'dart:io';

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rune/imports.dart';
import 'package:rune/ui/view_models/auth_view_model.vm.dart';

import 'package:rune/widgets/shared/backgroundWidget.dart';

class SelectLevel extends StatefulWidget {
  const SelectLevel({super.key, this.body});
  final Map<String, dynamic>? body;

  @override
  State<SelectLevel> createState() => _SelectLevelState();
}

class _SelectLevelState extends State<SelectLevel> {
  File? image;
  Map<String, dynamic>? selectedLevel;
  @override
  initState() {
    super.initState();
    image = File(widget.body?['image'] ?? '');
  }

  registerUser() {
    Map<String, dynamic>? body = {
      ...widget.body!,
      'level': selectedLevel!['value']
    };
    print(body);

    Provider.of<AuthViewModel>(context, listen: false)
        .registerUser(body: body, context: context);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> levelDetails = [
      {
        'title': 'New to chess',
        "value": "new_to_chess",
        'icon': 'assets/svgs/rook.svg'
      },
      {
        'title': 'Beginner',
        "value": "beginner",
        'icon': 'assets/svgs/knight.svg'
      },
      {
        'title': 'Intermediate',
        "value": "intermediate",
        'icon': 'assets/svgs/bishop.svg'
      },
      {
        'title': 'Advanced',
        "value": "advanced",
        'icon': 'assets/svgs/queen.svg'
      },
    ];
    List<Widget> levels = List.generate(
        4,
        (index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedLevel = levelDetails[index];
                });
              },
              child: Container(
                width: mediaQuery(context).width,
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                decoration: BoxDecoration(
                    color:
                        selectedLevel?['title'] == levelDetails[index]['title']
                            ? AppConstant.accentWhite
                            : kTileAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      levelDetails[index]['title'],
                      style: GoogleFonts.chakraPetch(
                        color: selectedLevel?['title'] ==
                                levelDetails[index]['title']
                            ? AppConstant.bgColor
                            : Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SvgPicture.asset(
                      levelDetails[index]['icon'],
                      width: 20,
                      color: selectedLevel?['title'] ==
                              levelDetails[index]['title']
                          ? AppConstant.bgColor
                          : null,
                    ),
                  ],
                ),
              ),
            ));
    return BackgroundWidget(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: AppConstant.accentWhite,
                size: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: CircleAvatar(
              radius: 35,
              backgroundImage: image != null
                  ? FileImage(image!) // Display selected image
                  : null,
              child: image == null || image != null && image!.path.isEmpty
                  ? Image.asset('assets/images/image_holder.png')
                  : null,
            ),
          ),
          15.0.sbH,
          const Text(
            'Skill Level',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          5.0.sbH,
          Text(
            'Your starting point for match pairings',
            textAlign: TextAlign.center,
            style: GoogleFonts.chakraPetch(),
          ),
          50.0.sbH,
          Expanded(
            child: Column(
              children: [...levels],
            ),
          ),
          Button(
            text: 'Continue',
            enabled: selectedLevel != null,
            action: () {
              registerUser();
            },
          ),
          15.0.sbH,
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
    return const TextField(
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
