import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
    required this.field,
    this.hasBottomDivider = true,
  });

  final String field;
  final bool hasBottomDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(height: 8),
        TextButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(field), Icon(Icons.arrow_forward_rounded)],
          ),
        ),
        if (hasBottomDivider) Divider(height: 8),
      ],
    );
  }
}
