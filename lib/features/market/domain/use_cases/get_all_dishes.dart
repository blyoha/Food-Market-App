import '../../../../core/entities/dish_entity.dart';
import '../repositories/dish_repository.dart';

class GetAllDishes {
  final DishRepository repository;

  const GetAllDishes(this.repository);

  Future<List<DishEntity>> call() async {
    return await repository.getAllDishes();
  }
}
