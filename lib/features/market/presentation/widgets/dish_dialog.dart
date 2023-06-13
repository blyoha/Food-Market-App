import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/entities/dish_entity.dart';
import '../../../../core/widgets/dish_image_box.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';

class DishDialog extends StatelessWidget {
  final DishEntity dish;

  const DishDialog({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(context),
            const Gap(8.0),
            Text(
              dish.name,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(8.0),
            Row(
              children: [
                Text('${dish.price} ₽'),
                Text(
                  ' · ${dish.weight}г',
                  style: TextStyle(color: Colors.black.withOpacity(.4)),
                ),
              ],
            ),
            const Gap(8.0),
            Text(
              dish.description,
              style: TextStyle(color: Colors.black.withOpacity(.65)),
            ),
            const Gap(16.0),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      context.read<CartBloc>().add(CartAddDish(dish: dish));
                    },
                    child: const Text(
                      'Добавить в корзину',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Stack(
      children: [
        DishImageBox(image: dish.imageUrl, radius: 10.0, height: 232.0),
        Positioned(
          top: 8.0,
          right: 8.0,
          child: Row(
            children: [
              _buildButton(Icons.favorite_border_outlined, () {}),
              const Gap(8.0),
              _buildButton(Icons.close_outlined, () {
                Navigator.pop(context);
              }),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildButton(IconData icon, VoidCallback onPressed) {
    return Container(
      height: 40.0,
      width: 40.0,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Colors.white,
      ),
      child: IconButton(
        onPressed: onPressed,
        color: Colors.black,
        icon: Icon(icon),
      ),
    );
  }
}
