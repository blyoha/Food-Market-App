import '../../../../core/use_cases/use_case.dart';
import '../params/dish_params.dart';
import '../repositories/cart_repository.dart';

class AddDish implements UseCase<void, CartParams> {
  final CartRepository repository;

  const AddDish(this.repository);

  @override
  void call(CartParams params) {
    repository.addDish(params.dish);
  }
}
