import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/dish_entity.dart';
import '../bloc/cart_bloc.dart';

class ItemCounter extends StatefulWidget {
  final DishEntity dish;
  final int count;

  const ItemCounter({
    Key? key,
    required this.dish,
    required this.count,
  }) : super(key: key);

  @override
  State<ItemCounter> createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.0,
      width: 100.0,
      decoration: BoxDecoration(
        color: const Color(0xFFEFEEEC),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              context.read<CartBloc>().add(CartRemoveDish(dish: widget.dish));
            },
            child: const Icon(Icons.remove_outlined),
          ),
          Text(
            '${widget.count}',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          InkWell(
            onTap: () {
              context.read<CartBloc>().add(CartAddDish(dish: widget.dish));
            },
            child: const Icon(Icons.add_outlined),
          ),
        ],
      ),
    );
  }
}
