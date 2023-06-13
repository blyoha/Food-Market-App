import '../../../../core/error/exceptions.dart';
import '../../domain/params/dish_params.dart';
import '../../domain/repositories/market_repository.dart';
import '../data_sources/remote_data_source.dart';
import '../models/dish_model.dart';

class MarketRepositoryImpl implements MarketRepository {
  final RemoteDataSource remoteDataSource;

  const MarketRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<DishModel>> getDishes(DishParams params) async {
    try {
      final dishes = await remoteDataSource.getDishes(tag: params.tag);

      return dishes;
    } on ServerException catch (e) {
      return [];
    }
  }

  @override
  Future<List<String>> getTags() async {
    final dishes = await remoteDataSource.getDishes();

    Set tags = {};
    for (DishModel dish in dishes) {
      tags.addAll(dish.tags);
    }

    return tags.map((e) => e.toString()).toList();
  }
}
