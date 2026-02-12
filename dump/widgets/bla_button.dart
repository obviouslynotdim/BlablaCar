import 'package:flutter/material.dart';
import '../theme/theme.dart';

enum BlaButtonType { primary, secondary }

class BlaButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final BlaButtonType type;

  const BlaButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.type = BlaButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPrimary = type == BlaButtonType.primary;

    final Color backgroundColor = isPrimary ? BlaColors.primary : Colors.white;
    final Color foregroundColor = isPrimary ? Colors.white : BlaColors.primary;
    final BorderSide borderSide = isPrimary
        ? BorderSide.none
        : BorderSide(color: BlaColors.greyLight);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
              topLeft: Radius.zero,
              topRight: Radius.zero,
            ),
            side: borderSide,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: BlaTextStyles.button.copyWith(color: foregroundColor),
            ),
          ],
        ),
      ),
    );
  }
}
