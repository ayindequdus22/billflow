import 'package:billflow/widgets/settings/section_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SettingsSectionAppBar(title: "Privacy Policies"),
          20.verticalSpace,

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10.r),
              child: Column(
                spacing: 16.h,
                children: const [
                  InfoCard(
                    iconPath: "assets/icons/database.svg",
                    title: "Data Collection",
                    description:
                        "We collect only essential information needed to provide bill tracking services, including bill details, payment history, and reminder preferences.",
                    iconColor: Color.fromRGBO(76, 58, 255, 1),
                    borderColor: Color.fromRGBO(190, 184, 255, 1),
                    containerColor: Color.fromRGBO(231, 228, 255, 1),
                  ),

                  InfoCard(
                    iconPath: "assets/icons/lock-password.svg",
                    title: "Data Security",
                    description:
                        "Your data is encrypted both in transit and at rest. We use industry-standard security measures to protect your information.",
                    iconColor: Color.fromRGBO(0, 158, 157, 1),
                    borderColor: Color.fromRGBO(174, 239, 237, 1),
                    containerColor: Color.fromRGBO(214, 244, 243, 1),
                  ),

                  InfoCard(
                    iconPath: "assets/icons/view.svg",
                    title: "Data Usage",
                    description:
                        "We never sell your personal information to third parties. Your data is used solely to provide and improve our services.",
                    iconColor: Color.fromRGBO(200, 93, 0, 1),
                    borderColor: Color.fromRGBO(255, 214, 184, 1),
                    containerColor: Color.fromRGBO(255, 230, 214, 1),
                  ),

                  InfoCard(
                    iconPath: "assets/icons/user-check.svg",
                    title: "Your Rights",
                    description:
                        "You have the right to access, modify, or delete your data at any time. Contact support for assistance with data requests.",
                    iconColor: Color.fromRGBO(122, 0, 143, 1),
                    borderColor: Color.fromRGBO(231, 184, 239, 1),
                    containerColor: Color.fromRGBO(243, 214, 249, 1),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String description;
  final Color iconColor;
  final Color borderColor;
  final Color containerColor;

  const InfoCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.description,
    required this.iconColor,
    required this.borderColor,
    required this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: _cardDecoration(
        theme.colorScheme.surfaceBright,
        theme.colorScheme.outline,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12.w,
        children: [
          _iconBox(
            iconPath: iconPath,
            borderColor: borderColor,
            containerColor: containerColor,
            iconColor: iconColor,
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.bodyMedium),
                SizedBox(height: 4.h),
                Text(
                  description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.surfaceContainer,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _iconBox({
  required String iconPath,
  required Color borderColor,
  required Color containerColor,
  required Color iconColor,
}) {
  return Container(
    padding: EdgeInsets.all(10.h),
    decoration: BoxDecoration(
      color: containerColor,
      border: Border.all(color: borderColor, width: 1),
      borderRadius: BorderRadius.circular(8.r),
    ),
    child: SvgPicture.asset(
      iconPath,
      width: 20.h,
      height: 20.h,
      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
    ),
  );
}

/// Shared Card Decoration
BoxDecoration _cardDecoration(Color surfaceBright, Color outline) {
  return BoxDecoration(
    color: surfaceBright,
    borderRadius: BorderRadius.circular(12.r),
    border: Border.all(color: outline),
  );
}
