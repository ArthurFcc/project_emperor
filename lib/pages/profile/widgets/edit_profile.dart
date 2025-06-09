import 'package:boardgame_collector/components/inputs/my_textinput.dart';
import 'package:boardgame_collector/util/theme.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController fullNameTextEditingController =
      TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 21),
        child: Column(
          spacing: 21,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/image.jpg"),
                      maxRadius: 54,
                    ),
                    CircleAvatar(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            MyTextInput(
              label: "Full Name",
              textEditingController: fullNameTextEditingController,
            ),
            MyTextInput(
              label: "E-mail",
              textEditingController: fullNameTextEditingController,
            ),
            MyTextInput(
              label: "Phone Number",
              textEditingController: fullNameTextEditingController,
            ),
          ],
        ),
      ),
    );
  }
}
