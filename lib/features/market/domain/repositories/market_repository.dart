import '../../../../core/entities/dish_entity.dart';
import '../params/dish_params.dart';

abstract class MarketRepository {
  Future<List<DishEntity>> getDishes(DishParams params);

  Future<List<String>> getTags();
}
