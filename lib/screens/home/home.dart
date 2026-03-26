import 'package:billflow/screens/bills/bill.dart';
import 'package:billflow/screens/history/history.dart';
import 'package:billflow/screens/insight/insight.dart';
import 'package:billflow/screens/settings/Settings.dart';
import 'package:billflow/widgets/home/home_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _screens = <Widget>[
    HomeSliver(),
    BillScreen(),
    Insight(),
    History(),
    Settings(),
  ];
  int _selectedIndex = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: Container(
        height: 80.h,
        color: Theme.of(context).colorScheme.surfaceBright,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildBottomIcon("Home", "assets/icons/home.svg", index: 0),
            buildBottomIcon("Bills", "assets/icons/bill.svg", index: 1),
            buildBottomIcon("Insights", "assets/icons/insight.svg", index: 2),

            buildBottomIcon("History", "assets/icons/history.svg", index: 3),
            buildBottomIcon("Settings", "assets/icons/setting.svg", index: 4),
          ],
        ),
      ),
    );
  }

  InkWell buildBottomIcon(String title, String iconPath, {required int index}) {
    final themeContext = Theme.of(context);
    final isSelected = index == _selectedIndex;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8.r,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 24.h,
            width: 24.h,
            colorFilter: ColorFilter.mode(
              isSelected
                  ? themeContext.colorScheme.primary
                  : themeContext.colorScheme.surfaceContainer,
              BlendMode.srcIn,
            ),
          ),
          Text(
            title,
            style: themeContext.textTheme.bodyMedium!.copyWith(
              color: isSelected
                  ? themeContext.colorScheme.primary
                  : themeContext.colorScheme.surfaceContainer,
            ),
          ),
        ],
      ),
    );
  }
}
