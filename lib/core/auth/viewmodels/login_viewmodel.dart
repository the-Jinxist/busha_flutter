import 'package:busha_flutter_assessment/core/auth/service/login_service.dart';
import 'package:busha_flutter_assessment/shared/services/auth.dart';
import 'package:busha_flutter_assessment/util/resource.dart';
import 'package:flutter/material.dart';

class LoginViewmodel extends ChangeNotifier {
  final LoginService _loginService;
  final AuthService _authService;

  LoginViewmodel(this._loginService, this._authService);

  Future<bool> isUserLoggedIn() async {
    return _authService.isSignedIn();
  }

  Future<void> logOut() async {
    return _loginService.signoutUser();
  }

  Resource<dynamic> loginResource = Resource.idle();

  Future<void> login({required String email, required String password}) async {
    try {
      loginResource = Resource.loading();
      notifyListeners();

      await _loginService.loginUser(email: email, password: password);

      loginResource = Resource.success("");
      notifyListeners();
    } catch (e) {
      loginResource = Resource.failed(e.toString());
      notifyListeners();
    }
  }
}
