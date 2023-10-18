import 'package:flutter/material.dart';
import 'package:weather_base/core/widgets/custom_alert_dialog.dart';
import 'package:weather_base/global.dart';

class DialogUtils {
  static showError({String? content, String? title}) {
    showDialog(
      context: Global.context,
      builder: (ctx) =>
      CustomAlertDialog(
        iconData: Icons.error_outline_rounded,
        iconColor: const Color(0xFFFC820A),
        title: title ?? 'Đã xảy ra lỗi',
        content: content ?? 'Lỗi không xác định!',
        neutralLabel: 'OK',
        onNeutralPressed: () => Navigator.of(ctx).pop(),
      ),
    );
  }
}
