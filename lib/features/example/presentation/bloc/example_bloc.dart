import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../example.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  Example example;
  ValueNotifier<num> value;
  final ApplyExampleUsecase applyExampleUsecase;

  ExampleBloc({
    required this.example,
    required this.value,
    required this.applyExampleUsecase,
  }) : super(ExampleInitial()) {
    on<ApplyExampleItem>((event, emit) async {
      emit(ExampleLoading());
      final failureOrValue = await applyExampleUsecase(
        ApplyExampleParams(value: value.value.toInt()),
      );
      failureOrValue.fold(
        (failure) => emit(ExampleInitial()),
        (value) {
          emit(ExampleRedirection(event.item));
        },
      );
    });
  }
}
