import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_tracker/app/injector.dart';
import 'package:meal_tracker/features/home/logic/home/home_cubit.dart';

import 'custom_category_item_widget.dart';

class SortOptionsWidget extends StatefulWidget {
  const SortOptionsWidget({
    super.key,
  });

  @override
  State<SortOptionsWidget> createState() => _SortOptionsWidgetState();
}

class _SortOptionsWidgetState extends State<SortOptionsWidget> {
  List<String> sortBy = [
    'Default',
    'Name',
    'Time',
    'Calories',
  ];

  List<String> sortOrders = [
    'Ascending',
    'Descending',
  ];

  int currentSelectedCategoryItem = 0;
  int currentSelectedSortOrder = 0;

  void updateSelectedItem(int index) {
    if (index == currentSelectedCategoryItem) {
      currentSelectedSortOrder = -1;
      setState(() {});
      if (currentSelectedSortOrder == -1) {
        log('Category reselected without subcategory - keeping data unchanged.');
        currentSelectedCategoryItem = -1;
        setState(() {});
      } else {
        currentSelectedSortOrder = -1;
        setState(() {});
      }
    } else {
      currentSelectedCategoryItem = index;
      currentSelectedSortOrder = 0;
      _applySort();
      setState(() {});
    }
  }

  void updateSortOrder(int index) {
    currentSelectedSortOrder = index;

    _applySort();
    setState(() {});
  }

  void _applySort() {
    final sortField = sortBy[currentSelectedCategoryItem].toLowerCase();
    final sortOrder = sortOrders[currentSelectedSortOrder].toLowerCase();
    serviceLocator<HomeCubit>().sortMeals(sortField, order: sortOrder);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.meals.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsetsDirectional.only(top: 12.h, bottom: 24.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  sortBy.length,
                  (index) {
                    return CustomCategoryItemWidget(
                      title: sortBy[index],
                      bgColor: index == currentSelectedCategoryItem
                          ? Colors.orange
                          : Colors.blueGrey.shade50,
                      textColor: index == currentSelectedCategoryItem
                          ? Colors.white
                          : Colors.black,
                      onTap: () {
                        log('Sort By Index: ');
                        updateSelectedItem(index);
                      },
                    );
                  },
                ),
              ),
            ),
            if (currentSelectedCategoryItem != -1)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsetsDirectional.only(bottom: 12.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    sortOrders.length,
                    (index) {
                      return CustomCategoryItemWidget(
                        title: sortOrders[index],
                        bgColor: index == currentSelectedSortOrder
                            ? Colors.orange
                            : Colors.blueGrey.shade50,
                        textColor: index == currentSelectedSortOrder
                            ? Colors.white
                            : Colors.black,
                        onTap: () {
                          log('Sort Order Index: ');
                          updateSortOrder(index);
                        },
                      );
                    },
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
