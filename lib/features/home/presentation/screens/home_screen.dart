import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_tracker/features/home/presentation/widget/meal_item_widget.dart';
import 'package:meal_tracker/features/home/presentation/widget/meal_title_widget.dart';
import 'package:meal_tracker/features/home/presentation/widget/welcome_back_title_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12.h,
                  children: [
                    const WelcomeBackTitleWidget(),
                    const MealTitleWidget(),
                  ],
                ),
              ),
              SliverList.separated(
                itemCount: 12,
                itemBuilder: (context, index) {
                  return const MealItemWidget();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return 12.verticalSpace;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
