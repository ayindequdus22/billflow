// import 'package:billflow/widgets/select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillAppBar extends StatelessWidget {
  const BillAppBar({
    super.key,
    required this.categories,
    // required this.billStatus,
    required this.selectedIndex,
    required this.onCategorySelected,
  });

  final List<String> categories;
  // final List<String> billStatus;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bills", style: theme.textTheme.headlineLarge),
            16.verticalSpace,

            // Select(
            //   title: "Filter By",
            //   hintText: "All Bills",
            //   items: billStatus,
            //   selectedItem: billStatus[0],
            // ),

            16.verticalSpace,

            SizedBox(
              height: 40.h,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, _) => SizedBox(width: 8.w),
                itemBuilder: (_, index) =>
                    _buildCategoryButton(categories[index], index, theme),
              ),
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String title, int index, ThemeData theme) {
    final isSelected = selectedIndex == index;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: isSelected
            ? theme.colorScheme.primary
            : theme.colorScheme.surfaceTint,
        minimumSize: Size(0, 30.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
        ),
      ),
      onPressed: () => onCategorySelected(index),
      child: Text(
        title,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: isSelected ? Colors.white : null,
        ),
      ),
    );
  }
}
