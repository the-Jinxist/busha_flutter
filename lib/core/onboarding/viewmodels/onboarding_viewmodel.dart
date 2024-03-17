import 'package:busha_flutter_assessment/shared/services/auth.dart';
import 'package:flutter/material.dart';

class OnboardingViewModel extends ChangeNotifier {
  final AuthService _authService;

  OnboardingViewModel(this._authService);

  Future<bool> _isLoggedIn() async {
    return await _authService.isSignedIn();
  }

  Future<void> navigate(Function(bool) navigate) async {
    final isLoggedIn = await _isLoggedIn();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        navigate(isLoggedIn);
      },
    );
  }
}
