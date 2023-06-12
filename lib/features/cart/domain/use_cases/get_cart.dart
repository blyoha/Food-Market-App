import '../../../../core/entities/dish_entity.dart';
import '../../../../core/use_cases/use_case.dart';
import '../params/no_params.dart';
import '../repositories/cart_repository.dart';

class GetCart implements UseCase<Map<DishEntity, int>, NoParams> {
  final CartRepository repository;

  const GetCart(this.repository);

  @override
  Map<DishEntity, int> call(NoParams params) {
    return repository.getCart();
  }
}
