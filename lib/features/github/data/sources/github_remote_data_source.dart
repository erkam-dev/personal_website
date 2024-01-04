import 'package:dio/dio.dart';

import '../../../../core/core.dart';

abstract class GithubRemoteDataSource {
  Future getRawRepoFile(String filePath);
}

class GithubRemoteDataSourceImpl implements GithubRemoteDataSource {
  final Dio client;

  GithubRemoteDataSourceImpl({required this.client});

  @override
  Future getRawRepoFile(String filePath) async {
    final response = await client.get(
        Uri(scheme: httpsScheme, host: rawGithubHost, path: filePath)
            .toString());
    if (response.statusCode == 200) {
      // return value should be markdown string
      return response.data;
    } else {
      throw ServerException();
    }
  }
}
