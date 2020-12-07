import 'package:as_api/repositories/swap_repository.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final repository = SwapRepository();
  test('trazer uma lista de pessoas da api swap', ()  async {
    final list = await repository.fetchSwap();
    expect(list[0].name, 'Luke Skywalker'); 
  });
}