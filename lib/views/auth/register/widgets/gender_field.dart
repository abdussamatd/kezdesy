import 'package:bloc_example_app/blocs/auth/register/register_bloc.dart';
import 'package:bloc_example_app/blocs/auth/register/register_event.dart';
import 'package:bloc_example_app/blocs/auth/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderField extends StatelessWidget {
  const GenderField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            icon: Icon(Icons.transgender),
            labelText: 'Gender',
            hintText: 'Select your gender',
          ),
          value: (state.gender??'').isEmpty ? null : state.gender,
          onChanged: (value) => context.read<RegisterBloc>().add(
            RegisterGenderChanged(gender: value),
          ),
          items: const [
            DropdownMenuItem(
              value: 'Male',
              child: Text('Male'),
            ),
            DropdownMenuItem(
              value: 'Female',
              child: Text('Female'),
            ),
          ],
          validator: (value) =>
          state.isValidGender ? null : 'Please select a gender',
        );
      },
    );
  }
}
