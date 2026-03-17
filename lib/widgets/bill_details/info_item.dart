import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoItem extends StatelessWidget {
  final String iconPath;
  final Color backgroundColor;
  final Color iconColor;
  final String label;
  final String value;
  final TextStyle? valueStyle;

  const InfoItem({
    super.key,
    required this.iconPath,
    required this.backgroundColor,
    required this.iconColor,
    required this.label,
    required this.value,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(
            iconPath,
            height: 20,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: theme.textTheme.bodySmall!.copyWith(
                color: theme.colorScheme.surfaceContainer,
              ),
            ),
            Text(value, style: valueStyle ?? theme.textTheme.bodyMedium),
          ],
        ),
      ],
    );
  }
}
