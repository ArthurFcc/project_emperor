import 'package:boardgame_collector/bloc/profile/edit_profile_cubit.dart';
import 'package:boardgame_collector/components/buttons/settings_button.dart';
import 'package:boardgame_collector/pages/profile/widgets/edit_profile.dart';
import 'package:boardgame_collector/pages/profile/widgets/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void editProfile(BuildContext context) => Navigator.of(context).push(
    MaterialPageRoute(
      builder:
          (context) => BlocProvider(
            create: (context) => EditProfileCubit(),
            child: EditProfile(),
          ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => editProfile(context),
            child: Text("Edit"),
          ),
        ],
      ),
      body: Column(
        children: [
          ProfileHeader(
            userFullName: "Arthur Faccio",
            userEmail: "arthur.faccio@proton.me",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 21),
            child: Column(
              children: [
                SettingsButton(field: "Settings", hasBottomDivider: false),
                SettingsButton(field: "Logout"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
