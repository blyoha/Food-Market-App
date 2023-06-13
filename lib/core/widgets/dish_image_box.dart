import 'package:flutter/material.dart';

class DishImageBox extends StatelessWidget {
  final String image;
  final double radius;
  final double? height;
  final double? width;

  const DishImageBox({
    Key? key,
    required this.image,
    required this.radius,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F7F5),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Image.network(image,fit: BoxFit.scaleDown),
    );
  }
}
