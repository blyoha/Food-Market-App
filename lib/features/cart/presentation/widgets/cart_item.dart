import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/entities/dish_entity.dart';
import '../../../../core/widgets/dish_image_box.dart';
import 'item_counter.dart';

class CartItem extends StatelessWidget {
  final DishEntity dish;
  final int count;

  const CartItem({
    Key? key,
    required this.dish,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DishImageBox(
          image: dish.imageUrl,
          radius: 8.0,
          height: 64.0,
          width: 64.0,
        ),
        const Gap(8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(dish.name),
            Row(
              children: [
                Text('${dish.price} ₽'),
                Text(
                  ' · ${dish.weight}г',
                  style: TextStyle(color: Colors.black.withOpacity(.4)),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        ItemCounter(dish: dish, count: count),
      ],
    );
  }
}
