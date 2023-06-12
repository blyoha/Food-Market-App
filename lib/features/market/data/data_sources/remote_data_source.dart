import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../core/entities/dish_entity.dart';
import '../models/dish_model.dart';

part 'remote_data_source.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/')
abstract class RemoteDataSource {
  factory RemoteDataSource(Dio dio) = _RemoteDataSource;

  @GET('v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b')
  Future<List<DishEntity>> getAllDishes();
}
