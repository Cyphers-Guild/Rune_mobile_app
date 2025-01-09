import 'package:flutter_svg/svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:password_strength/password_strength.dart';
import 'package:rune/imports.dart';
import 'package:rune/ui/onboarding/login.dart';
import 'package:rune/widgets/shared/custom_textField.dart';

import '../../widgets/shared/backgroundWidget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isButtonEnabled = false;
  bool obscureText = true;
  double? passwordStrength;

  @override
  void initState() {
    super.initState();

    // Listen for text field changes to update the button state
    _emailController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _emailController.removeListener(_updateButtonState);
    _passwordController.removeListener(_updateButtonState);
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          passwordStrength != null &&
          passwordStrength! >= 0.6;
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
        child: SingleChildScrollView(
          child: Container(
            width: mediaQuery(context).width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/svgs/rune_logo.svg',
                    width: 50,
                  ),
                ),
                30.0.sbH,
                const Text(
                  'Welcome Player',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                1.0.sbH,
                const Text(
                  'Create account!',
                  style: TextStyle(fontSize: 25),
                ),
                10.0.sbH,
                Column(
                  children: [
                    CustomTextField(
                      controller: _emailController,
                      filled: true,
                      bgColor: AppConstant.accentWhite,
                      hintText: 'Email',
                    ),
                    20.0.sbH,
                    CustomTextField(
                      controller: _passwordController,
                      filled: true,
                      bgColor: AppConstant.accentWhite,
                      hintText: 'Password',
                      onChanged: (text) {
                        setState(() {
                          passwordStrength = estimatePasswordStrength(
                              _passwordController.text);
                        });
                        _updateButtonState();
                      },
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: Icon(
                          obscureText ? EvaIcons.eye_off : EvaIcons.eye,
                          color: AppConstant.bgColor,
                        ),
                      ),
                      obscureText: obscureText,
                    ),
                    passwordStrength != null && passwordStrength! < 0.3
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                3.0.sbH,
                                const Text(
                                  'weak password',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          )
                        : passwordStrength != null && passwordStrength! < 0.6
                            ? Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    3.0.sbH,
                                    const Text(
                                      'good password',
                                      style: TextStyle(color: Colors.yellow),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              )
                            : passwordStrength != null &&
                                    passwordStrength! > 0.6
                                ? Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        3.0.sbH,
                                        const Text(
                                          'secure password',
                                          style: TextStyle(color: Colors.green),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                    50.0.sbH,
                    Button(
                      text: 'Sign Up',
                      enabled: _isButtonEnabled,
                      action: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Username(
                            body: {
                              'email': _emailController.text.trim(),
                              'password': _passwordController.text.trim()
                            },
                          ),
                        ),
                      ),
                    ),
                    20.0.sbH,
                    const Text('Or'),
                    20.0.sbH,
                    const Button(
                      text: 'Sign in with Google',
                      color: AppConstant.bgColor,
                      bgColor: AppConstant.accentWhite,
                      prefixIcon: Icon(Iconsax.google_1_bold),
                    ),
                    40.0.sbH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account? '),
                        GestureDetector(
                          onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ),
                          ),
                          child: Text(
                            'Login ',
                            style: TextStyle(color: AppConstant.accentBlue),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
