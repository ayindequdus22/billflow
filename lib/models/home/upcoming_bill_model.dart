import 'package:billflow/theme/color_scheme.dart';
import 'package:flutter/material.dart';

final AppColorScheme colorScheme = AppColorScheme();

enum BillCategory {
  utility,
  subscription,
  housing,
  insurance,
  savings;
  // other;

  List<Color> get color {
    switch (this) {
      case BillCategory.utility:
        return [colorScheme.utility, colorScheme.utilityLight];
      case BillCategory.subscription:
        return [colorScheme.subscription, colorScheme.subscriptionLight];
      case BillCategory.savings:
        return [colorScheme.savings, colorScheme.savingsLight];
      case BillCategory.housing:
        return [colorScheme.housing, colorScheme.housingLight];
      case BillCategory.insurance:
        return [colorScheme.insurance, colorScheme.insuranceLight];
    }
  }

  String get displayName {
    switch (this) {
      case BillCategory.utility:
        return 'Utility';
      case BillCategory.subscription:
        return 'Subscription';
      case BillCategory.insurance:
        return 'Insurance';
      case BillCategory.savings:
        return 'Savings';
      case BillCategory.housing:
        return 'Housing';
    }
  }
}

enum BillStatus {
  upcoming,
  overdue,
  paid;

  String get displayName {
    switch (this) {
      case BillStatus.upcoming:
        return 'Upcoming';
      case BillStatus.overdue:
        return 'Overdue';
      case BillStatus.paid:
        return 'Paid';
    }
  }
}

enum BillFrequency {
  daily,
  weekly,
  monthly,
  quarterly,
  yearly;

  String get displayName {
    switch (this) {
      case BillFrequency.daily:
        return 'Daily';
      case BillFrequency.weekly:
        return 'Weekly';
      case BillFrequency.monthly:
        return 'Monthly';
      case BillFrequency.quarterly:
        return 'Quarterly';
      case BillFrequency.yearly:
        return 'Yearly';
    }
  }
}

class BillModel {
  final String title;
  final double amount;
  final DateTime dueDate;
  final BillCategory category;
  final BillFrequency frequency;

  BillModel({
    required this.title,
    required this.amount,
    required this.dueDate,
    required this.category,
    required this.frequency,
  });
  // Calculate days until due
  int get daysUntilDue {
    final now = DateTime.now();
    final difference = dueDate.difference(now);
    return difference.inDays;
  }

  // Check if bill is overdue
  bool get isOverdue => daysUntilDue < 0;

  // Get formatted due date string
  String get dueDateString {
    if (isOverdue) {
      return 'Overdue by ${daysUntilDue.abs()} day${daysUntilDue.abs() != 1 ? 's' : ''}';
    } else if (daysUntilDue == 0) {
      return 'Due today';
    } else {
      return 'Due in $daysUntilDue day${daysUntilDue != 1 ? 's' : ''}';
    }
  }

  // Get color based on due date
  Color getDueDateColor(BuildContext context) {
    if (isOverdue) {
      return Theme.of(context).colorScheme.error;
    } else if (daysUntilDue <= 3) {
      return colorScheme.warning;
    } else {
      return Colors.grey;
    }
  }

  // Format amount with currency
  String get formattedAmount {
    return '₦${amount.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
  }
}
