import 'package:billflow/models/bills/bills.dart';
import 'package:billflow/theme/color_scheme.dart';
import 'package:billflow/widgets/bill_details/appbar.dart';
import 'package:billflow/widgets/bill_details/info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BillDetails extends StatelessWidget {
  const BillDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final id = int.parse(Get.parameters["id"].toString());
    var bill = bills[id];
    return Scaffold(
      body: Column(
        children: [
          BillDetailAppBar(theme: theme, id: id, bill: bill),
          //
          20.verticalSpace,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.r),
            padding: EdgeInsets.all(16.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceBright,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: theme.colorScheme.outline, width: 1.r),
            ),
            child: Column(
              spacing: 16.h,
              children: [
                InfoItem(
                  iconPath: "assets/icons/calendar.svg",
                  backgroundColor: const Color.fromRGBO(224, 242, 241, 1),
                  iconColor: const Color.fromRGBO(0, 137, 123, 1),
                  label: "Due Date",
                  value: DateFormat.yMMMMd(
                    "en_US",
                  ).format(DateTime.parse(bill.dueDate)),
                ),

                InfoItem(
                  iconPath: "assets/icons/arrow-reload.svg",
                  backgroundColor: const Color.fromRGBO(243, 229, 245, 1),
                  iconColor: const Color.fromRGBO(142, 36, 170, 1),
                  label: "Frequency",
                  value: bill.frequency.name.toLowerCase().capitalizeFirst!,
                ),

                InfoItem(
                  iconPath: "assets/icons/calendar.svg",
                  backgroundColor: const Color.fromRGBO(224, 242, 241, 1),
                  iconColor: const Color.fromRGBO(0, 137, 123, 1),
                  label: "Status",
                  value: bill.status.displayName,
                  valueStyle: theme.textTheme.bodyMedium?.copyWith(
                    color: bill.getDueDateColor(context),
                  ),
                ),
              ],
            ),
          ),
          20.verticalSpace,
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10.r),
            padding: EdgeInsets.all(16.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceBright,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: theme.colorScheme.outline, width: 1.r),
            ),
            child: Column(
              spacing: 10.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Notes",
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  "Payment due .. on the of ..",
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // bottom
          20.verticalSpace,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.r),
            child: Column(
              spacing: 20.h,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColorScheme().success,
                  ),
                  child: Text(
                    "Mark as Paid",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  spacing: 16.w,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.surfaceBright,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            side: BorderSide(
                              color: theme.colorScheme.outline,
                              width: 1.h,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Edit Bill",
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,

                          backgroundColor: theme.colorScheme.surfaceBright,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            side: BorderSide(
                              color: theme.colorScheme.onErrorContainer,
                              width: 1.h,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Delete Bill",
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: theme.colorScheme.error,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
