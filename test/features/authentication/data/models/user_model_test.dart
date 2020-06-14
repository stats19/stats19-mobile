import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:stat19_app_mobile/features/authentication/data/models/user_model.dart';
import 'package:stat19_app_mobile/features/authentication/domain/entities/user.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tUserModel = UserModel(username: 'user', email: 's@s.fr');

  test('should be a subclass of User entity', () async {
    // assert
    expect(tUserModel, isA<User>());
  });

  group('fromJson', () {
    test('should return a valid model', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('user.json'));
      // act
      final result = UserModel.fromJson(jsonMap);
      // assert
      expect(result, tUserModel);
    });
  });

  group('toJson', () {
    test('should return a valid JSON', () async {
      // act
      final result = tUserModel.toJson();
      // assert
      final expectedJsonMap = {
        'username': 'user',
        'email': 's@s.fr'
      };
      expect(result, expectedJsonMap);
    });
  });
}
