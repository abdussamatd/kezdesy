import 'dart:convert';
import 'package:bloc_example_app/src/app_strings.dart';
import 'package:bloc_example_app/src/exceptions.dart';
import 'package:http/http.dart' as http;
import 'model/user_model.dart';

class AuthService {
  final String baseUrl = AppStrings.baseUrl;

  Future<void> signUp(User user) async {
    try{
      print(user.toJson());
      print('-----------------------------');
      final response = await http.post(
        Uri.parse('$baseUrl/register'), // Use the actual register endpoint
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()), // Serializing User object to JSON
      );
      print('----------------ffff---------------');
      if (response.statusCode == 200) {
      } else {
        throw SignUpFailedException();
      }
    } catch (e) {
      print(e.toString());
      throw HostUnreachableException();
    }
  }

  Future<User> signInWithEmail({required String email, required String password}) async {
    try {
      final loginResponse = await http.post(
        Uri.parse('$baseUrl/login'), // Adjusted to the /login endpoint
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (loginResponse.statusCode == 200) {
        // If login is successful, proceed to fetch user details
        final getUserResponse = await http.get(
          Uri.parse('$baseUrl/getUser'), // Adjusted to the getUser endpoint
          headers: {
            'Content-Type': 'application/json',
          },
        );

        if (getUserResponse.statusCode == 200) {
          return User.fromJson(json.decode(getUserResponse.body));
        } else {
          throw CouldNotLoadUserDataException();
        }
      } else {
        throw WrongCredentialsException();
      }
    } catch (e) {
      if (e is WrongCredentialsException
          || e is CouldNotLoadUserDataException) {
        rethrow;
      }
      throw HostUnreachableException();
    }
  }

  Future<void> signOut() async {
    // Implement sign-out logic as per your application's requirements
    // This might involve clearing saved tokens, user details, etc.
  }
}
