import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/entities/dish_entity.dart';
import '../../../../core/widgets/dish_image_box.dart';
import 'dish_dialog.dart';

class DishCard extends StatelessWidget {
  final DishEntity dish;

  const DishCard({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => DishDialog(dish: dish),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DishImageBox(image: dish.imageUrl, radius: 10.0, height: 110.0),
          const Gap(5.0),
          Text(
            dish.name,
            maxLines: 2,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Gap(3.0),
        ],
      ),
    );
  }
}
