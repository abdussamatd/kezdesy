import 'package:bloc_example_app/network/service/auth/auth_service.dart';
import 'package:bloc_example_app/network/service/auth/model/user_model.dart';

class AuthRepository {
  AuthRepository({required this.service});
  final AuthService service;

  Future signUp(User user) => service.signUp(user);

  Future signInWithEmail({required String email, required String password}) =>
      service.signInWithEmail(email: email, password: password);

  Future signOut() => service.signOut();

}
