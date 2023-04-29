import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../features/features.dart';
import '../injection_container.dart';

void initExampleFeatures() {
  // Bloc
  sl.registerFactory(() => ExampleBloc(
        example: sl<Example>(),
        value: ValueNotifier(0),
        applyExampleUsecase: sl<ApplyExampleUsecase>(),
      ));

  // models
  sl.registerLazySingleton(
    () => ExampleModel(
      value: 0,
      valueList: sl<List<ExampleItemModel>>(),
    ),
  );
  sl.registerLazySingleton(
    () => const ExampleItemModel(value: 0),
  );
  // entities
  sl.registerLazySingleton(() => Example(
        value: 0,
        valueList: sl<List<ExampleItemModel>>(),
      ));
  sl.registerLazySingleton(() => const ExampleItem(value: 0));
  sl.registerLazySingleton(() => [sl<ExampleItem>()]);
  sl.registerLazySingleton(() => [sl<ExampleItemModel>()]);

  // Use cases
  sl.registerLazySingleton(
      () => ApplyExampleUsecase(sl<ExampleRepositoryImpl>()));

  // Repository
  sl.registerLazySingleton(
    () => ExampleRepositoryImpl(
      remoteDataSource: sl<ExampleRemoteDataSourceImpl>(),
    ),
  );

  // Data sources
  sl.registerLazySingleton(
    () => ExampleRemoteDataSourceImpl(
      client: sl<Client>(),
    ),
  );
}
