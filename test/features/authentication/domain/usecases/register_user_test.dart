import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stat19_app_mobile/features/authentication/domain/entities/user.dart';
import 'package:stat19_app_mobile/features/authentication/domain/repositories/user_repository.dart';
import 'package:stat19_app_mobile/features/authentication/domain/usecases/register_user.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  RegisterUser usecase;
  MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = RegisterUser(mockUserRepository);
  });

  final tUsername = 'user';
  final tEmail = 's@s.fr';
  final tPassword = 'user';
  final tUser = User(username: 'user', email: 's@s.fr');

  test('should register a user end without failure', () async {
    // arrange
    when(mockUserRepository.registerUser(any, any, any))
        .thenAnswer((_) async => Right(tUser));
    // act
    final result = await usecase(RegisterParams(email: tEmail, username: tUsername, password: tPassword));
    // assert
    expect(result, Right(tUser));
    verify(mockUserRepository.registerUser(tUsername, tEmail, tPassword));
    verifyNoMoreInteractions(mockUserRepository);
  });
}