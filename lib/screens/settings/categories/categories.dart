import 'package:billflow/models/bills/settings/category_items.dart';
import 'package:billflow/widgets/settings/section_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryItems = CategoryItems.categoryItems;
    final themeContext = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          SettingsSectionAppBar(title: "Categories"),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20.h,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  padding: EdgeInsets.all(16.h),
                  decoration: BoxDecoration(
                    color: themeContext.colorScheme.surfaceBright,
                    border: Border.all(
                      color: themeContext.colorScheme.outline,
                      width: 1.h,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    spacing: 12.w,

                    children: [
                      Container(
                        padding: EdgeInsets.all(10.h),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(223, 240, 242, 1),
                          border: Border.all(
                            color: Color.fromRGBO(181, 215, 219, 1),
                            width: 1.h,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: SvgPicture.asset(
                          width: 20.h,
                          height: 20.h,
                          "assets/icons/notification.svg",
                          colorFilter: ColorFilter.mode(
                            Color.fromRGBO(47, 127, 138, 1),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8.h,
                          children: [
                            Text(
                              "Organize Your Bills",
                              style: themeContext.textTheme.bodyMedium,
                            ),
                            Text(
                              "Customize categories to better organize your bills. Default categories cannot be deleted.",
                              style: themeContext.textTheme.bodySmall!.copyWith(
                                color:
                                    themeContext.colorScheme.surfaceContainer,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(top: 10.h),
                    padding: EdgeInsets.all(16.h),
                    decoration: BoxDecoration(
                      color: themeContext.colorScheme.surfaceBright,
                      border: Border.all(
                        color: themeContext.colorScheme.outline,
                        width: 1.h,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Row(
                          spacing: 16.w,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: categoryItems[index].color,
                              ),
                              child: Image.asset(categoryItems[index].iconPath),
                            ),
                            Text(
                              categoryItems[index].name,
                              style: themeContext.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  itemCount: categoryItems.length,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Add  Custom Category"),
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
