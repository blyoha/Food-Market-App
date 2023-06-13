part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartLoad extends CartEvent {}

class CartAddDish extends CartEvent {
  final DishEntity dish;

  CartAddDish({required this.dish});
}

class CartRemoveDish extends CartEvent {
  final DishEntity dish;

  CartRemoveDish({required this.dish});
}
