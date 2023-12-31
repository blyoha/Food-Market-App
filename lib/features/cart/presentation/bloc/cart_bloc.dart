import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/entities/dish_entity.dart';
import '../../domain/params/cart_params.dart';
import '../../domain/params/no_params.dart';
import '../../domain/use_cases/add_dish.dart';
import '../../domain/use_cases/get_cart.dart';
import '../../domain/use_cases/remove_dish.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCart getCart;
  final AddDish addDish;
  final RemoveDish removeDish;

  CartBloc({
    required this.getCart,
    required this.addDish,
    required this.removeDish,
  }) : super(CartEmpty()) {
    on<CartAddDish>(_onAddDish);
    on<CartRemoveDish>(_onRemoveDish);
    on<CartLoad>(_onLoad);
  }

  void _onLoad(CartLoad event, Emitter<CartState> emit) {
    emit(CartLoading());
    final cart = getCart(NoParams());
    emit(CartLoaded(cart: cart));
  }

  void _onAddDish(CartAddDish event, Emitter<CartState> emit) {
    emit(CartLoading());
    addDish(CartParams(dish: event.dish));
    emit(CartLoaded(cart: getCart(NoParams())));
  }

  void _onRemoveDish(CartRemoveDish event, Emitter<CartState> emit) {
    emit(CartLoading());
    removeDish(CartParams(dish: event.dish));
    if (getCart(NoParams()).isEmpty) {
      emit(CartEmpty());
    } else {
      emit(CartLoaded(cart: getCart(NoParams())));
    }
  }
}
