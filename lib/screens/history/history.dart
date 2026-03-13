import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            //
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceBright,
              border: Border.all(color: theme.colorScheme.outline, width: 1.h),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    spacing: 4.h,
                    children: [
                      Text(
                        "Payment History",
                        style: theme.textTheme.headlineLarge,
                      ),
                      Text(
                        "Track your past payments",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.surfaceContainer,
                        ),
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
