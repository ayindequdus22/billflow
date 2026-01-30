import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

final List<String> bottomText = [
  "At least 8 characters",
  "One uppercase and lowercase letter",
  "One number or special character",
];

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                50.verticalSpace,
                SvgPicture.asset(
                  "assets/icons/logo.svg",
                  height: 70.h,
                  width: 70.h,
                ),
                24.verticalSpace,
                Text(
                  "Create Account",
                  style: themeContext.textTheme.headlineLarge,
                ),
                8.verticalSpace,
                Text(
                  "Start your journey to better bill management",
                  style: themeContext.textTheme.bodyMedium?.copyWith(
                    color: themeContext.colorScheme.onSurfaceVariant,
                  ),
                ),
                30.verticalSpace,
              ],
            ),

            Form(
              child: Column(
                spacing: 10.h,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4.h,

                    children: [
                      Text(
                        "Full name",
                        style: themeContext.textTheme.bodyMedium,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 30.w,
                            minHeight: 0,
                          ),
                          hintText: "Enter your name",
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 12.w, right: 1.w),
                            child: SvgPicture.asset(
                              "assets/icons/user.svg",
                              height: 20.h,
                              width: 20.h,
                              colorFilter: ColorFilter.mode(
                                Color.fromRGBO(148, 163, 184, 1),
                                BlendMode.srcIn,
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4.h,

                    children: [
                      Text("Email", style: themeContext.textTheme.bodyMedium),
                      TextField(
                        decoration: InputDecoration(
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 30.w,
                            minHeight: 0,
                          ),
                          hintText: "yourname@email.com",
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 12.w, right: 1.w),
                            child: SvgPicture.asset(
                              "assets/icons/mail-01.svg",
                              height: 20.h,
                              width: 20.h,
                              colorFilter: ColorFilter.mode(
                                Color.fromRGBO(148, 163, 184, 1),
                                BlendMode.srcIn,
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4.h,

                    children: [
                      Text(
                        "Password",
                        style: themeContext.textTheme.bodyMedium,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Create your password",
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 30.w,
                            minHeight: 0,
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 12.w, right: 1.w),

                            child: SvgPicture.asset(
                              "assets/icons/lock-password.svg",
                              height: 20.h,
                              width: 20.h,
                              colorFilter: ColorFilter.mode(
                                Color.fromRGBO(148, 163, 184, 1),
                                BlendMode.srcIn,
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4.h,

                    children: [
                      Text(
                        "Confirm Password",
                        style: themeContext.textTheme.bodyMedium,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 30.w,
                            minHeight: 0,
                          ),
                          hintText: "Enter your password",
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 12.w, right: 1.w),

                            child: SvgPicture.asset(
                              "assets/icons/lock-password.svg",
                              height: 20.h,
                              width: 20.h,
                              colorFilter: ColorFilter.mode(
                                Color.fromRGBO(148, 163, 184, 1),
                                BlendMode.srcIn,
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  8.verticalSpace,
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: themeContext.colorScheme.surfaceTint,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: themeContext.colorScheme.primaryContainer,
                        // color: Color.fromRGBO(168, 200, 255, 1),
                        width: 1.w,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Password must contain:",
                          style: themeContext.textTheme.bodyMedium?.copyWith(
                            color: themeContext.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        6.verticalSpace,
                        ...bottomText.map(
                          (text) => Container(
                            margin: EdgeInsets.symmetric(vertical: 4.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 5.w,
                              children: [
                                3.horizontalSpace,
                                Text(
                                  ".",
                                  style: themeContext.textTheme.bodySmall
                                      ?.copyWith(
                                        color: themeContext
                                            .colorScheme
                                            .onSurfaceVariant,
                                      ),
                                ),
                                Text(
                                  text,
                                  style: themeContext.textTheme.bodySmall
                                      ?.copyWith(
                                        color: themeContext
                                            .colorScheme
                                            .onSurfaceVariant,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  16.verticalSpace,
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed("/auth/verify-mail");
                    },
                    child: Text(
                      "Create Account",
                      // style: themeContext.textTheme.bodyLarge?.copyWith(
                      //   color: Colors.white,
                      // ),
                    ),
                  ),
                ],
              ),
            ),
            4.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: themeContext.textTheme.bodyLarge?.copyWith(
                    color: themeContext.colorScheme.onSurfaceVariant,
                  ),
                ),
                TextButton(
                  onPressed: () => Get.toNamed("/auth/login"),
                  child: Text(
                    "Sign In",
                    style: themeContext.textTheme.bodyLarge?.copyWith(
                      color: themeContext.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
