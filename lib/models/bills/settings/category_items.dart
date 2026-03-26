import 'package:billflow/theme/color_scheme.dart';
import 'package:flutter/material.dart';

class CategoryItems {
  const CategoryItems({
    required this.name,
    required this.iconPath,
    required this.color,
  });
  final String name;
  final String iconPath;
  final Color color;
  static AppColorScheme appColors = AppColorScheme();
  static final List<CategoryItems> categoryItems = [
    CategoryItems(
      name: 'Housing',
      iconPath: 'assets/images/house.png',
      color: appColors.housingLight,
    ),
    CategoryItems(
      name: 'Utility',
      iconPath: 'assets/images/electricity.png',
      color: appColors.utilityLight,
    ),
    CategoryItems(
      name: 'Subscription',
      iconPath: 'assets/images/netflix.png',
      color: appColors.subscriptionLight,
    ),
    CategoryItems(
      name: 'Insurance',
      iconPath: 'assets/images/insurance.png',
      color: appColors.insuranceLight,
    ),
    CategoryItems(
      name: 'Savings',
      iconPath: 'assets/images/piggyvest.png',
      color: appColors.savingsLight,
    ),
    CategoryItems(
      name: 'Loan',
      iconPath: 'assets/images/loan.png',
      color: appColors.loanLight,
    ),
  ];
}
