
  import 'package:billflow/models/bills/settings/category_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

ListView listCategoryItems(ThemeData themeContext, List<CategoryItems> categoryItems) {
    return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.zero,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 16.w,
                          children: [
                            Container(
                              height: 36.h,
                              width: 36.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: categoryItems[index].color,
                              ),
                              child: Image.asset(
                                categoryItems[index].iconPath,
                                fit: BoxFit.contain,
                                height: 24.h,
                                width: 16.w,
                              ),
                            ),
                            Text(
                              categoryItems[index].name,
                              style: themeContext.textTheme.bodyMedium,
                            ),
                          ],
                        ),

                        InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/icons/edit.svg",
                            colorFilter: ColorFilter.mode(
                              themeContext.colorScheme.onSurfaceVariant,
                              BlendMode.srcIn,
                            ),
                            height: 24.h,
                            width: 24.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  itemCount: categoryItems.length,
                );
  }
