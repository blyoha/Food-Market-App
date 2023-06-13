import '../repositories/market_repository.dart';

class GetTags {
  final MarketRepository repository;

  const GetTags(this.repository);

  Future<List<String>> call() async {
    return await repository.getTags();
  }
}
