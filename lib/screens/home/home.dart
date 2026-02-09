import 'package:billflow/widgets/home/home_category.dart';
import 'package:billflow/widgets/home/home_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: HomeSliverAppBarDelegate(),
            pinned: true,
          ),

          SliverToBoxAdapter(child: HomeCategory()),

          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 10.r),

              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onErrorContainer,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "Please review and mark as paid to stay on track",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
