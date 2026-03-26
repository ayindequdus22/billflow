import 'package:billflow/widgets/settings/section_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    return Scaffold(
      body: Column(
        spacing: 10.h,
        children: [ SettingsSectionAppBar(title: "Notifications"),
          10.verticalSpace,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.r),
            padding: EdgeInsets.all(16.h),
            decoration: BoxDecoration(
              color: themeContext.colorScheme.surfaceBright,
              border: Border.all(
                color: themeContext.colorScheme.outline,
                width: 1.h,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 12.w,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.h),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(247, 223, 223, 1),
                          border: Border.all(
                            color: Color.fromRGBO(231, 185, 185, 1),
                            width: 1.h,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: SvgPicture.asset(
                          width: 20.h,
                          height: 20.h,
                          "assets/icons/notification.svg",
                          colorFilter: ColorFilter.mode(
                            Color.fromRGBO(199, 84, 84, 1),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 4.h,
                        children: [
                          Text(
                            "Enable Reminders",
                            style: themeContext.textTheme.bodyMedium,
                          ),
                          Text(
                            "Get notified when bills are due",
                            style: themeContext.textTheme.bodySmall!.copyWith(
                              color: themeContext.colorScheme.surfaceContainer,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Switch(value: true, onChanged: (value) {}),
                ],
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.r),
            padding: EdgeInsets.all(16.h),
            decoration: BoxDecoration(
              color: themeContext.colorScheme.surfaceBright,
              border: Border.all(
                color: themeContext.colorScheme.outline,
                width: 1.h,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4.h,
                  children: [
                    Text(
                      "Reminder Timing",
                      style: themeContext.textTheme.bodyMedium,
                    ),
                    Text(
                      "Choose when you want to be reminded before a bill is due",
                      style: themeContext.textTheme.bodySmall!.copyWith(
                        color: themeContext.colorScheme.surfaceContainer,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.r),
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.h),
            decoration: BoxDecoration(
              border: Border.all(
                color: themeContext.colorScheme.primaryContainer,
                width: 1.h,
              ),
              color: themeContext.colorScheme.primaryFixed,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12.h,
              children: [
                Text(
                  "About Reminders",
                  style: themeContext.textTheme.bodyMedium!.copyWith(
                    color: themeContext.colorScheme.primary,
                  ),
                ),
                Text(
                  "You'll receive a notification before each bill is due based on your selected timing. Make sure notifications are enabled in your device settings.",
                  style: themeContext.textTheme.bodySmall!.copyWith(
                    color: themeContext.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),

          10.verticalSpace,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.r),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Save Preferences"),
            ),
          ),
        ],
      ),
    );
  }
}
