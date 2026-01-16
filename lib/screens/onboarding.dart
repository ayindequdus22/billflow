import 'package:billflow/theme/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PageBuilderProvide {
  final String icon;
  final String header;
  final String description;
  final Color iconColor;
  final Color containerColor;

  const PageBuilderProvide({
    required this.icon,
    required this.header,
    required this.description,
    required this.iconColor,
    required this.containerColor,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  AppColorScheme appColorScheme = AppColorScheme();
  late PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);

    List<PageBuilderProvide> pageBuilderProviders = [
      PageBuilderProvide(
        icon: "assets/icons/grid.svg",
        iconColor: themeContext.colorScheme.primary,
        header: "All Your Bills in One Place",
        description:
            "Stay organized with a clean dashboard for all upcoming and past bills.",
        containerColor: themeContext.colorScheme.primaryFixed,
      ),
      PageBuilderProvide(
        icon: "assets/icons/notification.svg",
        iconColor: appColorScheme.supportMain,
        header: "Smart & Predictive Reminders",
        description:
            "Never miss a payment. Get intelligent reminders before bills are due, tailored to your payment patterns.",
        containerColor: appColorScheme.supportLight,
      ),
      PageBuilderProvide(
        icon: "assets/icons/waterfall.svg",
        iconColor: appColorScheme.securityMain,
        header: "Bills, History & Insights",
        description:
            "See your monthly totals, track paid bills, and gain insights into your spending patterns over time.",
        containerColor: appColorScheme.securityLight,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => Get.toNamed("/login"),
            child: Text("Skip"),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            SizedBox(
              height: 300.h,
              child: PageView.builder(
                controller: _pageController,
                itemCount: pageBuilderProviders.length,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: pageBuilderProviders[index].containerColor,
                        ),
                        child: SvgPicture.asset(
                          pageBuilderProviders[index].icon,
                          width: 40.w,
                          height: 40.h,
                          colorFilter: ColorFilter.mode(
                            pageBuilderProviders[index].iconColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      24.verticalSpace,
                      Text(
                        pageBuilderProviders[index].header,
                        style: themeContext.textTheme.headlineLarge,
                        textAlign: TextAlign.center,
                      ),
                      // SizedBox(height: 12.h),
                      10.verticalSpace,
                      Text(
                        pageBuilderProviders[index].description,
                        textAlign: TextAlign.center,
                        style: themeContext.textTheme.bodyMedium?.copyWith(
                          color: themeContext.colorScheme.surfaceBright,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Indicator
            AnimatedBuilder(
              animation: _pageController,
              builder: (context, child) {
                final page = _pageController.page ?? _currentPage.toDouble();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(pageBuilderProviders.length, (index) {
                    final selected = (index - page).abs() < 0.5;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      width: selected ? 20 : 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: selected
                            ? themeContext.colorScheme.primary
                            : const Color(0xFFE2E8F0),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }),
                );
              },
            ),
            Spacer(),
            // Button
            Padding(
              padding: EdgeInsets.only(bottom: 40.h),
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage < pageBuilderProviders.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    // Navigate
                    Get.toNamed("/login");
                  }
                },
                child: Text(
                  _currentPage == pageBuilderProviders.length - 1
                      ? "Get Started"
                      : "Next",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
