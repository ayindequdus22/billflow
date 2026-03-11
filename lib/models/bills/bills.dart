import 'package:billflow/theme/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  //iso String
  final String dueDate;
  final BillCategory category;
  final BillFrequency frequency;
  final String iconPath;
  final BillStatus status;
  static const int warningDays = 5;

  BillModel({
    String? id,
    required this.iconPath,
    required this.title,
    required this.status,
    required this.amount,
    required this.dueDate,
    required this.category,
    required this.frequency,
  }) : id = id ?? UniqueKey().toString();
  // Calculate days until due
  int get daysUntilDue {
    final parsedDueDate = DateTime.parse(dueDate).toLocal();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final due = DateTime(
      parsedDueDate.year,
      parsedDueDate.month,
      parsedDueDate.day,
    );
    return due.difference(today).inDays;
  }

  // Check if bill is overdue
  bool get isOverdue => daysUntilDue < 0;

  // Get formatted due date string
  String get dueDateString {
    if (isOverdue) {
      return 'Overdue by ${daysUntilDue.abs()} day${daysUntilDue.abs() != 1 ? 's' : ''}';
    }
    if (daysUntilDue == 0) return 'Due today';
    if (daysUntilDue == 1) return 'Due tomorrow';
    if (daysUntilDue <= 7) {
      return 'Due in $daysUntilDue day${daysUntilDue != 1 ? 's' : ''}';
    }
    return DateFormat.MMMd().format(DateTime.parse(dueDate));
  }

  // Get color based on due date
  Color getDueDateColor(BuildContext context) {
    if (isOverdue) {
      return Theme.of(context).colorScheme.error;
    } else if (daysUntilDue <= warningDays) {
      return colorScheme.warning;
    } else {
      return Colors.grey;
    }
  }

  // Format amount with currency

  String get formattedAmount {
    final formatter = NumberFormat.currency(
      locale: 'en_NG',
      symbol: '₦',
      decimalDigits: 0,
    );
    return formatter.format(amount);
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
      'dueDate': dueDate.toString(),
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
    String? dueDate,
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
      dueDate: json['dueDate'],
      status: BillStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => BillStatus.upcoming,
      ),
    );
  }
}

List<BillModel> bills = [
  BillModel(
    iconPath: "assets/images/electricity.png",
    title: "Electricity",
    category: BillCategory.utility,
    amount: 15000,
    frequency: BillFrequency.monthly,
    dueDate: "2026-03-14T03:40:00.123Z",
    status: BillStatus.overdue,
  ),
  BillModel(
    iconPath: "assets/images/internet.png",
    title: "Internet",
    category: BillCategory.utility,
    amount: 15000,
    frequency: BillFrequency.monthly,
    dueDate: "2026-03-04T03:40:00.123Z",
    status: BillStatus.upcoming,
  ),
  BillModel(
    iconPath: "assets/images/netflix.png",
    title: "Netflix",
    category: BillCategory.subscription,
    amount: 5000,
    frequency: BillFrequency.monthly,
    dueDate: "2026-03-09T03:40:00.123Z",
    status: BillStatus.upcoming,
  ),

  BillModel(
    iconPath: "assets/images/car.png",
    title: "Car Insurance",
    category: BillCategory.insurance,
    amount: 40000,
    frequency: BillFrequency.quarterly,
    dueDate: "2026-03-22T03:40:00.123Z",
    status: BillStatus.upcoming,
  ),

  BillModel(
    iconPath: "assets/images/music.png",
    title: "Spotify",
    category: BillCategory.subscription,
    amount: 1600,
    frequency: BillFrequency.monthly,
    dueDate: "2026-03-02T03:40:00.123Z",
    status: BillStatus.upcoming,
  ),

  BillModel(
    iconPath: "assets/images/house.png",
    title: "Housing",
    category: BillCategory.housing,
    amount: 85000,
    frequency: BillFrequency.yearly,
    dueDate: "2026-06-20T03:40:00.123Z",
    status: BillStatus.upcoming,
  ),
  BillModel(
    iconPath: "assets/images/music.png",
    title: "Apple",
    category: BillCategory.subscription,
    amount: 1200,
    frequency: BillFrequency.monthly,
    dueDate: "2026-03-26T03:40:00.123Z",
    status: BillStatus.upcoming,
  ),
  BillModel(
    iconPath: "assets/images/piggyvest.png",
    title: "PiggyVest",
    category: BillCategory.savings,
    amount: 15000,
    frequency: BillFrequency.weekly,
    dueDate: "2026-03-05T03:40:00.123Z",
    status: BillStatus.upcoming,
  ),

  BillModel(
    iconPath: "assets/images/electricity.png",
    title: "Zonal",
    category: BillCategory.utility,
    amount: 15000,
    frequency: BillFrequency.monthly,
    dueDate: "2026-02-20T03:40:00.123Z",
    status: BillStatus.upcoming,
  ),
  BillModel(
    iconPath: "assets/images/electricity.png",
    title: "Zonal",
    category: BillCategory.utility,
    amount: 15000,
    frequency: BillFrequency.monthly,
    dueDate: "2026-02-20T03:40:00.123Z",
    status: BillStatus.upcoming,
  ),
];
