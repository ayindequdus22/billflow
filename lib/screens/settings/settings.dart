import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            //
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceBright,
              border: Border.all(color: theme.colorScheme.outline, width: 1.h),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Column(
                    spacing: 4.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Settings", style: theme.textTheme.headlineLarge),
                      Text(
                        "Manage your preferences",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: theme.colorScheme.surfaceContainer,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          ///
          ///
          20.verticalSpace,

          Container(
            padding: EdgeInsets.all(16.h),
            margin: EdgeInsets.symmetric(horizontal: 10.r),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceBright,
              border: Border.all(color: theme.colorScheme.outline, width: 1.h),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  spacing: 10.w,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/profile_pic.png",
                      ),
                      radius: 30.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4.h,
                      children: [
                        Text(
                          "Blessing Garuba",
                          style: theme.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "blessinggaruba@gmail.com",
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: theme.colorScheme.surfaceContainer,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  // padding: EdgeInsets.zero,
                  icon: SvgPicture.asset(
                    "assets/icons/edit.svg",
                    height: 30.h,
                    colorFilter: ColorFilter.mode(
                      theme.colorScheme.onSurfaceVariant,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),

          ///
          ///
          20.verticalSpace,

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.r),
            child: Column(
              spacing: 8.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Preferences",
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceBright,
                    border: Border.all(
                      color: theme.colorScheme.outline,
                      width: 1.h,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Dark Mode", style: theme.textTheme.bodyLarge),
                            Switch(
                              value: true,
                              onChanged: (value) {},
                              activeColor: theme.colorScheme.primary,
                            ),
                          ],
                        ),
                      ),

                      Divider(color: theme.colorScheme.outline),

                      // InkWell(
                      //   child: Container(
                      //     padding: EdgeInsets.all(16.h),
                      //     child: buildButtonContent(
                      //       theme,
                      //       header: "Notifications",
                      //       body: "Manage when you receive reminders",
                      //       iconColor: theme.colorScheme.primary,
                      //       iconPath: "assets/icons/notification.svg",borderColor: ,containerColor: ,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row buildButtonContent(
    ThemeData theme, {
    required Color iconColor,
    required String header,
    required String body,
    required String iconPath,
    required Color borderColor,
    required Color containerColor
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 12.w,
          children: [
            Container(
              decoration: BoxDecoration(
                color: containerColor,
                border:Border.all(color: borderColor, width: 1.h) ,borderRadius: BorderRadius.circular(8.r)),
              child: SvgPicture.asset(
                iconPath,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4.h,
              children: [
                Text(header, style: theme.textTheme.bodyMedium),
                Text(
                  body,
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: theme.colorScheme.surfaceContainer,
                  ),
                ),
              ],
            ),
          ],
        ),
        SvgPicture.asset(
          "assets/icons/arrow-right.svg",
          colorFilter: ColorFilter.mode(
            theme.colorScheme.onSurfaceVariant,
            BlendMode.srcIn,
          ),
        ),
      ],
    );
  }
}
