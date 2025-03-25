import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_tracker/core/utils/media_query_values.dart';
import 'package:meal_tracker/features/home/logic/home/home_cubit.dart';
import 'package:meal_tracker/features/home/presentation/widget/meal_title_widget.dart';
import 'package:meal_tracker/features/home/presentation/widget/sort_options_widget.dart';
import 'package:meal_tracker/features/home/presentation/widget/welcome_back_title_widget.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../widget/all_meal_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _getData() async {
    await context.read<HomeCubit>().getAllMeals();
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.navigateTo(Routes.addNewMealRoute);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeBackTitleWidget(),
              MealTitleWidget(),
              SortOptionsWidget(),
              AllMealItemWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
