import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stat19_app_mobile/features/authentication/data/datasources/user_remote_data_source.dart';

class MockHttpClient extends Mock implements http.Client {}
class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  UserRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;
  SharedPreferences sharedPreferences;

  setUp(() {
    mockHttpClient = MockHttpClient();
    sharedPreferences = MockSharedPreferences();
    dataSource = UserRemoteDataSourceImpl(client: mockHttpClient, sharedPreferences: sharedPreferences);
  });
}