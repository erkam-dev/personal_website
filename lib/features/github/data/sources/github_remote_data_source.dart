import 'package:http/http.dart';

import '../../../../core/core.dart';

abstract class GithubRemoteDataSource {
  Future getRawRepoFile(String filePath);
}

class GithubRemoteDataSourceImpl implements GithubRemoteDataSource {
  final Client client;

  GithubRemoteDataSourceImpl({required this.client});

  @override
  Future getRawRepoFile(String filePath) async {
    final response = await client
        .get(Uri(scheme: httpsScheme, host: rawGithubHost, path: filePath));
    if (response.statusCode == 200) {
      // return value should be markdown string
      return response.body;
    } else {
      throw ServerException();
    }
  }
}
