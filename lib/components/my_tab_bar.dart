import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  List<Tab> _buildCategorytabs() {
    return FoodCategory.values.map((category) {
      String categoryName = category.toString().split('.').last;
      categoryName = categoryName.substring(0, 1).toUpperCase() +
          categoryName.substring(1);
      return Tab(
        text: categoryName,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.grey,
      controller: tabController,
      tabs: _buildCategorytabs(),
    );
  }
}
