import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/use_cases/use_case.dart';
import '../features/cart/domain/repositories/cart_repository.dart';
import '../features/cart/domain/use_cases/add_dish.dart';
import '../features/cart/domain/use_cases/get_cart.dart';
import '../features/cart/domain/use_cases/remove_dish.dart';
import '../features/cart/presentation/bloc/cart_bloc.dart';
import '../features/market/data/data_sources/remote_data_source.dart';
import '../features/market/data/repositories/market_repository_impl.dart';
import '../features/market/domain/repositories/market_repository.dart';
import '../features/market/domain/use_cases/get_all_dishes.dart';
import '../features/market/presentation/bloc/market_bloc.dart';

class Locator {
  static final injection = GetIt.instance;

  void init() {
    // Market
    injection.registerFactory<MarketBloc>(
        () => MarketBloc(getAllDishes: injection()));

    injection
        .registerLazySingleton<GetAllDishes>(() => GetAllDishes(injection()));

    injection.registerLazySingleton<MarketRepository>(
        () => MarketRepositoryImpl(remoteDataSource: injection()));

    injection.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSource(injection()));

    injection.registerLazySingleton<Dio>(() => Dio());

    // Cart
    injection.registerFactory<CartBloc>(() => CartBloc(
          getCart: injection(),
          addDish: injection(),
          removeDish: injection(),
        ));

    injection.registerLazySingleton<UseCase>(() => GetCart(injection()));
    injection.registerLazySingleton<UseCase>(() => AddDish(injection()));
    injection.registerLazySingleton<UseCase>(() => RemoveDish(injection()));

    injection.registerLazySingleton<CartRepository>(() => CartRepository());
  }
}
