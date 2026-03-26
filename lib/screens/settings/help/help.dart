import 'package:billflow/widgets/settings/section_app_bar.dart';
import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(),
        child: Column(
          children: [SettingsSectionAppBar(title: "Help & Support")],
        ),
      ),
    );
  }
}
