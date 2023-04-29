import 'package:http/http.dart';
import 'package:personal_website/core/constants/url_data.dart';
import 'package:personal_website/core/core.dart';

abstract class FigmaRemoteDataSource {
  Future getCommunityFiles();
}

class FigmaRemoteDataSourceImpl implements FigmaRemoteDataSource {
  final Client client;

  FigmaRemoteDataSourceImpl({required this.client});

  @override
  Future getCommunityFiles() async {
    final response = await client.post(Uri(
      scheme: httpsScheme,
      host: figmaHost,
      // path: FigmaApplicationUrl,
    ));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw ServerException();
    }
  }
}
