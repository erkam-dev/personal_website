import 'dart:convert';

import 'package:http/http.dart';
import 'package:personal_website/core/constants/url_data.dart';

import '../../../../core/core.dart';

abstract class ExampleRemoteDataSource {
  /// Calls the https://${baseUrl}/${createExamplePost}?vade=$amount&tutar=$maturity endpoint
  ///
  /// Throws a [ServerException] for all error codes

  Future applyExampleItem(int value);
}

class ExampleRemoteDataSourceImpl implements ExampleRemoteDataSource {
  final Client client;

  ExampleRemoteDataSourceImpl({required this.client});

  @override
  Future applyExampleItem(int value) async {
    final body = {"value": value};
    final response = await client.post(
        Uri(
          scheme: httpsScheme,
          // host: baseUrl,
          // path: exampleApplicationUrl,
        ),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      return response;
    }
  }
}
