import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class StartSetup extends StatelessWidget {
  const StartSetup({super.key});

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: themeContext.colorScheme.primaryFixed,
              ),
              child: Center(
                child: SizedBox(
                  width: 40.w,
                  height: 40.h,
                  child: SvgPicture.asset(
                    "assets/icons/plus.svg",
                    colorFilter: ColorFilter.mode(
                      themeContext.colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
            32.verticalSpace,
            Text(
              "Quick Bill Setup",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            8.verticalSpace,

            Text(
              "Adding bills is fast and simple. Get started in seconds and let BillFlow handle the rest.",
              style: themeContext.textTheme.bodyLarge?.copyWith(
                color: themeContext.colorScheme.surfaceBright,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/add-bill");
                // Navigate to the next setup step
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 56.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                "Add your first bill",
                style: themeContext.textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            70.verticalSpace,
          ],
        ),
      ),
    );
  }
}
