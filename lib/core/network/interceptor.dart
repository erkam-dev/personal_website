import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_interceptor/http_interceptor.dart';

import '../../app/app_config.dart';

String? latest400ErrorMessage;

class CustomInterceptor implements InterceptorContract {
  final context = NavigationService.navigatorKey.currentContext!;
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      data.headers["Content-Type"] = "application/json";
    } catch (e) {
      // print(e);
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    if (data.statusCode == 400) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      latest400ErrorMessage = json.decode(data.body ?? "")['error_message'];
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(latest400ErrorMessage ?? "Hata meydana geldi.")));
      return data;
    } else if (data.statusCode == 500) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Sistemsel hata")));
      return data;
    } else {
      return data;
    }
  }
}
