import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:frontend/models/auth_token_pair.dart';

enum TokenStorageKeys {
  authToken('app_auth_token'); // Enum constant; This calls the enum constructor

  final String keyName;

  const TokenStorageKeys(this.keyName);
}

class TokenStorageImpl implements TokenStorage<AuthTokenPair> {
  final FlutterSecureStorage _secureStorage;

  TokenStorageImpl(this._secureStorage);

  @override
  Future<AuthTokenPair?> read() async {
    // retrieves JSON string from secure storage, parses to AuthTokenPair.
    final tokenJson = await _secureStorage.read(
      key: TokenStorageKeys.authToken.keyName,
    );
    if (tokenJson == null) return null;
    return AuthTokenPair.fromJson(
      jsonDecode(tokenJson) as Map<String, dynamic>,
    );
  }

  @override
  Future<void> delete() async {
    // Deletes tokens when needed (like during logout)
    for (final key in TokenStorageKeys.values) {
      await _secureStorage.delete(key: key.keyName);
    }
  }

  @override
  Future<void> write(AuthTokenPair token) {
    // Writes tokens to secure storage
    return _secureStorage.write(
      key: TokenStorageKeys.authToken.keyName,
      value: jsonEncode(token.toJson()),
    );
  }
}