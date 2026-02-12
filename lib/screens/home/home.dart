import 'package:billflow/widgets/home/home_category.dart';
import 'package:billflow/widgets/home/home_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeContext = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: HomeSliverAppBarDelegate(),
            pinned: true,
          ),

          SliverToBoxAdapter(child: HomeCategory()),

          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.r),
              padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 16.h),

              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onErrorContainer,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/icons/alert.svg",
                    width: 30.w,
                    colorFilter: ColorFilter.mode(
                      themeContext.colorScheme.error,
                      BlendMode.srcIn,
                    ),
                  ),
                  8.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "1 bill overdue",
                          style: themeContext.textTheme.bodyLarge?.copyWith(
                            color: themeContext.colorScheme.error,
                          ),
                        ),
                        Text(
                          "Please review and mark as paid to stay on track",
                          style: themeContext.textTheme.bodyMedium?.copyWith(
                            color: themeContext.colorScheme.error,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: HomeUpcomingBills(themeContext: themeContext),
          ),
        ],
      ),
    );
  }
}

class HomeUpcomingBills extends StatelessWidget {
  const HomeUpcomingBills({super.key, required this.themeContext});

  final ThemeData themeContext;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 20.h),

      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Upcoming Bills",
                style: themeContext.textTheme.headlineLarge,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "View All",
                  style: themeContext.textTheme.bodyLarge!.copyWith(
                    color: themeContext.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: List.generate(
              3,
              (index) => Container(
                margin: EdgeInsets.only(bottom: 12.h),

                padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 14.h),
                decoration: BoxDecoration(
                  color: themeContext.colorScheme.surfaceBright,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: themeContext.colorScheme.outline),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Electricity Bill",
                          style: themeContext.textTheme.bodyLarge,
                        ),
                        Text(
                          "Due in 3 days",
                          style: themeContext.textTheme.bodyMedium?.copyWith(
                            color: themeContext.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "\$120.00",
                          style: themeContext.textTheme.bodyLarge,
                        ),
                        Text(
                          "Monthly",
                          style: themeContext.textTheme.bodyMedium!.copyWith(
                            color: themeContext.colorScheme.surfaceContainer,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
