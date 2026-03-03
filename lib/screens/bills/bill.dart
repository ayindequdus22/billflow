import 'package:billflow/models/bills/bills.dart';
import 'package:billflow/screens/bills/bill_item.dart';
import 'package:billflow/widgets/select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillScreen extends StatelessWidget {
  const BillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BillAppBar(),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.h, right: 10.r, left: 10.r),
              itemCount: bills.length,
              itemBuilder: (context, index) => BillItems(bill: bills[index]),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 70.h,
        width: 70.w,
        child: FloatingActionButton(
          tooltip: "Add Bill",
          shape: const CircleBorder(),
          heroTag: "Add Bill",
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Icon(Icons.add, color: Colors.white, size: 40.h),
          onPressed: () {},
        ),
        // ),
      ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bills", style: theme.textTheme.headlineLarge),
            16.verticalSpace,
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
            16.verticalSpace,

            SizedBox(
              height: 40.h,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: BillAppBar.categories.length,
                separatorBuilder: (_, _) => SizedBox(width: 8.w),
                itemBuilder: (_, index) => buildCategoryButton(
                  BillAppBar.categories[index],
                  index,
                  theme,
                ),
              ),
            ),
            10.verticalSpace,
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
