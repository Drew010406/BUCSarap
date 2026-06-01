// https://medium.com/@edawarekaro/secure-authentication-in-flutter-implementing-refresh-tokens-with-dio-e3ebef1f56ef

class AuthTokenPair {
  final String accessToken; // Access-Token for accessing server resources for an authorized user
  final String refreshToken; // Refresh-Token for updating the access-token

  const AuthTokenPair({required this.accessToken, required this.refreshToken});

  // Create an instance from json to our model
  factory AuthTokenPair.fromJson(Map<String, dynamic> json) {
    return AuthTokenPair(
      accessToken: json['access_token'] as String? ?? "",
      refreshToken: json['refresh_token'] as String? ?? "",
    );
  }

  // Convert an instance to json
  Map<String, dynamic> toJson() {
    return {'access_token': accessToken, 'refresh_token': refreshToken};
  }
}