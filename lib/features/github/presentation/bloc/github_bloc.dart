import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../lib.dart';

part 'github_event.dart';
part 'github_state.dart';

class GithubBloc extends Bloc<GithubEvent, GithubState> {
  Github github;
  String? readmeContent;
  final GetRawRepoFileUsecase getRawRepoFileUsecase;
  GithubBloc({
    required this.github,
    required this.getRawRepoFileUsecase,
  }) : super(GithubInitial()) {
    on<GetRepos>((event, emit) async {
      emit(GithubLoading());
      String data = sl<FirebaseRemoteConfig>().getString(githubDataKey);
      try {
        github = GithubModel.fromJson(jsonDecode(data));
      } on FormatException {
        debugPrint(data);
      }
      emit(GithubInitial());
    });
    on<GetRawReadmeFile>((event, emit) async {
      emit(GithubLoading());
      readmeContent = null;
      final failureOrValue = await getRawRepoFileUsecase(GetRawRepoFileParams(
          filePath:
              "https://cdn.jsdelivr.net/gh/${github.username}/${event.githubRepo.repoName}@${event.githubRepo.branch}/README.md"));
      failureOrValue.fold((l) => emit(GithubInitial()), (r) {
        readmeContent = r;
        emit(GithubInitial());
      });
      emit(GithubInitial());
    });
  }
}
