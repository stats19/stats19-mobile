import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stat19_app_mobile/features/authentication/data/datasources/user_local_data_source.dart';
import 'package:stat19_app_mobile/features/authentication/data/datasources/user_remote_data_source.dart';
import 'package:stat19_app_mobile/features/authentication/data/repositories/user_repository_impl.dart';

class MockRemoteDataSource extends Mock implements UserRemoteDataSource {}

class MockLocalDataSource extends Mock implements UserLocalDataSource {}

void main() {
  UserRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = UserRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });
}
