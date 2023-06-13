import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/market_repository.dart';
import '../data_sources/remote_data_source.dart';
import '../models/dish_model.dart';

class MarketRepositoryImpl implements MarketRepository {
  final RemoteDataSource remoteDataSource;

  const MarketRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<DishModel>> getAllDishes() async {
    try {
      final dishes = await remoteDataSource.getAllDishes();

      return dishes;
    } on ServerException catch (e) {
      return [];
    }
  }
}
