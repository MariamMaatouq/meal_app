import 'package:flutter/material.dart';
import '../model/meal.dart';
class MealsDetailsScreen extends StatelessWidget {
  const MealsDetailsScreen({super.key,required this.meal,required this.onManageFavorites});
  final Meal meal;
  final void Function (Meal meal)onManageFavorites;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title) ,
      actions: [
        IconButton(onPressed: (){
          onManageFavorites(meal);
        }, icon: Icon(Icons.star))
      ],),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Image(width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                image: NetworkImage(meal.imageUrl),),
            SizedBox(height: 6,),
            Text('Ingredients ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 6,),
            for (final ingredient in meal.ingredients)
               Text(ingredient),
            Text( textAlign: TextAlign.center,'Steps ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 6,),
            for (final steps in meal.steps)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(steps,textAlign: TextAlign.center,),
              ),
          ],
        ),
      ),
        );
  }
}
