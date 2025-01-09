import 'package:shared_preferences/shared_preferences.dart';

class AuthData {
  final String? accessToken;
  final String? refreshToken;
  final User? user;

  AuthData({
    this.accessToken,
    this.refreshToken,
    this.user,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      user: json['user'] != null
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'user': user?.toJson(),
    };
  }

  /// Save tokens to SharedPreferences
  Future<void> saveTokensToLocal() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', accessToken ?? '');
    await prefs.setString('refresh_token', refreshToken ?? '');
  }

  /// Load tokens from SharedPreferences
  static Future<AuthData?> loadTokensFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token');

    final refreshToken = prefs.getString('refresh_token');
    if (accessToken != null && refreshToken != null) {
      return AuthData(accessToken: accessToken, refreshToken: refreshToken);
    }
    return null;
  }

  /// Clear tokens from SharedPreferences
  static Future<void> clearTokensFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
  }
}

class User {
  final String? uuid;
  final String? email;
  final String? username;
  final String? country;
  final String? level;
  final int? rating;
  final String? profile;

  User({
    this.uuid,
    this.email,
    this.username,
    this.country,
    this.level,
    this.rating,
    this.profile,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uuid: json['uuid'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      country: json['country'] as String?,
      level: json['level'] as String?,
      rating: json['rating'] as int?,
      profile: json['profile'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'email': email,
      'username': username,
      'country': country,
      'level': level,
      'rating': rating,
      'profile': profile,
    };
  }
}
