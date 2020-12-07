import 'package:as_api/controllers/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final controller = HomeController();
  test('Deve preencher varável swap', () {
    expect(controller.swap.isNotEmpty, true);
  });
}