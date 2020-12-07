import 'package:as_api/models/films.dart';
import 'package:as_api/repositories/swap_repository.dart';
import 'package:flutter/cupertino.dart';

class FilmsController {
  List<Films> films = [];
  final state = ValueNotifier<FilmsState>(FilmsState.start);

  final repository = SwapRepository();

  Future start() async {
    state.value = FilmsState.loading;
    try {
      films = await repository.fetchFilms();
      state.value = FilmsState.success;
    } catch (e) {
      state.value = FilmsState.error;
    }
  }
}

enum FilmsState { start, loading, success, error }