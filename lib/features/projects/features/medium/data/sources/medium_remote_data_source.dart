import 'dart:convert';

import 'package:http/http.dart';
import 'package:personal_website/core/constants/url_data.dart';

import '../../../../../../core/core.dart';

abstract class MediumRemoteDataSource {
  /// Calls the https://${baseUrl}/${createMediumPost}?vade=$amount&tutar=$maturity endpoint
  ///
  /// Throws a [ServerException] for all error codes

  Future applyMediumItem(int value);
}

class MediumRemoteDataSourceImpl implements MediumRemoteDataSource {
  final Client client;

  MediumRemoteDataSourceImpl({required this.client});

  @override
  Future applyMediumItem(int value) async {
    final body = {"value": value};
    final response = await client.post(
        Uri(
          scheme: httpsScheme,
          // host: baseUrl,
          // path: mediumApplicationUrl,
        ),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      return response;
    }
  }
}
