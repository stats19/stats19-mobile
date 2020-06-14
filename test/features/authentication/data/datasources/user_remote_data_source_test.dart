import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:stat19_app_mobile/features/authentication/data/datasources/user_remote_data_source.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  UserRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = UserRemoteDataSourceImpl(client: mockHttpClient);
  });
}