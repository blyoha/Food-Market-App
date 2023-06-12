part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {}

class CartLoading extends CartState {
  @override
  List<Object?> get props => [];
}

class CartLoaded extends CartState {
  final Map<DishEntity, int> cart;


  CartLoaded({required this.cart});
  @override
  List<Object?> get props => [cart.entries];

  CartLoaded copyWith({
    Map<DishEntity, int>? cart,
  }) {
    return CartLoaded(
      cart: cart ?? this.cart,
    );
  }
}

class CartError extends CartState {
  final String message;

  CartError({required this.message});

  @override
  List<Object?> get props => [message];
}
