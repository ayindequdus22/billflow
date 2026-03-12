import 'package:billflow/models/bills/bills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BillItems extends StatelessWidget {
  final BillModel bill;
  final int index;

  const BillItems({required this.bill, super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 14.h),
      decoration: BoxDecoration(
        color: themeContext.colorScheme.surfaceBright,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: themeContext.colorScheme.outline),
      ),
      child: InkWell(
        onTap: () => Get.toNamed("/bill-details/$index"),

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  spacing: 8.w,
                  children: [
                    Hero(tag: "$index", child: 
                    Image.asset(bill.iconPath, width: 40.w, height: 40.h),
                    ),
                    Column(
                      spacing: 4.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bill.title,
                          style: themeContext.textTheme.bodyLarge,
                        ),

                        Row(
                          spacing: 8.w,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 3.h,
                              ),
                              decoration: BoxDecoration(
                                color: bill.category.color[1],
                                borderRadius: BorderRadius.circular(40.r),
                              ),
                              child: Text(
                                bill.category.displayName,
                                style: themeContext.textTheme.bodyMedium
                                    ?.copyWith(color: bill.category.color[0]),
                              ),
                            ),

                            bill.isOverdue
                                ? Text(
                                    "Overdue",
                                    style: themeContext.textTheme.bodySmall
                                        ?.copyWith(
                                          color: bill.getDueDateColor(context),
                                        ),
                                  )
                                : Text(
                                    bill.dueDateString,
                                    style: themeContext.textTheme.bodyMedium
                                        ?.copyWith(
                                          color: bill.getDueDateColor(context),
                                        ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      bill.formattedAmount,
                      style: themeContext.textTheme.bodyLarge,
                    ),
                    Text(
                      bill.frequency.displayName,
                      style: themeContext.textTheme.bodyMedium?.copyWith(
                        color: themeContext.colorScheme.surfaceContainer,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            if (bill.isOverdue)
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 12.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: themeContext.colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(
                    color: themeContext.colorScheme.onErrorContainer,
                  ),
                ),
                child: Text(
                  "Payment overdue - please settle immediately",
                  style: themeContext.textTheme.bodySmall?.copyWith(
                    color: themeContext.colorScheme.error,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
