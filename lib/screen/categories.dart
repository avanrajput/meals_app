import 'package:flutter/material.dart';
import 'package:meals_app/models/food_category.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screen/meals.dart';
import '../data/sample_data.dart';
import '../widget/categories_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  void _selectCategory(BuildContext ctx, FoodCategory category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
        ctx,
        MaterialPageRoute(
            builder: (ctx) => MealsScreen(
                  meals: filteredMeals,
                  title: category.title,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () => _selectCategory(context, category),
            )
        ],
      ),
    );
  }
}
