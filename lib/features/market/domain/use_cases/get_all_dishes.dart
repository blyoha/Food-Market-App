import '../../../../core/entities/dish_entity.dart';
import '../repositories/market_repository.dart';

class GetAllDishes {
  final MarketRepository repository;

  const GetAllDishes(this.repository);

  Future<List<DishEntity>> call() async {
    return await repository.getAllDishes();
  }
}
