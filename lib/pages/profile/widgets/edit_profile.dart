import 'dart:io';

import 'package:boardgame_collector/bloc/profile/edit_profile_cubit.dart';
import 'package:boardgame_collector/components/inputs/my_textinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      BlocProvider.of<EditProfileCubit>(context).editProfilePicture(image);
    }
  }

  Widget buildProfilePicture(EditProfileState state) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: () => getImage(),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              backgroundImage:
                  state.profilePicture != null
                      ? FileImage(File(state.profilePicture!.path))
                      : null,
              maxRadius: 54,
              child:
                  state.profilePicture == null
                      ? Icon(Icons.person, size: 52)
                      : null,
            ),
            CircleAvatar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: Icon(Icons.edit),
            ),
          ],
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Done"),
          ),
        ],
      ),
      body: BlocBuilder<EditProfileCubit, EditProfileState>(
        builder:
            (context, state) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 21),
              child: Column(
                spacing: 21,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildProfilePicture(state),
                  MyTextInput(
                    label: "Full Name",
                    onChanged:
                        (text) => context
                            .read<EditProfileCubit>()
                            .fullNameChanged(text),
                  ),
                  MyTextInput(
                    label: "E-mail",
                    onChanged:
                        (text) =>
                            context.read<EditProfileCubit>().emailChanged(text),
                  ),
                  MyTextInput(
                    label: "Phone Number",
                    onChanged:
                        (text) =>
                            context.read<EditProfileCubit>().phoneChanged(text),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
