import 'package:bloc_example_app/blocs/bloc_status.dart';
import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.email = '',
    this.password = '',
    this.firstName = '',
    this.lastName = '',
    this.age,
    this.gender,
    this.city,
    this.profilePic,
    this.interests,
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
  bool get isValidPassword => password.length >= 8;

  final String firstName;
  bool get isValidFirstName => _isNameValid(firstName);

  final String lastName;
  bool get isValidLastName => _isNameValid(lastName);

  final int? age;
  bool get isValidAge => age != null && age! >= 18 && age! < 110;

  final String? gender;
  bool get isValidGender => gender != null
      && (gender == "Male" || gender == "Female");

  final String? city;
  bool get isValidCity => city != null;

  final String? profilePic;
  bool get isValidProfilePic => true;

  final List<String>? interests;
  bool get isValidInterests => interests != null &&
      interests!.length >= 3 && interests!.length <= 5;


  final AppSubmissionStatus appStatus;

  RegisterState copyWith({
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    int? age,
    String? gender,
    String? city,
    String? profilePic,
    List<String>? interests,
    AppSubmissionStatus? appStatus,
  }) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      city: city ?? this.city,
      profilePic: profilePic ?? this.profilePic,
      interests: interests ?? this.interests,
      appStatus: appStatus ?? this.appStatus,
    );
  }

  @override
  List<Object?> get props => [
    email,
    password,
    firstName,
    lastName,
    age,
    gender,
    city,
    profilePic,
    interests,
    appStatus,
  ];

  bool _isNameValid(String name) {
    final regexName = RegExp(r'^[\p{L}]{2,50}$', unicode: true);
    return regexName.hasMatch(name);
  }

}
