import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/entities/dish_entity.dart';
import '../../domain/use_cases/get_all_dishes.dart';

part 'market_event.dart';

part 'market_state.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  final GetAllDishes getAllDishes;

  MarketBloc({required this.getAllDishes}) : super(MarketLoading()) {
    on<MarketLoad>(_onLoad);
  }

  _onLoad(MarketLoad event, Emitter<MarketState> emit) async {
    emit(MarketLoading());
    final dishes = await getAllDishes();

    if (dishes.isEmpty) {
      emit(MarketError(message: 'Здесь ничего нет'));
    } else {
      emit(MarketLoaded(dishes: dishes));
    }
  }
}
