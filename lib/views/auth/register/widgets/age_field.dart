import 'package:bloc_example_app/blocs/auth/register/register_bloc.dart';
import 'package:bloc_example_app/blocs/auth/register/register_event.dart';
import 'package:bloc_example_app/blocs/auth/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgeField extends StatelessWidget {
  const AgeField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.number, // Ensures numeric keyboard
          decoration: const InputDecoration(
            icon: Icon(Icons.cake),
            hintText: 'Age',
          ),
          validator: (value) {
            final isNumeric = int.tryParse(value ?? '') != null;
            final age = int.tryParse(value ?? '');
            if (!isNumeric) {
              return 'Age must be a number.';
            } else if (age != null && !state.isValidAge) {
              return 'You must be at least 18 years old and less than 110 years.';
            }
            return null; // Returns null if the input is valid
          },
          onChanged: (value) => context.read<RegisterBloc>().add(
            RegisterAgeChanged(age: int.tryParse(value)),
          ),
        );
      },
    );
  }
}
