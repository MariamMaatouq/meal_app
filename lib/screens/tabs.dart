import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import '../model/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  void showMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  final List<Meal> _favoritesMeals=[];
void _manageFavorites(Meal meal){
  final isExisiting = _favoritesMeals.contains(meal);
  if(isExisiting){
    setState(() {
      _favoritesMeals.remove(meal);
    });
    showMessage('Meal is no longer a favorite . ');
  }else{
    setState(() {
      _favoritesMeals.add(meal);
    });
    showMessage('Marked as fav0rite. ');
  }
}
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget activePage =  CategoriesScreen(onManageFavorites:_manageFavorites);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1){
      activePageTitle = 'Your Favorites';
      activePage = MealsScreen( meals:_favoritesMeals,onManageFavorites: _manageFavorites,);}
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
        onTap: _selectPage,
      ),
    );
  }
}
