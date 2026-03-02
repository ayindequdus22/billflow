import 'package:billflow/models/bills/bills.dart';
import 'package:billflow/widgets/select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillScreen extends StatelessWidget {
  const BillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [BillAppBar(), 20.verticalSpace, Text("riorne")]),
    );
  }
}

class BillAppBar extends StatefulWidget {
  const BillAppBar({super.key});
  static List<String> categories = [
    "All Categories",
    ...BillCategory.values.map(
      (e) => e.displayName[0].toUpperCase() + e.displayName.substring(1),
    ),
  ];

  @override
  State<BillAppBar> createState() => _BillAppBarState();
}

class _BillAppBarState extends State<BillAppBar> {
  int isSelectedIndex = 0;
  List<String> billStatus = [
    "All Bills",
    ...BillStatus.values.map((e) => e.displayName),
  ];
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
            Column(
              children: [
                Select(
                  title: "Filter By",
                  hintText: "All Bills",
                  items: billStatus,
                  selectedItem: billStatus[0],
                ),
              ],
            ),

            SizedBox(
              height: 40.h,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: BillAppBar.categories.length,
                separatorBuilder: (_, __) => SizedBox(width: 8.w),
                itemBuilder: (_, index) => buildCategoryButton(
                  BillAppBar.categories[index],
                  index,
                  theme,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton buildCategoryButton(
    String title,
    int index,
    ThemeData themeContext,
  ) {
    final isSelected = isSelectedIndex == index;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: isSelected
            ? themeContext.colorScheme.primary
            : themeContext.colorScheme.surfaceTint,
        minimumSize: Size(0, 30.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
        ),
        // padding: EdgeInsets.symmetric(horizontal: 16.w),
      ),

      child: Text(
        title,
        style: themeContext.textTheme.bodyMedium?.copyWith(
          color: isSelected ? Colors.white : null,
        ),
      ),
      onPressed: () {
        setState(() {
          isSelectedIndex = index;
        });
      },
    );
  }
}
