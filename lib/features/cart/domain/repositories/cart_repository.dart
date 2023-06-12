import '../../../../core/entities/dish_entity.dart';

class CartRepository {
  final Map<DishEntity, int> _cart = {};

    Map<DishEntity, int> getCart() => _cart;

  addDish(DishEntity dish) {
    _cart.update(dish, (value) => ++value, ifAbsent: () => 1);
  }

  removeDish(DishEntity dish) {
    _cart.update(dish, (value) => --value);
    if (_cart[dish]! < 1) {
      _cart.remove(dish);
    }
  }
}
