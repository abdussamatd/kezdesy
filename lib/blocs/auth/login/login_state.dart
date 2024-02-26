import 'package:bloc_example_app/blocs/bloc_status.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = '',
    this.password = '',
    this.appStatus = const InitialStatus(),
  });

  final String email;
  bool get isValidEmail {
    final regexEmail = RegExp(
      r'^[_A-Za-z0-9-\+]+(\.[_A-Za-z0-9-]+)*@'
      r'[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$',
    );
    return regexEmail.hasMatch(email);
  }

  final String password;
  bool get isValidPassword => password.length > 5;

  final AppSubmissionStatus appStatus;

  LoginState copyWith(
      {String? email, String? password, AppSubmissionStatus? appStatus}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      appStatus: appStatus ?? this.appStatus,
    );
  }

  @override
  List<Object?> get props => [email, password, appStatus];
}
