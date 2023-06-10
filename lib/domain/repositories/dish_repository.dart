import '../entities/dish_entity.dart';

abstract class DishRepository {
  Future<List<DishEntity>> getAllDishes();
}
