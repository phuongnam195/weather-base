import 'package:flutter/material.dart';
import 'package:weather_base/core/theme/app_colors.dart';

class CustomAlertDialog extends StatelessWidget {
  final IconData? iconData;
  final Color? iconColor;
  final String? title;
  final String? content;
  final String? primaryLabel;
  final void Function()? onPrimaryPressed;
  final String? neutralLabel;
  final void Function()? onNeutralPressed;

  const CustomAlertDialog({
    super.key,
    this.iconData,
    this.iconColor,
    this.title,
    this.content,
    this.primaryLabel,
    this.onPrimaryPressed,
    this.neutralLabel,
    this.onNeutralPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      contentPadding: const EdgeInsets.all(16),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (iconData != null)
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: const Color(0xFFEBEBF0)),
              child: Center(
                child: Icon(
                  iconData,
                  size: 20,
                  color: iconColor,
                ),
              ),
            ),
          const SizedBox(height: 16),
          if (title != null)
            Text(
              title!,
              style: const TextStyle(
                color: Color(0xFF2A3453),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (title != null) const SizedBox(height: 8),
          if (content != null)
            Text(
              content!,
              style: const TextStyle(
                color: Color(0xFF2A3453),
                fontSize: 14,
              ),
            ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (neutralLabel != null)
                ElevatedButton(
                  onPressed: onNeutralPressed,
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xFFEBEBF0),
                    shape: const StadiumBorder(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      neutralLabel!,
                      style: const TextStyle(
                        color: Color(0xFF2A3453),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              if (primaryLabel != null)
                ElevatedButton(
                  onPressed: onPrimaryPressed,
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xFF0070F0),
                    shape: const StadiumBorder(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      primaryLabel!,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}