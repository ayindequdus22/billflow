import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:billflow/theme/color_scheme.dart';

class HomeCategoryBillModel {
  final String title;
  final String svgIcon;
  final String number;
  final Color textColor;
  final Color borderColor;
  // final ColorScheme colorScheme
  final Color containerColor;
  HomeCategoryBillModel({
    required this.title,
    // required this.colorScheme,
    required this.svgIcon,
    required this.number,
    required this.textColor,
    required this.borderColor,
    required this.containerColor,
  });
}

final AppColorScheme appColorScheme = AppColorScheme();
List<HomeCategoryBillModel> homeCategoryBillModel = [
  HomeCategoryBillModel(
    title: "Paid This Month",
    svgIcon: "assets/icons/check.svg",
    number: "₦108,000",
    textColor: appColorScheme.success,
    borderColor: appColorScheme.successBorder,
    containerColor: appColorScheme.successLight,
  ),
  HomeCategoryBillModel(
    title: "Overdue",
    svgIcon: "assets/icons/alert.svg",
    number: "₦34,000",
    textColor: appColorScheme.danger,
    borderColor: appColorScheme.dangerBorder,
    containerColor: appColorScheme.dangerLight,
  ),
  HomeCategoryBillModel(
    title: "Due Next Month",
    svgIcon: "assets/icons/date-time.svg",
    number: "₦483,000",
    textColor: appColorScheme.warning,
    borderColor: appColorScheme.warningBorder,
    containerColor: appColorScheme.warningLight,
  ),
];

class HomeCategory extends StatelessWidget {
  const HomeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      child: Column(
        children: [
          20.verticalSpace,
          SizedBox(
            height: 140.h,
            child: ListView.separated(
              separatorBuilder: (context, index) => 10.horizontalSpace,
              scrollDirection: Axis.horizontal,
              itemCount: homeCategoryBillModel.length,
              shrinkWrap: true,
              itemBuilder: (_, index) => Container(
                padding: EdgeInsets.symmetric(horizontal: 10.r),
                // height: 200.h,
                width: 145.w,
                decoration: BoxDecoration(
                  color: themeContext.colorScheme.surface,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: homeCategoryBillModel[index].borderColor,
                  ),
                ),
                child: Column(
                  spacing: 10.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: homeCategoryBillModel[index].containerColor,
                        // color: AppColorScheme().successLight,
                        // borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: SvgPicture.asset(
                        homeCategoryBillModel[index].svgIcon,
                        colorFilter: ColorFilter.mode(
                          homeCategoryBillModel[index].textColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Text(
                      homeCategoryBillModel[index].title,
                      style: themeContext.textTheme.bodyMedium?.copyWith(
                        color: themeContext.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Text(
                      homeCategoryBillModel[index].number,
                      style: themeContext.textTheme.headlineSmall?.copyWith(
                        color: homeCategoryBillModel[index].textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
