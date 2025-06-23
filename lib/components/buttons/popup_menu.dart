import 'package:flutter/material.dart';

typedef PopupMenuCallback = void Function(String value);

class PopupMenuHelper {
  static Widget buildPopupMenu(
    BuildContext context, {
    required PopupMenuCallback onSelected,
    required List<Map<String, IconData>> optionsList,
  }) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      onSelected: onSelected,
      position: PopupMenuPosition.under,
      itemBuilder: (BuildContext context) {
        return List.generate(
          optionsList.length,
          (index) => PopupMenuItem<String>(
            value: optionsList[index].entries.first.key,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Icon(optionsList[index].entries.last.value),
                ),
                Text(optionsList[index].entries.first.key),
              ],
            ),
          ),
        );
      },
      child: Container(
        height: 36,
        width: 48,
        alignment: Alignment.center,
        child: const Icon(Icons.more_vert),
      ),
    );
  }
}
