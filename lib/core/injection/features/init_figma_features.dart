import '../../../features/features.dart';
import '../injection_container.dart';

void initFigmaFeatures() {
  // Bloc
  sl.registerFactory(() => FigmaBloc(projectFiles: []));

  // models
  sl.registerLazySingleton(
    () => FigmaFileModel(
      key: "",
      name: "",
      thumbnailUrl: "",
    ),
  );
  // entities
  sl.registerLazySingleton(() => FigmaFile(
        key: "",
        name: "",
        thumbnailUrl: "",
      ));
}
