import 'package:bloc_example_app/blocs/auth/register/register_bloc.dart';
import 'package:bloc_example_app/blocs/auth/register/register_event.dart';
import 'package:bloc_example_app/blocs/auth/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastNameField extends StatelessWidget {
  const LastNameField({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.family_restroom),
            hintText: 'Last name',
          ),
          validator: (value) =>
          state.isValidLastName
              ? null
              : 'Last name must contain only letters and be 2-50 characters long.',
          onChanged: (value) =>
              context.read<RegisterBloc>().add(
                RegisterLastNameChanged(lastName: value),
              ),
        );
      },
    );
  }
}