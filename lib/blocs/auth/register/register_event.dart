import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {}

class RegisterEmailChanged extends RegisterEvent {
  RegisterEmailChanged({this.email});
  final String? email;

  @override
  List<Object?> get props => [email];
}

class RegisterPasswordChanged extends RegisterEvent {
  RegisterPasswordChanged({this.password});
  final String? password;

  @override
  List<Object?> get props => [password];
}

class RegisterFirstNameChanged extends RegisterEvent {
  RegisterFirstNameChanged({this.firstName});
  final String? firstName;

  @override
  List<Object?> get props => [firstName];
}

class RegisterLastNameChanged extends RegisterEvent {
  RegisterLastNameChanged({this.lastName});
  final String? lastName;

  @override
  List<Object?> get props => [lastName];
}

class RegisterAgeChanged extends RegisterEvent {
  RegisterAgeChanged({this.age});
  final int? age;

  @override
  List<Object?> get props => [age];
}

class RegisterCityChanged extends RegisterEvent {
  RegisterCityChanged({this.city});
  final String? city;

  @override
  List<Object?> get props => [city];
}

class RegisterGenderChanged extends RegisterEvent {
  RegisterGenderChanged({this.gender});
  final String? gender;

  @override
  List<Object?> get props => [gender];
}

class RegisterProfilePicChanged extends RegisterEvent {
  RegisterProfilePicChanged({this.profilePic});
  final String? profilePic;

  @override
  List<Object?> get props => [profilePic];
}

class RegisterInterestsChanged extends RegisterEvent {
  RegisterInterestsChanged({this.interests});
  final List<String>? interests;

  @override
  List<Object?> get props => [interests];
}

class RegisterSubmitted extends RegisterEvent {
  @override
  List<Object?> get props => [];
}