import 'package:equatable/equatable.dart';

import '../../../../core/use_cases/use_case.dart';
import '../entities/dish_entity.dart';
import '../repositories/dish_repository.dart';

class GetAllDishes implements UseCase<List<DishEntity>, NoParams> {
  final DishRepository repository;

  const GetAllDishes(this.repository);

  @override
  Future<List<DishEntity>> call(NoParams params) async {
    return await repository.getAllDishes();
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
