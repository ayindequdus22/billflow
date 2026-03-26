import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container appBar(ThemeData theme) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
    decoration: BoxDecoration(
      color: theme.colorScheme.surfaceBright,
      border: Border.all(color: theme.colorScheme.outline, width: 1.h),
    ),
    child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Column(
            spacing: 4.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Settings", style: theme.textTheme.headlineLarge),
              Text(
                "Manage your preferences",
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.surfaceContainer,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
