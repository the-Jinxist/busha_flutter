import 'package:busha_flutter_assessment/core/auth/service/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository extends LoginService {
  @override
  Future<void> loginUser(
      {required String email, required String password}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("email", email);
    await prefs.setString("password", password);
  }

  @override
  Future<void> signoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
