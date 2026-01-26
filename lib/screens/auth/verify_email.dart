import 'package:billflow/theme/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool isLoading = false;

  Future<void> verifyCode(String code) async {
    setState(() {
      isLoading = true;
    });

    try {
      // Simulate a network call
      await Future.delayed(const Duration(seconds: 2));
      Get.offAllNamed("/auth/verify-mail/success");
      // verification logic here
    } catch (e) {
      // handle error if needed
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  final TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    final appColorScheme = AppColorScheme();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: ScreenUtil().screenHeight * 0.2),
                Container(
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    color: themeContext.colorScheme.primaryFixed,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/mail-01.svg",
                    colorFilter: ColorFilter.mode(
                      themeContext.colorScheme.primary,
                      BlendMode.srcIn,
                    ),

                    height: 50.h,
                    // width: 70.h,
                  ),
                ),
                24.verticalSpace,
                Text(
                  "Verify Your Email",
                  style: themeContext.textTheme.headlineLarge,
                ),
                8.verticalSpace,
                Text(
                  "We sent a 6-digit code to user@example.com. Enter it below to verify your account.",
                  style: themeContext.textTheme.bodyMedium?.copyWith(
                    color: themeContext.colorScheme.surfaceBright,
                  ),
                  textAlign: TextAlign.center,
                ),
                30.verticalSpace,
              ],
            ),

            Pinput(
              length: 6,
              keyboardType: TextInputType.number,
              controller: pinController,
              closeKeyboardWhenCompleted: true,

              focusedPinTheme: PinTheme(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: themeContext.colorScheme.primary),
                ),
              ),
              defaultPinTheme: PinTheme(
                width: 50.w,
                height: 50.h,
                textStyle: themeContext.textTheme.bodyLarge?.copyWith(
                  color: appColorScheme.disableTextColor,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: appColorScheme.disableTextColor),
                ),
              ),
            ),
            30.verticalSpace,
            ElevatedButton(
              onPressed: isLoading ? null : () => verifyCode("123456"),
              child: isLoading
                  ? SizedBox(
                      width: 20.w,
                      height: 20.h,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text("Verify Code"),
            ),
          ],
        ),
      ),
    );
  }
}
