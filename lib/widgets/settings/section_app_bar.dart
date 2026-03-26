import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SettingsSectionAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const SettingsSectionAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      centerTitle: true,
      elevation: 0,
      toolbarHeight: 60.h,
      shape: Border(
        bottom: BorderSide(color: theme.colorScheme.outline, width: 1),
      ),
      leading: IconButton(
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
      title: Text(title, style: theme.textTheme.titleLarge),
      titleSpacing: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
