import 'package:http/http.dart';

import '../../../features/features.dart';
import '../injection_container.dart';

void initFigmaFeatures() {
  // Bloc
  sl.registerFactory(() => FigmaBloc(
        projectFiles: [],
        getProjectFilesUsecase: sl<GetProjectFilesUsecase>(),
      ));

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

  // Use cases
  sl.registerLazySingleton(
      () => GetProjectFilesUsecase(sl<FigmaRepositoryImpl>()));

  // Repository
  sl.registerLazySingleton(
    () =>
        FigmaRepositoryImpl(remoteDataSource: sl<FigmaRemoteDataSourceImpl>()),
  );

  // Data sources
  sl.registerLazySingleton(
    () => FigmaRemoteDataSourceImpl(client: sl<Client>()),
  );
}
