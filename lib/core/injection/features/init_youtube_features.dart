import '../../../features/features.dart';
import '../injection_container.dart';

void initYoutubeFeatures() {
  // Bloc
  sl.registerFactory(() => YoutubeBloc(youtubeVideos: [], playlistIdList: []));

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
}
