import 'dart:convert';

import 'package:http/http.dart';
import 'package:personal_website/core/core.dart';

import '../../figma.dart';

abstract class FigmaRemoteDataSource {
  Future getProjectFiles();
}

class FigmaRemoteDataSourceImpl implements FigmaRemoteDataSource {
  final Client client;

  FigmaRemoteDataSourceImpl({required this.client});

  @override
  Future getProjectFiles() async {
    final response = await client.get(
      Uri(
        scheme: httpsScheme,
        host: figmaApiHost,
        path: getProjectFilesUrl,
      ),
      // headers: {"X-FIGMA-TOKEN": const String.fromEnvironment(figmaApiKey)},
    );
    if (response.statusCode == 200) {
      List filesList = json.decode(response.body)['files'];
      List result = filesList.map((e) => FigmaFileModel.fromJson(e)).toList();
      return result;
    } else {
      throw ServerException();
    }
  }
}
