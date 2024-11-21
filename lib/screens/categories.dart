
import 'package:flutter/material.dart';
import '../screens/meals.dart';
import '../data/dummy_data.dart';
import '../widgets/catrgory_grid_item.dart';
import '../model/category.dart';
import '../model/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key , required this.onManageFavorites});
  final void Function (Meal meal)onManageFavorites;
  void _selectedCategory(BuildContext context, Category category) {
   final filteredMeals =
   dummyMeals.where((meal)=>meal.categories.contains(category.id)).toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealsScreen(title: category.title,
            meals: filteredMeals,onManageFavorites: onManageFavorites,),
      ),
    ); //Navigator.of(context).push(route)
  }

  @override
  Widget build(BuildContext context) {
    return  GridView(
        //padding: EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.5, mainAxisSpacing: 20),
        children: [
          //availableCategories.map((category) => CatrgoryGridItem(category: category)).toList(),
          for (final category in availableCategories)
            CatrgoryGridItem(category: category, onSelectCategory: () {
              _selectedCategory(context, category);
            },)
        ],
      );

  }
}
