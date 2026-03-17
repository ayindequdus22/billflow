// import 'package:billflow/widgets/select.dart';
import 'package:billflow/widgets/build_category_btn.dart';
import 'package:billflow/widgets/select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillAppBar extends StatelessWidget {
  const BillAppBar({
    super.key,
    required this.categories,
    required this.billStatus,
    required this.selectedIndex,
    required this.onCategorySelected,
  });

  final List<String> categories;
  final List<String> billStatus;

  final int selectedIndex;
  final ValueChanged<int> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceBright,
        border: Border.all(color: theme.colorScheme.outline, width: 1.h),
      ),
      child: SafeArea(
        child: Column(
          spacing: 16.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bills", style: theme.textTheme.headlineLarge),

            Select(
              title: "Filter By",
              hintText: "All Bills",
              items: billStatus,
              selectedItem: billStatus[0],
            ),

            BuildCategoryButton(
              categories: categories,
              selectedIndex: selectedIndex,
              onCategorySelected: onCategorySelected,
              theme: theme,
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
