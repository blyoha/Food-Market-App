import '../../../../core/entities/dish_entity.dart';
import '../../domain/repositories/dish_repository.dart';
import '../data_sources/remote_data_source.dart';

class DishRepositoryImpl implements DishRepository {
  final RemoteDataSource _remoteDataSource;

  const DishRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<DishEntity>> getAllDishes() async =>
      await _remoteDataSource.getAllDishes();
}
