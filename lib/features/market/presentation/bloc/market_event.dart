part of 'market_bloc.dart';

@immutable
abstract class MarketEvent {}

class MarketLoad extends MarketEvent {
  final String? tag;

  MarketLoad({this.tag});
}
