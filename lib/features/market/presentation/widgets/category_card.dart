import 'package:flutter/material.dart';
import 'package:food_market_app/features/market/presentation/pages/category_page.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String image;
  final Color color;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.image,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategoryPage(title: title)),
        );
      },
      child: Container(
        height: 148.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: [
            Container(
              width: 180.0,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: Image.asset(image, height: 148.0),
            ),
          ],
        ),
      ),
    );
  }
}

class Category {
  final String title;
  final String image;
  final Color color;

  const Category({
    required this.title,
    required this.image,
    required this.color,
  });
}
