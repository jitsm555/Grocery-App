import 'package:flutter/material.dart';
import 'package:grocery_app/model/category.dart';
class CategoryWidget extends StatelessWidget {
  final Category? category;
  final Function? onTap;

  const CategoryWidget({Key? key, this.category, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!(category!.id);
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              category!.imageUrl,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Positioned(
            bottom: 8.0,
            left: 30,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 36.0, // soften the shadow
                    spreadRadius: 8.0, //extend the shadow
                    offset: Offset(
                      5.0, // Move to right 10  horizontally
                      5.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
              ),
              child: Text(category!.title,
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 20,
                      color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
