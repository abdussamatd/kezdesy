import 'package:bloc_example_app/blocs/auth/register/register_event.dart';
import 'package:bloc_example_app/blocs/auth/register/register_state.dart';
import 'package:bloc_example_app/blocs/bloc_status.dart';
import 'package:bloc_example_app/network/repository/auth/auth_repository.dart';
import 'package:bloc_example_app/network/service/auth/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository? authRepo;

  RegisterBloc({this.authRepo}) : super(const RegisterState()) {
    on<RegisterEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(
      RegisterEvent event, Emitter<RegisterState> emit) async {
    if (event is RegisterEmailChanged) {
      emit(state.copyWith(email: event.email));
    } else if (event is RegisterPasswordChanged) {
      emit(state.copyWith(password: event.password));
    } else if (event is RegisterFirstNameChanged) {
      emit(state.copyWith(firstName: event.firstName));
    } else if (event is RegisterLastNameChanged) {
      emit(state.copyWith(lastName: event.lastName));
    } else if (event is RegisterAgeChanged) {
      emit(state.copyWith(age: event.age));
    } else if (event is RegisterGenderChanged) {
      emit(state.copyWith(gender: event.gender));
    } else if (event is RegisterCityChanged) {
      emit(state.copyWith(city: event.city));
    } else if (event is RegisterProfilePicChanged) {
      emit(state.copyWith(profilePic: event.profilePic));
    } else if (event is RegisterInterestsChanged) {
      emit(state.copyWith(interests: event.interests));
    } else if (event is RegisterSubmitted) {
      emit(state.copyWith(appStatus: FormSubmitting()));

      try {
        await authRepo?.signUp(
          User(data: Data(
            email: state.email,
            password: state.password,
            firstName: state.firstName,
            lastName: state.lastName,
            age: state.age,
            gender: state.gender,
            city: state.city,
            profilePic: state.profilePic,
            interests: state.interests,
          ))
        );
        emit(state.copyWith(appStatus: const SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWith(appStatus: SubmissionFailed(e)));
      }
    }
  }
}
