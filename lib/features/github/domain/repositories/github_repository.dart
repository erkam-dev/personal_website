import 'package:dartz/dartz.dart';
import 'package:personal_website/core/core.dart';

abstract class GithubRepository {
  Future<Either<Failure, String>> getRawRepoFile(String filePath);
}
