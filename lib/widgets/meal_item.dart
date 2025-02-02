import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import '../model/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal,required this.onSelectedMealDetail});

  final Meal meal;
  final void Function(BuildContext context ,Meal meal) onSelectedMealDetail;
String get complexityText{
  return meal.complexity.name[0].toUpperCase()+ meal.complexity.name.substring(1);
}
  String get affordabilityText{
    return meal.affordability.name[0].toUpperCase()+ meal.affordability.name.substring(1);
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap:(){
          onSelectedMealDetail(context,meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Row(
                        children: [
                            MealItemTrait(label: '${meal.duration} min', icon: Icons.schedule),
                          SizedBox(width: 12,),
                          MealItemTrait(label: '${complexityText}', icon: Icons.work),
                          SizedBox(width: 12,),
                          MealItemTrait(label: '${affordabilityText}', icon: Icons.attach_money),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
