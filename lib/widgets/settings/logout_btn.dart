  import 'package:billflow/theme/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Container logoutBtn(BuildContext context) {
    AppColorScheme colorScheme = AppColorScheme();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.r),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.danger,
          foregroundColor: (Colors.white),

          splashFactory: InkSparkle.splashFactory,
          textStyle: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(color: Colors.white),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),

        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 18.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/logout.svg",
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                width: 25.w,
                height: 25.h,
              ),

              8.horizontalSpace,
              Text("Logout"),
            ],
          ),
        ),
      ),
    );
  }
