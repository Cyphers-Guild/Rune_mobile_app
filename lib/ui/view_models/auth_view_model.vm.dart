// ignore_for_file: use_build_context_synchronously

import 'package:get_it/get_it.dart';
import 'package:rune/core/base/base_view_model.dart';
import 'package:rune/core/models/user_model.dart';
import 'package:rune/data/repositories.dart';
import 'package:rune/helpers/helpers.dart';
import 'package:rune/imports.dart';
import 'package:rune/ui/onboarding/loading_screen.dart';

import '../../core/models/auth_data_model.dart';
import '../../core/models/username_model.dart';

class AuthViewModel extends BaseViewModel {
  final repository = GetIt.instance<UserRepository>();

  UsernameResponse? _usernameResponse;
  UsernameResponse? get usernameResponse => _usernameResponse;

  AuthData? _authData;
  AuthData? get authData => _authData;

  UserModel? _user;
  UserModel? get user => _user;

  verifyUsername({required String username}) async {
    try {
      isBusy(true);

      var response = await repository.CheckUserName(username: username);
      print({"Response": response});
      if (response != null) {
        _usernameResponse = response;
      }
      isBusy(false);
      notifyListeners();
    } catch (e) {
      isBusy(false);
      print({"ERROR HERE": e});
      notifyListeners();
    }
  }

  resetUsernameResponse() {
    _usernameResponse = null;
    notifyListeners();
  }

  registerUser(
      {required Map<String, dynamic> body,
      required BuildContext context}) async {
    try {
      isBusy(true);
      showLoadingScreen(context);
      AuthData? response =
          await repository.RegisterUser(body: body, context: context);

      Pref.setString(value: _authData?.accessToken ?? '', key: 'access_token');

      isBusy(false);
      loadingScreenPopper(context);
      if (response != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoadingScreen()));
      }
      notifyListeners();
    } catch (e) {
      print({"ERROR": e});
      //  handle error

      isBusy(false);
      loadingScreenPopper(context);

      notifyListeners();
    }
  }

  authenticateUser(
      {required Map<String, dynamic> body,
      required BuildContext context}) async {
    try {
      isBusy(true);
      showLoadingScreen(context);
      AuthData response =
          await repository.AuthenticateUser(body: body, context: context);
      _authData = response;
      print(_authData?.accessToken);
      Pref.setString(value: _authData?.accessToken ?? '', key: 'access_token');

      loadingScreenPopper(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoadingScreen()));

      isBusy(false);
      notifyListeners();
    } catch (e) {
      print({"ERROR": e});
      //  handle error
      loadingScreenPopper(context);
      isBusy(false);
      notifyListeners();
    }
  }

  getUser({required String token, required BuildContext context}) async {
    try {
      isBusy(true);
      notifyListeners();
      UserModel? response = await repository.getUser(token: token);
      isBusy(false);
      if (response != null) {
        _user = response;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BottomNav()));
      }
      notifyListeners();
    } catch (e) {
      isBusy(false);
      notifyListeners();
    }
  }
}
