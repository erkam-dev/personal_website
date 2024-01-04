import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/core/core.dart';

import '../../figma.dart';

part 'figma_event.dart';
part 'figma_state.dart';

class FigmaBloc extends Bloc<FigmaEvent, FigmaState> {
  List<FigmaFile> projectFiles;

  FigmaBloc({required this.projectFiles}) : super(FigmaInitial()) {
    on<GetProjectFiles>((event, emit) async {
      emit(FigmaLoading());
      List filesList = [];
      List<FigmaFile> result = [];
      String data = await sl<FirebaseRemoteConfig>().getString(figmaDataKey);
      if (data.isNotEmpty) {
        try {
          filesList = json.decode(data)['files'];
          result = filesList.map((e) => FigmaFileModel.fromJson(e)).toList();
        } on FormatException {
          debugPrint(data);
        }
      }
      if (result.isNotEmpty) projectFiles = result;
      emit(FigmaInitial());
    });
  }
}
