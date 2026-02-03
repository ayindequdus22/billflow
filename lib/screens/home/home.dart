import 'package:billflow/theme/color_scheme.dart';
import 'package:billflow/widgets/home/home_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

final AppColorScheme appColorScheme = AppColorScheme();

class HomeCategoryBill {
  final String title;
  final String svgIcon;
  final String number;
  final Color textColor;
  final Color borderColor;
  final Color containerColor;
  HomeCategoryBill({
    required this.title,
    required this.svgIcon,
    required this.number,
    required this.textColor,
    required this.borderColor,
    required this.containerColor,
  });
}

List<HomeCategoryBill> homeCategoryBill = [
  HomeCategoryBill(
    title: "Paid This Month",
    svgIcon: "assets/icons/check.svg",
    number: "108,000",
    textColor: Colors.white,
    borderColor: appColorScheme.successBorder,
    containerColor: Colors.red,
  ),
  HomeCategoryBill(
    title: "Overdue",
    svgIcon: "assets/icons/alert.svg",
    number: "34,000",
    textColor: Colors.white,
    borderColor: appColorScheme.successBorder,
    containerColor: Colors.red,
  ),
  HomeCategoryBill(
    title: "Due Next Month",
    svgIcon: "assets/icons/date-time.svg",
    number: "483,000",
    textColor: Colors.white,
    borderColor: appColorScheme.successBorder,
    containerColor: Colors.red,
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: HomeSliverAppBarDelegate(),
            pinned: true,
          ),

          // SliverToBoxAdapter(
          //   child: Column(
          //     children: [
          //       20.verticalSpace,
          //       SizedBox(
          //         height: 200.h,
          //         child: ListView.builder(
          //           scrollDirection: Axis.horizontal,
          //           itemCount: homeCategoryBill.length,
          //           shrinkWrap: true,
          //           itemBuilder: (_, index) => Container(
          //             padding: EdgeInsets.all(8.h),
          //             // height: 200.h,
          //             decoration: BoxDecoration(
          //               color: themeContext.colorScheme.surface,
          //               borderRadius: BorderRadius.circular(8.r),
          //               border: Border.all(
          //                 color: themeContext.colorScheme.outline,
          //               ),
          //             ),
          //             child: Column(
          //               spacing: 10.h,
          //               children: [
          //                 Container(
          //                   padding: EdgeInsets.all(20.w),
          //                   decoration: BoxDecoration(
          //                     shape: BoxShape.circle,
          //                     // color: AppColorScheme().successLight,
          //                     // borderRadius: BorderRadius.circular(8.r),
          //                   ),
          //                   child: SvgPicture.asset(
          //                     homeCategoryBill[index].svgIcon,
          //                     colorFilter: ColorFilter.mode(
          //                       homeCategoryBill[index].textColor,
          //                       BlendMode.srcIn,
          //                     ),
          //                   ),
          //                 ),
          //                 Text(
          //                   homeCategoryBill[index].title,
          //                   style: themeContext.textTheme.bodyMedium?.copyWith(
          //                     color: themeContext.colorScheme.onSurfaceVariant,
          //                   ),
          //                 ),
          //                 Text(
          //                   homeCategoryBill[index].number,
          //                   style: themeContext.textTheme.headlineSmall,
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
