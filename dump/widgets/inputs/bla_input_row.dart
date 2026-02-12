import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class BlaInputRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isPlaceholder;

  const BlaInputRow({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isPlaceholder = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: BlaSpacings.m, vertical: BlaSpacings.m),
        child: Row(
          children: [
            Icon(icon, color: BlaColors.neutralLight, size: 24),
            const SizedBox(width: BlaSpacings.m),
            Expanded(
              child: Text(
                label,
                style: BlaTextStyles.body.copyWith(
                  color: isPlaceholder
                      ? BlaColors.neutralLighter
                      : BlaColors.textNormal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}