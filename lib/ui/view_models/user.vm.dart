import 'package:rune/core/services/locator.dart';
import 'package:rune/data/repositories.dart';
import 'package:rune/imports.dart';

class UserViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final UserRepository _repository = locator<UserRepository>();

  fetchUser() {}
}
