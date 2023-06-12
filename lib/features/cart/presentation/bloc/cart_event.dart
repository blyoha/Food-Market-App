part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartLoad extends CartEvent {}

class CartAddDish extends CartEvent {
  final Map<DishEntity, int> cart;
  final DishEntity dish;

  CartAddDish({required this.cart, required this.dish});
}

class CartRemoveDish extends CartEvent {
  final Map<DishEntity, int> cart;
  final DishEntity dish;

  CartRemoveDish({required this.cart, required this.dish});
}
