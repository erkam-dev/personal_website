import '../../../features/features.dart';
import '../injection_container.dart';

void initFigmaFeatures() {
  // Bloc
  sl.registerFactory(() => FigmaBloc(projectFiles: []));

  // models
  sl.registerLazySingleton(
    () => const FigmaFileModel(
      key: "",
      name: "",
      thumbnailUrl: "",
    ),
  );
  // entities
  sl.registerLazySingleton(() => const FigmaFile(
        key: "",
        name: "",
        thumbnailUrl: "",
      ));
}
