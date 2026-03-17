

import 'package:billflow/models/bills/bills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BillDetailAppBar extends StatelessWidget {
  const BillDetailAppBar({
    super.key,
    required this.theme,
    required this.id,
    required this.bill,
  });

  final ThemeData theme;
  final int id;
  final BillModel bill;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.h),
          bottomRight: Radius.circular(40.h),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8.h,
          children: [
            //icon
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => Get.back(),
              icon: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.15),
                  borderRadius: BorderRadius.circular(50.h),
                ),
                padding: EdgeInsets.all(10.h),
                child: SvgPicture.asset(
                  "assets/icons/back-arrow.svg",
                  height: 20.h,
                ),
              ),
            ),
            //name
            Row(
              spacing: 12.w,
              children: [
                Hero(
                  tag: "$id",
                  child: Image.asset(bill.iconPath, height: 50.h),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 6.h,
                  children: [
                    Text(
                      bill.title,
                      style: theme.textTheme.headlineLarge!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      bill.category.displayName,
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //price
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.h),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.15),
                borderRadius: BorderRadius.circular(24.h),
              ),
              child: Column(
                spacing: 4.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Amount",
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: Color.fromRGBO(232, 241, 255, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    bill.formattedAmount,
                    style: theme.textTheme.headlineLarge!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
