import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Select extends StatefulWidget {
  final String title;
  final String hintText;
  final List<String> items;

  const Select({
    super.key,
    required this.title,
    required this.hintText,
    required this.items,
  });

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  String? selectedItems = "Subscription";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4.h,
      children: [
        Text(widget.title, style: Theme.of(context).textTheme.bodyMedium),
        DropdownButtonFormField<String>(
          icon: SvgPicture.asset(
            "assets/icons/chevron-down.svg",
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primaryContainer,
              BlendMode.srcIn,
            ),
          ),
          items: widget.items
              .map(
                (item) =>
                    DropdownMenuItem<String>(value: item, child: Text(item)),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedItems = value;
            });
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
          validator: (value) =>
              value == null ? "Please select a frequency" : null,
        ),
      ],
    );
  }
}
