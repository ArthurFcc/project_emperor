import 'dart:io';

import 'package:boardgame_collector/bloc/collections/new_collection/new_collection_cubit.dart';
import 'package:boardgame_collector/components/inputs/my_textinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class NewCollection extends StatefulWidget {
  const NewCollection({super.key});

  @override
  State<NewCollection> createState() => _NewCollectionState();
}

class _NewCollectionState extends State<NewCollection> {
  XFile? currentImage;

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      BlocProvider.of<NewCollectionCubit>(context).addCoverImage(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('New Collection')),
      body: BlocBuilder<NewCollectionCubit, NewCollectionState>(
        builder:
            (context, state) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 21),
              child: Column(
                spacing: 21,
                children: [
                  GestureDetector(
                    onTap: () => getImage(),
                    child: Card(
                      elevation: 3,
                      color: Color(0xFF2A292F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                      child:
                          state.coverImage != null
                              ? Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    isAntiAlias: true,
                                    image: FileImage(
                                      File(state.coverImage!.path),
                                    ),
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter,
                                  ),
                                ),
                              )
                              : Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 165,
                                  vertical: 48,
                                ),
                                child: Icon(
                                  Icons.image,
                                  color: Colors.grey,
                                  size: 48,
                                ),
                              ),
                    ),
                  ),
                  MyTextInput(label: 'Title', onChanged: (p0) {}),
                  MyTextInput(
                    label: 'Description',
                    textBox: true,
                    onChanged: (p0) {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.only(right: 21),
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text("Cancel"),
                        ),
                      ),
                      FilledButton(onPressed: () {}, child: Text("Save")),
                    ],
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
