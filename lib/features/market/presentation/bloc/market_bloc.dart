import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/entities/dish_entity.dart';
import '../../domain/params/dish_params.dart';
import '../../domain/use_cases/get_dishes.dart';
import '../../domain/use_cases/get_tags.dart';

part 'market_event.dart';

part 'market_state.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  late final GetDishes getDishes;
  late final GetTags getTags;

  MarketBloc({
    required this.getDishes,
    required this.getTags,
  }) : super(MarketLoading()) {
    on<MarketLoad>(_onLoad);
  }

  _onLoad(MarketLoad event, Emitter<MarketState> emit) async {
    emit(MarketLoading());
    final tags = await getTags();

    final dishes = await getDishes(DishParams(tag: event.tag ?? tags.first));

    if (dishes.isEmpty) {
      emit(MarketError(message: 'Здесь ничего нет'));
    } else {
      emit(MarketLoaded(dishes: dishes, tags: tags));
    }
  }
}
