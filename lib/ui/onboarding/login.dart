import 'package:email_validator/email_validator.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:rune/helpers/constants.dart';
import 'package:rune/imports.dart';
import 'package:rune/ui/onboarding/register.dart';
import 'package:rune/ui/view_models/auth_view_model.vm.dart';
import 'package:rune/widgets/shared/custom_textField.dart';

import '../../widgets/shared/backgroundWidget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? emailErr;
  bool obscureText = true;
  bool _isButtonEnabled = false;
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
          _passwordController.text.isNotEmpty;
    });
  }

  bool showPassword = false;

  authenticateUser() {
    if (!EmailValidator.validate(_emailController.text)) {
      setState(() {
        emailErr = 'input must be a valid email';
      });
    } else {
      Map<String, dynamic> body = {
        'email': _emailController.text,
        'password': _passwordController.text
      };
      print(body);
      Provider.of<AuthViewModel>(context, listen: false)
          .authenticateUser(body: body, context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: SvgPicture.asset(
            'assets/svgs/rune_logo.svg',
            width: 50,
          )),
          30.0.sbH,
          const Text(
            'Welcome Back Player',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          1.0.sbH,
          const Text(
            'Continue to sign in!',
            style: TextStyle(fontSize: 25),
          ),
          10.0.sbH,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: _emailController,
                filled: true,
                bgColor: AppConstant.accentWhite,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
              ),
              emailErr != null && emailErr!.isNotEmpty
                  ? Text(
                      emailErr!,
                      style: TextStyle(color: AppConstant.accentBlue),
                    )
                  : const SizedBox(),
              20.0.sbH,
              CustomTextField(
                controller: _passwordController,
                filled: true,
                bgColor: AppConstant.accentWhite,
                hintText: 'Password',
                suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: Icon(
                      showPassword ? EvaIcons.eye : EvaIcons.eye_off,
                      color: AppConstant.bgColor,
                    )),
                obscureText: obscureText,
              ),
              50.0.sbH,
              Button(
                text: 'Sign In',
                enabled: _isButtonEnabled,
                action: () => {
                  authenticateUser(),
                },
              ),
              20.0.sbH,
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Or',
                  ),
                ],
              ),
              20.0.sbH,
              Button(
                text: 'Sign in with Google',
                color: AppConstant.bgColor,
                bgColor: AppConstant.accentWhite,
                prefixIcon: Icon(Iconsax.google_1_bold),
              ),
              40.0.sbH,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Dont have an account? '),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register())),
                    child: Text(
                      'Signup ',
                      style: TextStyle(color: AppConstant.accentBlue),
                    ),
                  ),
                ],
              ),
              20.0.sbH,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forgot password',
                    style: TextStyle(color: AppConstant.accentBlue),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
