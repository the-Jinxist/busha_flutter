abstract class LoginService {
  Future<void> loginUser({required String email, required String password});
  Future<void> signoutUser();
}
