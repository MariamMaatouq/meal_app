import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.pinkAccent,Colors.pinkAccent.withOpacity(0.8)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                ),
              ),
              child:const  Row(
                children: [
                  Icon(
                    Icons.fastfood,
                    size: 48,
                  ),
                   SizedBox(
                    width: 18,
                  ),
                  Text(
                    'Cooking Up!',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),),
          ListTile(
            leading: Icon(Icons.restaurant,size: 26,),
            title: Text('Meals'),
          ),
          ListTile(
            leading: Icon(Icons.settings,size: 26,),
            title: Text('Filters'),
          )
        ],
      ),
    );
  }
}
