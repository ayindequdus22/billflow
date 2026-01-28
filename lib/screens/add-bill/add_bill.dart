import 'package:flutter/material.dart';

class AddBill extends StatelessWidget {
  const AddBill({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: Text("Add Bill"),
        automaticallyImplyLeading: false,
      ),
      body: Center(child: Text("Add Bill")),
    );
  }
}
