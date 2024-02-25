import 'dart:convert';
import 'package:bloc_example_app/blocs/auth/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bloc_example_app/blocs/auth/register/register_bloc.dart';
import 'package:bloc_example_app/blocs/auth/register/register_event.dart';

class ProfilePicWidget extends StatelessWidget {
  const ProfilePicWidget({Key? key}) : super(key: key);

  Future<void> _pickAndSetImage(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final bytes = await image.readAsBytes();
      final base64String = base64Encode(bytes);
      context.read<RegisterBloc>().add(
          RegisterProfilePicChanged(profilePic: base64String));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Column(
          children: [
            if (state.profilePic != null)
              CircleAvatar(
                radius: 55,
                backgroundImage: MemoryImage(base64Decode(state.profilePic!)),
              ),
            TextButton(
              onPressed: () => _pickAndSetImage(context),
              child: Text(state.profilePic == null
                  ? 'Select Profile Picture'
                  : 'Change Profile Picture'),
            ),
          ],
        );
      },
    );
  }
}
