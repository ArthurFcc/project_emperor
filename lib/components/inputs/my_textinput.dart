import 'package:flutter/material.dart';

class MyTextInput extends StatelessWidget {
  final String label;
  final TextEditingController textEditingController;
  final bool textBox;

  const MyTextInput({
    super.key,
    this.textBox = false,
    required this.label,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();

    return TextFormField(
      controller: textEditingController,
      focusNode: focusNode,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        labelText: label,
        alignLabelWithHint: textBox,
        counterText: '',
      ),
      maxLines: textBox ? 4 : 1,
      maxLength: textBox ? 150 : 35,
      onTapOutside: (event) => focusNode.unfocus(),
    );
  }
}
