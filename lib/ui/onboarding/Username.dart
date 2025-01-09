import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:rune/imports.dart';
import 'package:rune/ui/onboarding/select_country.dart';
import 'package:rune/ui/view_models/auth_view_model.vm.dart';
import 'package:rune/widgets/shared/backgroundWidget.dart';
import 'package:toastification/toastification.dart';
import '../../widgets/shared/custom_textField.dart';

class Username extends StatefulWidget {
  const Username({super.key, this.body});

  final Map<String, dynamic>? body;

  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  final TextEditingController _usernameController = TextEditingController();
  final Debouncer _debouncer = Debouncer(milliseconds: 500);
  bool _isButtonEnabled = false;
  File? _profileImage; // Variable to hold the selected image file
  String? selectedImage; // URL of the uploaded image
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _usernameController.removeListener(_updateButtonState);
    _usernameController.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _usernameController.text.isNotEmpty &&
          _usernameController.text.length > 2;
    });
  }

  // Function to pick image from gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    const allowedExtensions = ['png', 'jpg', 'jpeg'];
    if (pickedFile != null) {
      String fileExtension = pickedFile.path.split('.').last.toLowerCase();
      print(fileExtension);
      if (!allowedExtensions.contains(fileExtension)) {
        toastification.show(
            context: context,
            title: 'Only PNG, JPG, or JPEG files are allowed.',
            type: ToastificationType.error);
        return null;
      }
      setState(() {
        _profileImage = File(pickedFile.path); // Set the selected image
        selectedImage = pickedFile.path; // Set the URL of the uploaded image
      });
      // Upload the image to Cloudinary
    }
  }

  checkUsername() {
    _debouncer.run(() {
      if (_usernameController.text.isNotEmpty) {
        Provider.of<AuthViewModel>(context, listen: false)
            .verifyUsername(username: _usernameController.text.trim());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Close the keyboard when tapping on the background
        FocusScope.of(context).unfocus();
      },
      child: BackgroundWidget(
        child: Consumer<AuthViewModel>(
          builder: (context, model, _) {
            return Column(
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
                  child: Stack(children: [
                    GestureDetector(
                      onTap: _pickImage, // Trigger image picker on tap
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: AppConstant.white,
                        backgroundImage: _profileImage != null
                            ? FileImage(
                                _profileImage!) // Display selected image
                            : null,
                        child: _profileImage == null ||
                                _profileImage != null &&
                                    _profileImage!.path.isEmpty
                            ? Image.asset('assets/images/image_holder.png')
                            : null,
                      ),
                    ),
                    const Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: AppConstant.buttonGreen,
                        child: Icon(
                          Icons.add,
                          color: AppConstant.accentWhite,
                          size: 15,
                        ),
                      ),
                    ),
                  ]),
                ),
                15.0.sbH,
                const Text(
                  'Username!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                2.0.sbH,
                Text(
                  'This is what your friends and players will see when you play',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(),
                ),
                50.0.sbH,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Input Username',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 15),
                      ),
                      5.0.sbH,
                      CustomTextField(
                        controller: _usernameController,
                        filled: true,
                        bgColor: AppConstant.accentWhite,
                        onChanged: (String value) {
                          model.resetUsernameResponse();
                          checkUsername();
                        },
                      ),
                      5.0.sbH,
                      model.busy
                          ? Text(
                              "Checking...",
                              style: TextStyle(color: AppConstant.accentBlue),
                            )
                          : _usernameController.text.length > 0 &&
                                  _usernameController.text.length < 3
                              ? Text(
                                  "Username must be at least 3 characters",
                                  style:
                                      TextStyle(color: AppConstant.accentBlue),
                                )
                              : model.usernameResponse?.status == 200
                                  ? Text(
                                      model.usernameResponse!.message,
                                      style:
                                          const TextStyle(color: Colors.green),
                                    )
                                  : model.usernameResponse?.status == 409
                                      ? Text(
                                          model.usernameResponse!.message,
                                          style: const TextStyle(
                                              color: Colors.red),
                                        )
                                      : const Text('')
                    ],
                  ),
                ),
                Button(
                  text: 'Next',
                  enabled: _isButtonEnabled &&
                      model.usernameResponse?.message ==
                          'username valid', // Ensure image is uploaded
                  action: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectCountry(body: {
                                ...widget.body!,
                                'username': _usernameController.text.trim(),
                                "image": selectedImage
                              }))),
                ),
                15.0.sbH
              ],
            );
          },
        ),
      ),
    );
  }
}
