import 'package:billflow/models/bills/bills.dart';
import 'package:billflow/widgets/build_category_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int selectedCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HistoryAppBar(
            categories: BillModel.categories,
            onCategorySelected: (index) {
              setState(() {
                selectedCategoryIndex = index;
              });
            },
            selectedIndex: selectedCategoryIndex,
            // billStatus: BillModel.billStatus,
          ),
        ],
      ),
    );
  }
}

class HistoryAppBar extends StatelessWidget {
  const HistoryAppBar({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategorySelected,
  });
  final List<String> categories;
  final int selectedIndex;
  final ValueChanged<int> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
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
          spacing: 16.h,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4.h,
              children: [
                Text("Payment History", style: theme.textTheme.headlineLarge),
                Text(
                  "Track your past payments",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.surfaceContainer,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Filter By Month",
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
            // month picker
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
