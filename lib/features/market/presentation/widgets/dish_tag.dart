import 'package:flutter/material.dart';

class DishTag extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isActive;

  const DishTag({
    Key? key,
    required this.title,
    required this.onTap,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF3364E0) : const Color(0xFFF8F7F5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}
