import 'package:dio/dio.dart';
import 'package:personal_website/core/core.dart';
import 'package:personal_website/features/features.dart';

initGithubFeatures() {
  // Bloc
  sl.registerFactory<GithubBloc>(() => GithubBloc(
      github: sl<Github>(),
      getRawRepoFileUsecase: sl<GetRawRepoFileUsecase>()));
  // Entities
  sl.registerLazySingleton<Github>(() => Github(username: "", repos: []));
  sl.registerLazySingleton<GithubRepo>(() => GithubRepo());
  // Models
  sl.registerLazySingleton<GithubModel>(
      () => GithubModel(username: "", repos: []));
  sl.registerLazySingleton<GithubRepoModel>(() => GithubRepoModel());
  // Usecases
  sl.registerLazySingleton<GetRawRepoFileUsecase>(
      () => GetRawRepoFileUsecase(sl<GithubRepository>()));
  // Repositories
  sl.registerLazySingleton<GithubRepository>(() =>
      GithubRepositoryImpl(remoteDataSource: sl<GithubRemoteDataSource>()));
  // Data Sources
  sl.registerLazySingleton<GithubRemoteDataSource>(
      () => GithubRemoteDataSourceImpl(client: sl<Dio>()));
}
