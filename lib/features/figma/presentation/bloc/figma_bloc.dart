import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/features/figma/figma.dart';

part 'figma_event.dart';
part 'figma_state.dart';

class FigmaBloc extends Bloc<FigmaEvent, FigmaState> {
  FigmaFile figma;
  ValueNotifier<num> value;
  final GetProjectFilesUsecase getProjectFilesUsecase;

  FigmaBloc({
    required this.figma,
    required this.value,
    required this.getProjectFilesUsecase,
  }) : super(FigmaInitial()) {
    on<GetProjectFiles>((event, emit) async {
      emit(FigmaLoading());
      final failureOrValue = await getProjectFilesUsecase(
        const GetProjectFilesParams(id: ""),
      );
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
