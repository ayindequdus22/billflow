import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SvgPicture.asset(
                  "assets/icons/logo.svg",
                  height: 70.h,
                  width: 70.h,
                ),
                24.verticalSpace,
                Text(
                  "Welcome Back",
                  style: themeContext.textTheme.headlineLarge,
                ),
                8.verticalSpace,
                Text(
                  "Sign in to continue managing your bills",
                  style: themeContext.textTheme.bodyMedium?.copyWith(
                    color: themeContext.colorScheme.surfaceBright,
                  ),
                ),
                30.verticalSpace,
              ],
            ),

            Form(
              child: Column(
                spacing: 8.h,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email", style: themeContext.textTheme.bodyMedium),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "yourname@email.com",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(
                              12.0,
                            ), // Adjust padding as needed
                            child: SvgPicture.asset(
                              "assets/icons/mail-01.svg",
                              height: 2.h,
                              width: 2.h,
                              colorFilter: ColorFilter.mode(
                                themeContext.colorScheme.onPrimaryContainer,
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

                    children: [
                      Text(
                        "Password",
                        style: themeContext.textTheme.bodyMedium,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(
                              12.0,
                            ), // Adjust padding as needed
                            child: SvgPicture.asset(
                              "assets/icons/lock-password.svg",
                              height: 2.h,
                              width: 2.h,
                              colorFilter: ColorFilter.mode(
                                themeContext.colorScheme.onPrimaryContainer,
                                BlendMode.srcIn,
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(onPressed: () {}, child: Text("Forgot Password?")),
                  8.verticalSpace,
                  ElevatedButton(onPressed: () {}, child: Text("Login")),
                ],
              ),
            ),
            16.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(onPressed: () {}, child: Text("Sign Up")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
