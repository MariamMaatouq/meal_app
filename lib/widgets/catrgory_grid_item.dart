import '../model/category.dart';
import 'package:flutter/material.dart';

class CatrgoryGridItem extends StatelessWidget {
  const CatrgoryGridItem({super.key, required this.category,required this.onSelectCategory});

  final Category category;
  final void Function() onSelectCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // splashColor: ,
      borderRadius: BorderRadius.circular(20),
      onTap: onSelectCategory,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.55),
            category.color.withOpacity(0.9)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Text(
          category.title,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
