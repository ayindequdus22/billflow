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
  final String id;
  final String title;
  final double amount;
  final DateTime dueDate;
  final BillCategory category;
  final BillFrequency frequency;
  final String iconPath;
  final BillStatus status;

  BillModel({
    String? id,
    required this.iconPath,
    required this.title,
    required this.status,
    required this.amount,
    required this.dueDate,
    required this.category,
    required this.frequency,
  }): id = id ?? UniqueKey().toString();
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

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'title': title,
      'iconPath': iconPath,
      'category': category.name,
      'amount': amount,
      'frequency': frequency.name,
      'dueDate': dueDate.toIso8601String(),
      'status': status.name,
    };
  }

  // Copy with method
  BillModel copyWith({
    String? id,
    String? title,
    String? iconPath,
    // IconData? iconData,
    BillCategory? category,
    double? amount,
    BillFrequency? frequency,
    DateTime? dueDate,
    BillStatus? status,
  }) {
    return BillModel(
      // id: id ?? this.id,
      title: title ?? this.title,
      iconPath: iconPath ?? this.iconPath,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      frequency: frequency ?? this.frequency,
      dueDate: dueDate ?? this.dueDate,
      status: status ?? this.status,
    );
  }

  // Create from JSON
  factory BillModel.fromJson(Map<String, dynamic> json) {
    return BillModel(
      iconPath: json['iconPath'],
      title: json['title'],
      category: BillCategory.values.firstWhere(
        (e) => e.name == json['category'],
        orElse: () => BillCategory.utility,
      ),
      amount: (json['amount'] as num).toDouble(),
      frequency: BillFrequency.values.firstWhere(
        (e) => e.name == json['frequency'],
        orElse: () => BillFrequency.monthly,
      ),
      dueDate: DateTime.parse(json['dueDate']),
      status: BillStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => BillStatus.upcoming,
      ),
    );
  }
}
