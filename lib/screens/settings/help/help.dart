import 'package:billflow/widgets/settings/build_button_content.dart';
import 'package:billflow/widgets/settings/section_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          SettingsSectionAppBar(title: "Help & Support"),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10.r),
              child: Column(
                children: [
                  20.verticalSpace,

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    spacing: 8.h,
                    children: [
                      Text(
                        "Contact Us",
                        style: theme.textTheme.bodyMedium,
                        textAlign: TextAlign.start,
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
                              onTap: () => {},
                              child: Container(
                                padding: EdgeInsets.all(16.h),
                                child: buildButtonContent(
                                  theme,
                                  header: "Live Chat",
                                  body: "Chat with our support team",
                                  iconColor: Color.fromRGBO(14, 154, 175, 1),
                                  iconPath: "assets/icons/chat-bot.svg",
                                  borderColor: Color.fromRGBO(167, 220, 226, 1),
                                  containerColor: Color.fromRGBO(
                                    217,
                                    243,
                                    246,
                                    1,
                                  ),
                                ),
                              ),
                            ),
                            Divider(color: theme.colorScheme.outline),

                            InkWell(
                              onTap: () => {},
                              child: Container(
                                padding: EdgeInsets.all(16.h),
                                child: buildButtonContent(
                                  theme,
                                  header: "Email Support",
                                  body: "support@billflow.com",
                                  iconColor: Color.fromRGBO(184, 92, 158, 1),
                                  iconPath: "assets/icons/mail.svg",
                                  borderColor: Color.fromRGBO(226, 192, 216, 1),
                                  containerColor: Color.fromRGBO(
                                    255,
                                    227,
                                    239,
                                    1,
                                  ),
                                ),
                              ),
                            ),
                            Divider(color: theme.colorScheme.outline),

                            InkWell(
                              onTap: () => {},
                              child: Container(
                                padding: EdgeInsets.all(16.h),
                                child: buildButtonContent(
                                  theme,
                                  header: "Documentation",
                                  body: "Read our guides and tutorials",
                                  iconColor: Color.fromRGBO(85, 103, 196, 1),
                                  iconPath: "assets/icons/file.svg",
                                  borderColor: Color.fromRGBO(195, 203, 239, 1),
                                  containerColor: Color.fromRGBO(
                                    227,
                                    231,
                                    248,
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

                  10.verticalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Frequently Asked Questions",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
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
