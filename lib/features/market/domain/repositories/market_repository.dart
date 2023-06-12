import '../../../../core/entities/dish_entity.dart';

abstract class MarketRepository {
  Future<List<DishEntity>> getAllDishes();
}
