import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:personal_website/core/constants/url_data.dart';
import 'package:personal_website/core/core.dart';

import '../data.dart';

abstract class YoutubeRemoteDataSource {
  Future getProjectFiles();
}

class YoutubeRemoteDataSourceImpl implements YoutubeRemoteDataSource {
  final Client client;

  YoutubeRemoteDataSourceImpl({required this.client});

  @override
  Future getProjectFiles() async {
    final response = await client.get(
      Uri(
        scheme: httpsScheme,
        host: youtubeHost,
        path: getProjectFilesUrl,
      ),
      headers: {"X-FIGMA-TOKEN": sl<DotEnv>().get(youtubeApiKey)},
    );
    if (response.statusCode == 200) {
      List filesList = json.decode(response.body)['files'];
      List result = filesList.map((e) => YoutubeFileModel.fromJson(e)).toList();
      return result;
    } else {
      throw ServerException();
    }
  }
}
