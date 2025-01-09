import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rune/core/models/auth_data_model.dart';
import 'package:rune/imports.dart';
import 'package:rune/ui/view_models/auth_view_model.vm.dart';
import 'package:rune/widgets/shared/backgroundWidget.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _queenAnimation;
  late Animation<double> _kingAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _queenAnimation = Tween<double>(begin: -200, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _kingAnimation = Tween<double>(begin: 200, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation when the screen loads
    _animationController.forward();

    getUser();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  getUser() async {
    AuthData? authData = await AuthData.loadTokensFromLocal();
    print(authData?.accessToken);
    Provider.of<AuthViewModel>(context, listen: false)
        .getUser(token: authData?.accessToken ?? '', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Consumer<AuthViewModel>(
        builder: (context, model, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _queenAnimation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(_queenAnimation.value, 0),
                        child: child,
                      );
                    },
                    child: Image.asset('assets/images/queen.png'),
                  ),
                  AnimatedBuilder(
                    animation: _kingAnimation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(_kingAnimation.value, 0),
                        child: child,
                      );
                    },
                    child: Image.asset('assets/images/black-king.png'),
                  ),
                  Positioned(
                    bottom: 20,
                    right: mediaQuery(context).width * 0.3,
                    child: const Text(
                      "Rune",
                      style: TextStyle(
                          fontFamily: 'Ojuju',
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              10.0.sbH,
              model.busy
                  ? SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(
                        color: AppConstant.accentBlue,
                        strokeWidth: 2,
                      ),
                    )
                  : SizedBox(),
            ],
          );
        },
      ),
    );
  }
}
