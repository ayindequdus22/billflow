import 'package:billflow/theme/color_scheme.dart';
import 'package:billflow/widgets/datepicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AddBill extends StatefulWidget {
  const AddBill({super.key});

  @override
  State<AddBill> createState() => _AddBillState();
}

class _AddBillState extends State<AddBill> {
  String selected = "Weekly";
  final options = ["Weekly", "Monthly", "Quarterly", "Yearly"];

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4.h,
                children: [
                  DropdownButtonFormField<String>(
                    // hint: Text("Choose frequeny"),
                    decoration: InputDecoration(
                      // labelText: "Select item",
                      hintText: "Choose frequency",
                      hintStyle: themeContext.textTheme.bodyMedium!.copyWith(
                        color: AppColorScheme().disableTextColor,
                      ),
                      suffixIcon: SvgPicture.asset(
                        "assets/icons/chevron-down.svg",
                        colorFilter: ColorFilter.mode(
                          themeContext.colorScheme.primaryContainer,
                          BlendMode.srcIn,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    items: ['Daily', 'Monthly', 'Yearly'].map((item) {
                      return DropdownMenuItem(value: item, child: Text(item));
                    }).toList(),
                    onChanged: (value) {
                      print("Selected: $value");
                    },
                    validator: (value) =>
                        value == null ? "Please select a frequency" : null,
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4.h,
                children: [Text("Category")],
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
