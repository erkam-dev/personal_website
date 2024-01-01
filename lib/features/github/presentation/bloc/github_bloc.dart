import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'github_event.dart';
part 'github_state.dart';

class GithubBloc extends Bloc<GithubEvent, GithubState> {
  GithubBloc() : super(GithubInitial()) {
    on<GithubEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
