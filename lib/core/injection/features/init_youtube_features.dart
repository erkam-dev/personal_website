import 'package:http/http.dart';

import '../../../features/features.dart';
import '../injection_container.dart';

void initYoutubeFeatures() {
  // Bloc
  sl.registerFactory(() => YoutubeBloc(
      youtubeVideos: [],
      playlistIdList: [],
      getPlaylistsUsecase: sl<GetPlaylistsUsecase>(),
      getPlaylistItemsUsecase: sl<GetPlaylistItemsUsecase>()));

  // models
  sl.registerLazySingleton(
    () => YoutubeVideoModel(
      id: "",
      title: "",
      description: "",
      publishedAt: DateTime.now(),
    ),
  );
  // entities
  sl.registerLazySingleton(() => YoutubeVideo(
        id: "",
        title: "",
        description: "",
        publishedAt: DateTime.now(),
      ));

  // Use cases
  sl.registerLazySingleton(
      () => GetPlaylistsUsecase(sl<YoutubeRepositoryImpl>()));
  sl.registerLazySingleton(
      () => GetPlaylistItemsUsecase(sl<YoutubeRepositoryImpl>()));

  // Repository
  sl.registerLazySingleton(() => YoutubeRepositoryImpl(
      remoteDataSource: sl<YoutubeRemoteDataSourceImpl>()));

  // Data sources
  sl.registerLazySingleton(
      () => YoutubeRemoteDataSourceImpl(client: sl<Client>()));
}
