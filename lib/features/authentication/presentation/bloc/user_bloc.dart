import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_user.dart';

part 'user_event.dart';
part 'user_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String BAD_CREDENTIALS_FAILURE_MESSAGE = 'Bad Credential Failure';

class UserBloc extends Bloc<UserEvent, UserState> {
  final LoginUser loginUser;

  UserBloc({@required this.loginUser});

  @override
  UserState get initialState => Empty();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UserLogin) {
      yield Loading();
      final failureOrUser = await this.loginUser
          .call(Params(username: event.username, password: event.password));
      yield failureOrUser.fold((failure) => Error(message: _mapFailureToMessage(failure)),
          (user) => Loaded(user: user));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case BadCredentialsFailure:
        return BAD_CREDENTIALS_FAILURE_MESSAGE;
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
