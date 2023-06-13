import '../../../../core/entities/dish_entity.dart';
import '../params/dish_params.dart';
import '../repositories/market_repository.dart';

class GetDishes {
  final MarketRepository repository;

  const GetDishes(this.repository);

  Future<List<DishEntity>> call(DishParams params) async {
    return await repository.getDishes(params);
  }
}
