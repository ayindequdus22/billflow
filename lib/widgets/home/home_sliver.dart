import 'package:flutter/material.dart';
import 'package:billflow/widgets/home/home_category.dart';
import 'package:billflow/widgets/home/home_appbar_sliver.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:billflow/models/home/upcoming_bill_model.dart';
import 'package:billflow/widgets/home/bill_item.dart';

class HomeSliver extends StatelessWidget {
  const HomeSliver({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeContext = Theme.of(context);
    return CustomScrollView(
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
              borderRadius: BorderRadius.circular(16.r),
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
        SliverToBoxAdapter(child: _buildHeader(themeContext)),
        HomeUpcomingBills(themeContext: themeContext),
      ],
    );
  }
}

class HomeUpcomingBills extends StatelessWidget {
  const HomeUpcomingBills({super.key, required this.themeContext});

  final ThemeData themeContext;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: bills.length > 3 ? 3 : bills.length,
          (context, index) {
            return BillItem(bill: bills[index], themeContext: themeContext);
          },
        ),
      ),
    );
  }
}

Container _buildHeader(ThemeData themeContext) {
  return Container(
    margin: EdgeInsets.only(left: 10.r, right: 10.r, top: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Upcoming Bills", style: themeContext.textTheme.headlineLarge),
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
  );
}
