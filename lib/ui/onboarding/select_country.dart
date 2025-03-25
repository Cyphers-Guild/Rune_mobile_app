import 'dart:io';

import 'package:country_state_city/models/country.dart';
import 'package:country_state_city/utils/country_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/imports.dart';
import 'package:rune/widgets/shared/backgroundWidget.dart';
import '../../widgets/shared/custom_textField.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({super.key, this.body});

  final Map<String, dynamic>? body;

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  List<Country>? countryList;
  String? selected_country;
  bool _isButtonEnabled = false;
  String selectedCountry = '';
  File? image;

  getCountries() async {
    final List<Country> countries = (await getAllCountries()).cast<Country>();
    setState(() {
      countryList = countries;
    });

    return countries;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.body);
    image = File(widget.body?['image'] ?? '');
    getCountries();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = selectedCountry.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          10.0.sbH,
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
            padding: const EdgeInsets.only(top: 50),
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
            'Select Country!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          5.0.sbH,
          const Text(
            "Your country will be displayed to your friends and players when you play.",
            textAlign: TextAlign.center,
          ),
          50.0.sbH,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select Country',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                5.0.sbH,
                // ignore: prefer_const_constructors
                CustomTextField(
                  isDropdown: true,
                  filled: true,
                  bgColor: AppConstant.accentWhite,
                  dropdownItems: countryList,
                  onChanged: (p0) => setState(() {
                    selectedCountry = p0;
                    _updateButtonState();
                  }),
                ),
              ],
            ),
          ),
          Button(
            text: 'Next',
            enabled: _isButtonEnabled,
            action: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SelectLevel(
                        body: {...widget.body!, 'country': selectedCountry}))),
          ),
          15.0.sbH
        ],
      ),
    );
  }
}
