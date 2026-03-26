import 'package:billflow/utils/route.dart';
import 'package:billflow/widgets/settings/app_bar.dart';
import 'package:billflow/widgets/settings/build_button_content.dart';
import 'package:billflow/widgets/settings/logout_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          appBar(theme),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                spacing: 15.h,
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
                                onTap: () =>
                                    Get.toNamed(AppRoutes.notification),
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
                                onTap: () => Get.toNamed(AppRoutes.categories),
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
                                onTap: () => Get.toNamed(AppRoutes.help),
                                child: Container(
                                  padding: EdgeInsets.all(16.h),
                                  child: buildButtonContent(
                                    theme,
                                    header: "Help & Support",
                                    body: "Customise bill categories",
                                    iconColor: Color.fromRGBO(106, 77, 160, 1),
                                    iconPath: "assets/icons/help.svg",
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
                                onTap: () => Get.toNamed(AppRoutes.privacy),
                                child: Container(
                                  padding: EdgeInsets.all(16.h),
                                  child: buildButtonContent(
                                    theme,
                                    header: "Privacy Policies",
                                    body: "Customise bill categories",
                                    iconColor: Color.fromRGBO(74, 85, 104, 1),
                                    iconPath: "assets/icons/shield.svg",
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
                                    iconPath: "assets/icons/info.svg",
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

                  logoutBtn(context),

                  10.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
