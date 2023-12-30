import 'dart:convert';

import 'package:http/http.dart';
import 'package:personal_website/core/core.dart';

import '../data.dart';

abstract class YoutubeRemoteDataSource {
  Future getPlaylists();
  Future getPlaylistItems(String playlistId);
}

class YoutubeRemoteDataSourceImpl implements YoutubeRemoteDataSource {
  final Client client;

  YoutubeRemoteDataSourceImpl({required this.client});

  @override
  Future getPlaylists() async {
    final response = await client.get(
      Uri(
          scheme: httpsScheme,
          host: googleHost,
          path: playlistsUrl,
          queryParameters: {
            'part': 'snippet',
            'maxResults': '10',
          }),
    );
    if (response.statusCode == 200) {
      List playlist = json.decode(response.body)['items'];
      List<String> playlistsIdList =
          playlist.map((e) => e['id'].toString()).toList();
      return playlistsIdList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future getPlaylistItems(String playlistId) async {
    final response = await client.get(
      Uri(
          scheme: httpsScheme,
          host: googleHost,
          path: playlistItemsUrl,
          queryParameters: {
            'part': 'snippet',
            'playlistId': playlistId,
            'maxResults': '10',
          }),
    );
    if (response.statusCode == 200) {
      List filesList = json.decode(response.body)['items'];
      List result =
          filesList.map((e) => YoutubeVideoModel.fromJson(e)).toList();
      return result;
    } else {
      throw ServerException();
    }
  }
}
