import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:personal_website/core/constants/url_data.dart';
import 'package:personal_website/core/core.dart';

abstract class FigmaRemoteDataSource {
  Future getProjectFiles(String id);
}

class FigmaRemoteDataSourceImpl implements FigmaRemoteDataSource {
  final Client client;

  FigmaRemoteDataSourceImpl({required this.client});

  @override
  Future getProjectFiles(String id) async {
    final response = await client.get(
      Uri(
        scheme: httpsScheme,
        host: figmaHost,
        path: getProjectFilesUrl,
      ),
      headers: {"X-FIGMA-TOKEN": sl<DotEnv>().get(figmaApiKey)},
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw ServerException();
    }
  }
}
