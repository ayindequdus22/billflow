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
          // 20.verticalSpace,

          ///
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  20.verticalSpace,
                  Container(
                    padding: EdgeInsets.all(16.h),
                    margin: EdgeInsets.symmetric(horizontal: 10.r),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceBright,
                      border: Border.all(
                        color: theme.colorScheme.outline,
                        width: 1.h,
                      ),
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
                              InkWell(
                                child: Container(
                                  padding: EdgeInsets.all(16.h),
                                  child: buildButtonContent(
                                    theme,
                                    header: "Notifications",
                                    body: "Manage when you receive reminders",
                                    iconColor: Color.fromRGBO(199, 84, 84, 1),
                                    iconPath: "assets/icons/notification.svg",
                                    borderColor: Color.fromRGBO(
                                      231,
                                      185,
                                      185,
                                      1,
                                    ),
                                    containerColor: Color.fromRGBO(
                                      247,
                                      223,
                                      223,
                                      1,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(color: theme.colorScheme.outline),

                              InkWell(
                                child: Container(
                                  padding: EdgeInsets.all(16.h),
                                  child: buildButtonContent(
                                    theme,
                                    header: "Categories",
                                    body: "Customise bill categories",
                                    iconColor: Color.fromRGBO(47, 127, 138, 1),
                                    iconPath: "assets/icons/clipboard.svg",
                                    borderColor: Color.fromRGBO(
                                      181,
                                      215,
                                      219,
                                      1,
                                    ),
                                    containerColor: Color.fromRGBO(
                                      223,
                                      240,
                                      242,
                                      1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                          "Support",
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
                              InkWell(
                                child: Container(
                                  padding: EdgeInsets.all(16.h),
                                  child: buildButtonContent(
                                    theme,
                                    header: "Help & Support",
                                    body: "Customise bill categories",
                                    iconColor: Color.fromRGBO(106, 77, 160, 1),
                                    iconPath: "assets/icons/notification.svg",
                                    borderColor: Color.fromRGBO(
                                      210,
                                      190,
                                      234,
                                      1,
                                    ),
                                    containerColor: Color.fromRGBO(
                                      238,
                                      231,
                                      248,
                                      1,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(color: theme.colorScheme.outline),

                              InkWell(
                                child: Container(
                                  padding: EdgeInsets.all(16.h),
                                  child: buildButtonContent(
                                    theme,
                                    header: "Privacy Policies",
                                    body: "Customise bill categories",
                                    iconColor: Color.fromRGBO(74, 85, 104, 1),
                                    iconPath: "assets/icons/clipboard.svg",
                                    borderColor: Color.fromRGBO(
                                      209,
                                      215,
                                      224,
                                      1,
                                    ),
                                    containerColor: Color.fromRGBO(
                                      237,
                                      240,
                                      245,
                                      1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                          "About",
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
                              InkWell(
                                child: Container(
                                  padding: EdgeInsets.all(16.h),
                                  child: buildButtonContent(
                                    theme,
                                    header: "App Information",
                                    body: "Version 1.0.0",
                                    iconColor: Color.fromRGBO(26, 115, 232, 1),
                                    iconPath: "assets/icons/notification.svg",
                                    borderColor: Color.fromRGBO(
                                      168,
                                      200,
                                      255,
                                      1,
                                    ),
                                    containerColor: Color.fromRGBO(
                                      232,
                                      241,
                                      255,
                                      1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
    required Color containerColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 12.w,
          children: [
            Container(
              padding: EdgeInsets.all(10.h),
              decoration: BoxDecoration(
                color: containerColor,
                border: Border.all(color: borderColor, width: 1.h),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: SvgPicture.asset(
                width: 20.h,
                height: 20.h,
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
