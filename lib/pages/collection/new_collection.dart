import 'package:boardgame_collector/bloc/collections/new_collection/new_collection_cubit.dart';
import 'package:boardgame_collector/components/alerts/custom_snackbar.dart';
import 'package:boardgame_collector/components/alerts/snackbar_type.dart';
import 'package:boardgame_collector/components/inputs/my_textinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
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

  void showSnackBar(BuildContext context, SnackbarType type, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      CustomSnackBar.buildCustomSnackBar(type, message),
      snackBarAnimationStyle: AnimationStyle(curve: Curves.bounceIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('New Collection')),
      body: BlocConsumer<NewCollectionCubit, NewCollectionState>(
        listener: (context, state) {
          if (state.status == FormzSubmissionStatus.success) {
            showSnackBar(context, SnackbarType.success, "Collection created!");
            Navigator.of(context).pop();
          }
          if (state.status == FormzSubmissionStatus.failure) {
            showSnackBar(
              context,
              SnackbarType.error,
              "An error occurred while trying to create a new collection. Please, try again.",
            );
          }
        },
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
                                    image: MemoryImage(state.coverImage!),
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
                  MyTextInput(
                    label: 'Title',
                    onChanged:
                        (value) => context
                            .read<NewCollectionCubit>()
                            .titleChanged(value),
                  ),
                  MyTextInput(
                    label: 'Description',
                    textBox: true,
                    onChanged:
                        (value) => context
                            .read<NewCollectionCubit>()
                            .descriptionChanged(value),
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
                      FilledButton(
                        onPressed:
                            () => BlocProvider.of<NewCollectionCubit>(
                              context,
                            ).createCollection(context),
                        child: Text("Save"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
