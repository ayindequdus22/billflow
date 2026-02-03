import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
   Future<void> login() async {
      setState(() {
        isLoading = true;
      });

      try {
        // Simulate a network call
        await Future.delayed(const Duration(seconds: 2));
        // Get.offAllNamed("/auth/verify-mail");
        // verification logic here
      } catch (e) {
        // handle error if needed
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }

  @override
  Widget build(BuildContext context) {
 
    final themeContext = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                      Text("Email", style: themeContext.textTheme.bodyMedium),
                      TextField(
                        keyboardType: TextInputType.emailAddress,

                        decoration: InputDecoration(
                          hintText: "yourname@email.com",
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 30,
                            minHeight: 0,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                              left: 12.0,
                              right: 1.0,
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/mail-01.svg",
                              height: 20.h,
                              width: 20.h,
                              colorFilter: ColorFilter.mode(
                                Color.fromRGBO(148, 163, 184, 1),
                                BlendMode.srcIn,
                              ),
                              // fit: BoxFit.contain,
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
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter your password",
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
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(onPressed: () {}, child: Text("Forgot Password?")),
                  8.verticalSpace,
                  ElevatedButton(
                    onPressed: () => login(),
                    child: isLoading
                        ? SizedBox(
                            width: 20.w,
                            height: 20.h,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text("Login"),
                  ),
                ],
              ),
            ),
            16.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: themeContext.textTheme.bodyLarge?.copyWith(
                    color: themeContext.colorScheme.onSurfaceVariant,
                  ),
                ),
                TextButton(
                  onPressed: () => Get.toNamed("/auth/register"),
                  child: Text(
                    "Sign Up",
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
