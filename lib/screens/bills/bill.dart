import 'package:billflow/models/bills/bills.dart';
import 'package:billflow/screens/bills/bill_item.dart';
import 'package:billflow/widgets/bill_screen/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({super.key});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  List<BillModel> filterBills = bills;
  static List<String> categories = [
    "All Categories",
    ...BillCategory.values.map(
      (e) => e.displayName[0].toUpperCase() + e.displayName.substring(1),
    ),
  ];
  int selectedCategoryIndex = 0;
  List<String> billStatus = [
    "All Bills",
    ...BillStatus.values.map((e) => e.displayName),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BillAppBar(
            categories: categories,
            // billStatus: billStatus,
            selectedIndex: selectedCategoryIndex,
            onCategorySelected: (index) {
              setState(() {
                selectedCategoryIndex = index;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.h, right: 10.r, left: 10.r),
              itemCount: filterBills.length,
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
