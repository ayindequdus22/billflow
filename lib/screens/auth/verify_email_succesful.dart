import 'package:billflow/theme/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VerifyEmailSuccesful extends StatefulWidget {
  const VerifyEmailSuccesful({super.key});

  @override
  State<VerifyEmailSuccesful> createState() => _VerifyEmailSuccesfulState();
}

class _VerifyEmailSuccesfulState extends State<VerifyEmailSuccesful> {
  @override
  void initState() {
    // redirect to add bill screen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      // Navigator.pushReplacementNamed(context, "/add-bill");
      Get.offAndToNamed("/setup");
      // Get.snackbar(
      //   "Success",
      //   "Email verified successfully!",
      //   snackPosition: SnackPosition.BOTTOM,
      // );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColorScheme().success,
                border: Border.all(
                  color: Color.fromRGBO(134, 239, 172, 0.5),
                  width: 15.r,
                ),
              ),
              child: Image.asset(
                "assets/images/green-check.png",
                color: Colors.white,
                width: 90.h,
                // width: 100.r,
                // height: 100.r,
              ),
            ),
            20.verticalSpace,
            Text(
              "Email Verified Successfully!",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            8.verticalSpace,

            Text(
              "Your email has been verified. Get ready to manage your bills smarter.",
              style: themeContext.textTheme.bodyLarge?.copyWith(
                color: themeContext.colorScheme.surfaceBright,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
