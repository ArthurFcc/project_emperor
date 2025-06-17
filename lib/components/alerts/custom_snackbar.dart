import 'package:boardgame_collector/components/alerts/snackbar_type.dart';
import 'package:boardgame_collector/util/theme.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static Color _buildSnackbarSemantics(SnackbarType type) {
    switch (type) {
      case SnackbarType.success:
        return AppColors.success;
      case SnackbarType.error:
        return AppColors.error;
      case SnackbarType.warn:
        return AppColors.warn;
      default:
        return AppColors.info;
    }
  }

  static SnackBar buildCustomSnackBar(SnackbarType type, String message) =>
      SnackBar(
        backgroundColor: _buildSnackbarSemantics(type),
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
      );
}
