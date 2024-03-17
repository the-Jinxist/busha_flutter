import 'package:busha_flutter_assessment/shared/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo extends AuthService {
  @override
  Future<bool> isSignedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey("email");
  }
}
