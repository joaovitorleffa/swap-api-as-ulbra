import 'package:as_api/models/swap.dart';
import 'package:as_api/repositories/swap_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  List<Swap> swap = [];
  final state = ValueNotifier<HomeState>(HomeState.start);

  final repository = SwapRepository();

  Future start() async {
    state.value = HomeState.loading;
    try {
      swap = await repository.fetchSwap();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }