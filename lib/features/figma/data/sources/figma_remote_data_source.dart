import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
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
    List filesList = [];
    List result = [];
    String data = await sl<FirebaseRemoteConfig>().getString(figmaDataKey);
    if (data.isNotEmpty) {
      try {
        filesList = json.decode(data)['files'];
        result = filesList.map((e) => FigmaFileModel.fromJson(e)).toList();
      } on FormatException {
        debugPrint(data);
      }
    }
    return result;
  }
}
