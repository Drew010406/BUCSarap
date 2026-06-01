// https://medium.com/@edawarekaro/secure-authentication-in-flutter-implementing-refresh-tokens-with-dio-e3ebef1f56ef
import 'package:fresh_dio/fresh_dio.dart';
import 'package:dio/dio.dart';
import 'package:frontend/models/auth_token_pair.dart';

class TokenRefreshInterceptor {
  // This is an interceptor for handling token refresh if unauth 401 response was received
  final TokenStorage<AuthTokenPair> _tokenStorage;

  TokenRefreshInterceptor(this._tokenStorage);

  Fresh<AuthTokenPair> get fresh => Fresh(
    tokenStorage: _tokenStorage,
    tokenHeader: (token) {
      return {
        'Authorization': 'Bearer ${token.accessToken}',
      }; // This gets called for every request to add the token to headers
    },
    shouldRefresh: (response) {
      // Check if nasa login page
      // So that the refreshToken won't be triggered since it's the user's first time logging in
      // final path = response?.requestOptions.path;
      // if(path!.contains('/auth/login')) {
      //   return false;
      // }
      // Determine if we should attempt a token refresh
      return response?.statusCode == 401; // If true then call the refreshToken
    },
    refreshToken: (token, client) async {
      // Gets called if 401 response was received
      try {
        final response = await client.post(
          '/users/refresh_token',
          data: {
            'refresh_token': token!.refreshToken,
            'access_token': token.accessToken,
          },
        );

        final newTokens = response.data;
        return AuthTokenPair(
          accessToken: newTokens['access_token'],
          refreshToken: newTokens['refresh_token'],
        );
      } catch (e) {
        // If refresh fails, throw to trigger logout
        throw RevokeTokenException();
      }
    },
  );
}