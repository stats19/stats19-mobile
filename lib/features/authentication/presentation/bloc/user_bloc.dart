import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:stat19_app_mobile/features/authentication/domain/usecases/register_user.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_user.dart';

part 'user_event.dart';

part 'user_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String BAD_CREDENTIALS_FAILURE_MESSAGE = 'Bad Credential Failure';

class UserBloc extends Bloc<UserEvent, UserState> {
  final LoginUser loginUser;
  final RegisterUser registerUser;

  UserBloc({@required this.loginUser, @required this.registerUser});

  @override
  UserState get initialState => Empty();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    yield Loading();
    if (event is UserLogin) {
      final failureOrUser = await this
          .loginUser
          .call(Params(username: event.username, password: event.password));
      yield failureOrUser.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (user) => Loaded(user: user));
    } else if (event is RegisterEvent) {
      final failureOrCreatedUser = await registerUser(RegisterParams(
          username: event.username,
          email: event.email,
          password: event.password));

      yield failureOrCreatedUser.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (user) => RegisterLoaded(user));
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
