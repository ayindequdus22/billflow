import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SettingsSectionAppBar extends StatelessWidget {
  final String title;

  const SettingsSectionAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: theme.colorScheme.outline, width: 1),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          spacing: 16.w,
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: SvgPicture.asset(
                "assets/icons/back-arrow.svg",
                colorFilter: ColorFilter.mode(
                  theme.colorScheme.onSurfaceVariant,
                  BlendMode.srcIn,
                ),
                height: 30.h,
              ),
            ),

            Text(title, style: theme.textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
