import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stat19_app_mobile/features/authentication/domain/entities/user.dart';
import 'package:stat19_app_mobile/features/authentication/domain/repositories/user_repository.dart';
import 'package:stat19_app_mobile/features/authentication/domain/usecases/login_user.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  LoginUser usecase;
  MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = LoginUser(mockUserRepository);
  });

  final tUsername = 'user';
  final tPassword = 'user';
  final tUser = User(username: 'user', email: 's@s.fr');

  test('should login the user and return his information', () async {
    // arrange
    when(mockUserRepository.loginUser(any, any))
        .thenAnswer((_) async => Right(tUser));
    // act
    final result = await usecase(Params(username: tUsername, password: tPassword));
    // assert
    expect(result, Right(tUser));
    verify(mockUserRepository.loginUser(tUsername, tPassword));
    verifyNoMoreInteractions(mockUserRepository);
  });
}
