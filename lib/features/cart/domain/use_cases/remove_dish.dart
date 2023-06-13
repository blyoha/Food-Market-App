import '../../../../core/use_cases/use_case.dart';
import '../params/cart_params.dart';
import '../repositories/cart_repository.dart';

class RemoveDish implements UseCase<void, CartParams> {
  final CartRepository repository;

  const RemoveDish(this.repository);

  @override
  void call(CartParams params) {
    repository.removeDish(params.dish);
  }
}
