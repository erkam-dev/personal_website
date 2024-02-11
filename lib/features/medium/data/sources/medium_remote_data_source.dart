import 'package:dio/dio.dart';

import '../../../../../../core/core.dart';

abstract class MediumRemoteDataSource {
  /// Calls the https://${baseUrl}/${createMediumPost}?vade=$amount&tutar=$maturity endpoint
  ///
  /// Throws a [ServerException] for all error codes

  Future applyMediumItem(int value);
}

class MediumRemoteDataSourceImpl implements MediumRemoteDataSource {
  final Dio client;

  MediumRemoteDataSourceImpl({required this.client});

  @override
  Future applyMediumItem(int value) async {
    final response = await client.post("");
    if (response.statusCode == 200) {
      return response;
    }
  }
}
