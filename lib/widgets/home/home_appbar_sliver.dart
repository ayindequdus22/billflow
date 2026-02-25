import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double maxHeaderHeight = 150.h;
  final double minHeaderHeight = 100.h;

  @override
  double get maxExtent => maxHeaderHeight;

  @override
  double get minExtent => minHeaderHeight;

  @override
  bool shouldRebuild(covariant HomeSliverAppBarDelegate oldDelegate) => false;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);

    // Progress between 0 (min) and 1 (max)
    final progress = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(48.r),
          bottomRight: Radius.circular(48.r),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hello Anteqs,",
                    style: theme.textTheme.headlineLarge?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),

                // Subtitle — floats & disappears
                Positioned(
                  bottom: 5.h,
                  // top: ,
                  // bottom: 0,
                  child: Opacity(
                    opacity: 1 - progress,
                    child: Transform.translate(
                      offset: Offset(0, 12 * progress),
                      child: Text(
                        "Here's your financial overview",
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
