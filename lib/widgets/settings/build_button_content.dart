import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Row buildButtonContent(
    ThemeData theme, {
    required Color iconColor,
    required String header,
    required String body,
    required String iconPath,
    required Color borderColor,
    required Color containerColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 12.w,
          children: [
            Container(
              padding: EdgeInsets.all(10.h),
              decoration: BoxDecoration(
                color: containerColor,
                border: Border.all(color: borderColor, width: 1.h),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: SvgPicture.asset(
                width: 20.h,
                height: 20.h,
                iconPath,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4.h,
              children: [
                Text(header, style: theme.textTheme.bodyMedium),
                Text(
                  body,
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: theme.colorScheme.surfaceContainer,
                  ),
                ),
              ],
            ),
          ],
        ),
        SvgPicture.asset(
          "assets/icons/arrow-right.svg",
          colorFilter: ColorFilter.mode(
            theme.colorScheme.onSurfaceVariant,
            BlendMode.srcIn,
          ),
        ),
      ],
    );
  }
