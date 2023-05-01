import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/core/core.dart';
import 'package:personal_website/features/figma/figma.dart';

part 'figma_event.dart';
part 'figma_state.dart';

class FigmaBloc extends Bloc<FigmaEvent, FigmaState> {
  List<FigmaFile> projectFiles;
  final GetProjectFilesUsecase getProjectFilesUsecase;

  FigmaBloc({
    required this.projectFiles,
    required this.getProjectFilesUsecase,
  }) : super(FigmaInitial()) {
    on<GetProjectFiles>((event, emit) async {
      emit(FigmaLoading());
      final failureOrValue = await getProjectFilesUsecase(NoParams());
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
