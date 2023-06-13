import 'package:flutter/material.dart';

class DishTag extends StatefulWidget {
  final String title;
  final bool selected;

  const DishTag({Key? key, required this.title, this.selected = false})
      : super(key: key);

  @override
  State<DishTag> createState() => _DishTagState();
}

class _DishTagState extends State<DishTag> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();

    isSelected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF3364E0) : const Color(0xFFF8F7F5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}
