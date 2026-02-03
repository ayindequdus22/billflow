import 'package:billflow/widgets/select.dart';
import 'package:billflow/widgets/datepicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddBill extends StatefulWidget {
  const AddBill({super.key});

  @override
  State<AddBill> createState() => _AddBillState();
}

class _AddBillState extends State<AddBill> {
  final List<String> frequency = ['Daily', 'Monthly', 'Yearly'];
  final List<String> categories = [
    "Housing",
    "Utility",
    "Savings",
    "Subscription",
    "Insurance",
    "Loan",
    "Other",
  ];

  String? selectedCategories = "Subscription";

  String selected = "Weekly";
  final options = ["Weekly", "Monthly", "Quarterly", "Yearly"];

  bool isLoading = false;

  Future<void> addBill() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Simulate a network call
      await Future.delayed(const Duration(seconds: 2));
      Get.offAllNamed("/home");
      // verification logic here
    } catch (e) {
      // handle error if needed
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeContext.colorScheme.surfaceBright,
        shape: Border(
          bottom: BorderSide(color: themeContext.colorScheme.outline),
        ),
        title: Text("Add Bill"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 15.r),
          child: Column(
            spacing: 16.h,
            children: [
              buildInputColumn(
                title: "Bill Name",
                hintText: "e.g., rent, internet...",
                themeContext: themeContext,
              ),
              buildInputColumn(
                title: "Bill Amount",
                hintText: "₦0.00",
                themeContext: themeContext,
              ),

              DatePicker(),
              Select(
                title: "Frequency",
                hintText: "Choose frequency",
                items: frequency,
              ),

              Select(
                title: "Category",
                hintText: "Choose category",
                items: categories,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4.h,
                children: [
                  Text(
                    "Notes (Optional)",
                    style: themeContext.textTheme.bodyMedium,
                  ),
                  TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Add any additional details...",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 30.r),
        child: ElevatedButton(
          onPressed: () => addBill(),
          child: isLoading
              ? SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Text("Save bill"),
        ),
      ),
    );
  }

  Column buildInputColumn({
    required String title,
    required String hintText,
    required ThemeData themeContext,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4.h,
      children: [
        Text(title, style: themeContext.textTheme.bodyMedium),
        TextFormField(decoration: InputDecoration(hintText: hintText)),
      ],
    );
  }
}
