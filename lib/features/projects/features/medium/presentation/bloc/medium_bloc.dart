import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../medium.dart';

part 'medium_event.dart';
part 'medium_state.dart';

class MediumBloc extends Bloc<MediumEvent, MediumState> {
  Medium medium;
  ValueNotifier<num> value;
  final ApplyMediumUsecase applyMediumUsecase;

  MediumBloc({
    required this.medium,
    required this.value,
    required this.applyMediumUsecase,
  }) : super(MediumInitial()) {
    on<ApplyMediumItem>((event, emit) async {
      emit(MediumLoading());
      final failureOrValue = await applyMediumUsecase(
        ApplyMediumParams(value: value.value.toInt()),
      );
      failureOrValue.fold(
        (failure) => emit(MediumInitial()),
        (value) {
          emit(MediumRedirection(event.item));
        },
      );
    });
  }
}
