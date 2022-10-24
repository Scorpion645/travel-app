import 'package:flutter/material.dart';
import 'package:travellingapp/app_data.dart';
import 'package:travellingapp/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 7 / 8,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            maxCrossAxisExtent: 200),
        children: Categories_data.map((categoryData) => CategoryItem(
                categoryData.id, categoryData.title, categoryData.imageUrl))
            .toList(),
      
    );
  }
}
