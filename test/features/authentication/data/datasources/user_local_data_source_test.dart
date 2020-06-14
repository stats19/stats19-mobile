import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stat19_app_mobile/core/error/exeptions.dart';
import 'package:stat19_app_mobile/features/authentication/data/datasources/user_local_data_source.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  UserLocalDataSourceImpl dataSource;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = UserLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group('GetToken', () {
    final tToken = "azertyuiop" ;
    test('should login the token from SharedPreferences when there is one in the cache', () async {
        // arrange
        when(mockSharedPreferences.getString(any))
            .thenReturn("azertyuiop");
        // act
        final result = await dataSource.getToken();
        // assert
        verify(mockSharedPreferences.getString(CACHED_AUTH_TOKEN));
        expect(result, equals(tToken));
      });

    test('should throw a NoAuthException when there is not a cached token', () async {
      // arrange
      when(mockSharedPreferences.getString(any))
          .thenReturn(null);
      // act
      final call = dataSource.getToken;
      // assert
      expect(() => call(), throwsA(TypeMatcher<NotAuthException>()));
    });
  });

  group('cacheAuthToken', () {
    final tToken = 'azertyuiop';
    test('should call SharedPreferences to cache the data', () async {
        // act
        dataSource.saveToken(tToken);
        // assert
        final expected = 'azertyuiop';
        verify(mockSharedPreferences.setString(CACHED_AUTH_TOKEN, expected));
      });
  });
}