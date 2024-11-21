import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals ,required this.onManageFavorites});

  final String? title;
  final List<Meal> meals;
  final void Function (Meal meal)onManageFavorites;
void _selectedMealDetails(BuildContext context, Meal meal){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>MealsDetailsScreen(meal: meal,onManageFavorites: onManageFavorites ,)));
}
  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => MealItem(meal: meals[index],onSelectedMealDetail: _selectedMealDetails),);
      if(meals.isEmpty){
        content = Center(
          child: Column(mainAxisSize: MainAxisSize.min,children: [
            Text('No thing here'),
            SizedBox(height: 16,),
            Text('Try selecting  another category')
          ],),
        );
      }
      if(title== null ){
        return content;
      }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body:content,
    );
  }
}


