part of 'market_bloc.dart';

@immutable
abstract class MarketState extends Equatable {}

class MarketLoading extends MarketState {
  @override
  List<Object?> get props => [];
}

class MarketLoaded extends MarketState {
  final List<DishEntity> dishes;

  MarketLoaded({required this.dishes});

  @override
  List<Object?> get props => [dishes];
}

class MarketError extends MarketState {
  final String message;

  MarketError({required this.message});

  @override
  List<Object?> get props => [];
}
