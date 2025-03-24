import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_category_item_widget.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({
    super.key,
  });

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  List<String> sortBy = [
    'Default',
    'Name',
    'Date',
    'Calories',
  ];

  int currentSelectedCategoryItem = 0;

  void updateSelectedItem(int index) {
    currentSelectedCategoryItem = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsetsDirectional.only(top: 12.h, bottom: 24.h),
      child: Row(
        children: List.generate(
          sortBy.length,
          (index) {
            return CustomCategoryItemWidget(
              title: sortBy[index],
              bgColor: index == currentSelectedCategoryItem
                  ? Colors.orange
                  : Colors.white,
              textColor: index == currentSelectedCategoryItem
                  ? Colors.white
                  : Colors.black,
              onTap: () {
                log('Sort By Index: $currentSelectedCategoryItem');
                updateSelectedItem(index);
              },
            );
          },
        ),
      ),
    );
  }
}
