import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/core/core.dart';
import 'package:personal_website/features/figma/figma.dart';

part 'figma_event.dart';
part 'figma_state.dart';

class FigmaBloc extends Bloc<FigmaEvent, FigmaState> {
  FigmaFile figma;
  ValueNotifier<num> value;
  final GetCommunityFilesUsecase getCommunityFilesUsecase;

  FigmaBloc({
    required this.figma,
    required this.value,
    required this.getCommunityFilesUsecase,
  }) : super(FigmaInitial()) {
    on<GetCommunityFiles>((event, emit) async {
      emit(FigmaLoading());
      final failureOrValue = await getCommunityFilesUsecase(NoParams());
      failureOrValue.fold(
        (failure) => emit(FigmaInitial()),
        (value) {
          emit(FigmaRedirection());
          emit(FigmaInitial());
        },
      );
    });
  }
}
