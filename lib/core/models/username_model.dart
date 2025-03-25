class UsernameResponse {
  final int status;
  final String message;
  final UserData? data; // Allow `data` to be null

  UsernameResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UsernameResponse.fromJson(Map<String, dynamic> json) {
    return UsernameResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? UserData.fromJson(json['data'])
          : null, // Handle null `data`
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(), // Include `data` only if it's not null
    };
  }
}

class UserData {
  final String username;

  UserData({
    required this.username,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
    };
  }
}
