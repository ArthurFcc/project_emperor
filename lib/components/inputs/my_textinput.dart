import 'package:flutter/material.dart';

typedef StringCallback = void Function(String);

class MyTextInput extends StatefulWidget {
  final String label;
  final bool textBox;
  final StringCallback onChanged;

  const MyTextInput({
    super.key,
    required this.label,
    this.textBox = false,
    required this.onChanged,
  });

  @override
  State<MyTextInput> createState() => _MyTextInputState();
}

class _MyTextInputState extends State<MyTextInput> {
  final focusNode = FocusNode();
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      focusNode: focusNode,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        labelText: widget.label,
        alignLabelWithHint: widget.textBox,
        counterText: '',
        suffixIcon:
            textEditingController.text.isNotEmpty
                ? IconButton(
                  onPressed: () => textEditingController.clear(),
                  icon: Icon(Icons.close),
                )
                : null,
      ),
      maxLines: widget.textBox ? 4 : 1,
      maxLength: widget.textBox ? 150 : 35,
      onTapOutside: (event) => focusNode.unfocus(),
    );
  }
}
