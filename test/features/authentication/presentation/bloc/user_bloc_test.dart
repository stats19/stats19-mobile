import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:stat19_app_mobile/core/error/failures.dart';
import 'package:stat19_app_mobile/features/authentication/domain/entities/user.dart';
import 'package:stat19_app_mobile/features/authentication/domain/usecases/login_user.dart';
import 'package:stat19_app_mobile/features/authentication/domain/usecases/register_user.dart';
import 'package:stat19_app_mobile/features/authentication/presentation/bloc/user_bloc.dart';

class MockLoginUser extends Mock implements LoginUser {}
class MockRegisterUser extends Mock implements RegisterUser {}

void main() {
  MockLoginUser mockLoginUser;
  MockRegisterUser mockRegisterUser;
  UserBloc bloc;

  setUp(() {
    mockLoginUser = MockLoginUser();
    mockRegisterUser = MockRegisterUser();
    bloc = UserBloc(loginUser: mockLoginUser, registerUser: mockRegisterUser);
  });

  final tUser = User(username: 'user', email: 's@s.fr');
  final String tUsername = 'user';
  final String tPassword = 'user';

  test('should get data from the login use case', () async {
    // arrange
    when(mockLoginUser(any)).thenAnswer((_) async => Right(tUser));
    // act
    bloc.add(UserLogin(tUsername, tPassword));
    await untilCalled(mockLoginUser(any));
    // assert
    verify(mockLoginUser(Params(username: tUsername, password: tPassword)));
  });

  test('should emit [loading, Loaded] with bad credentials', () async {
      // arrange
      when(mockLoginUser(any)).thenAnswer((_) async => Right(tUser));
      // act
      final expected = [
        Empty(),
        Loading(),
        Loaded(user: tUser)
      ];
      expectLater(bloc, emitsInOrder(expected));
      // assert
      bloc.add(UserLogin(tUsername, tPassword));

    });

    test('should emit [loading, Error] with bad credentials', () async {
      // arrange
      when(mockLoginUser(any)).thenAnswer((_) async => Left(BadCredentialsFailure()));
      // act
      final expected = [
        Empty(),
        Loading(),
        Error(message: BAD_CREDENTIALS_FAILURE_MESSAGE)
      ];
      expectLater(bloc, emitsInOrder(expected));
      // assert
      bloc.add(UserLogin(tUsername, tPassword));

    });

    test('should emit [loading, Error] Server error', () async {
      // arrange
      when(mockLoginUser(any)).thenAnswer((_) async => Left(ServerFailure()));
      // act
      final expected = [
        Empty(),
        Loading(),
        Error(message: SERVER_FAILURE_MESSAGE)
      ];
      expectLater(bloc, emitsInOrder(expected));
      // assert
      bloc.add(UserLogin(tUsername, tPassword));

    });
}
