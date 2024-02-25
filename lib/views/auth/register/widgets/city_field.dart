import 'package:bloc_example_app/blocs/auth/register/register_bloc.dart';
import 'package:bloc_example_app/blocs/auth/register/register_event.dart';
import 'package:bloc_example_app/blocs/auth/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityField extends StatelessWidget {
  const CityField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            icon: Icon(Icons.location_city),
            labelText: 'City',
            hintText: 'Select your city',
          ),
          value: state.city,
          onChanged: (value) => context.read<RegisterBloc>().add(
            RegisterCityChanged(city: value),
          ),
          items: const [
            DropdownMenuItem(value: 'Astana', child: Text('Astana')),
            DropdownMenuItem(value: 'Almaty', child: Text('Almaty')),
            DropdownMenuItem(value: 'Shymkent', child: Text('Shymkent')),
            DropdownMenuItem(value: 'Aktobe', child: Text('Aktobe')),
            DropdownMenuItem(value: 'Karaganda', child: Text('Karaganda')),
            DropdownMenuItem(value: 'Aktau', child: Text('Aktau')),
            DropdownMenuItem(value: 'Ekibastuz', child: Text('Ekibastuz')),
            DropdownMenuItem(value: 'Atyrau', child: Text('Atyrau')),
            DropdownMenuItem(value: 'Taraz', child: Text('Taraz')),
            DropdownMenuItem(value: 'Pavlodar', child: Text('Pavlodar')),
            DropdownMenuItem(value: 'Semey', child: Text('Semey')),
            DropdownMenuItem(value: 'Ust-Kamenogorsk', child: Text('Ust-Kamenogorsk')),
            DropdownMenuItem(value: 'Kyzylorda', child: Text('Kyzylorda')),
            DropdownMenuItem(value: 'Uralsk', child: Text('Uralsk')),
            DropdownMenuItem(value: 'Kostanay', child: Text('Kostanay')),
            DropdownMenuItem(value: 'Petropavlsk', child: Text('Petropavlsk')),
            DropdownMenuItem(value: 'Taldykorgan', child: Text('Taldykorgan')),
            DropdownMenuItem(value: 'Kokshetau', child: Text('Kokshetau')),
            // Add more cities as needed
          ],
          validator: (value) =>
          state.isValidCity ? null : 'Please select a city',
        );
      },
    );
  }
}