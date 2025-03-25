class UserModel {
  String? uuid;
  String? email;
  String? username;
  String? country;
  String? level;
  int? rating;
  String? image;

  UserModel({
    this.uuid,
    this.email,
    this.username,
    this.country,
    this.level,
    this.rating,
    this.image,
  });

  // Factory constructor to create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uuid: json['uuid'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      country: json['country'] as String?,
      level: json['level'] as String?,
      rating: json['rating'] as int?,
      image: json['image'] as String?,
    );
  }

  // Method to convert a UserModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'email': email,
      'username': username,
      'country': country,
      'level': level,
      'rating': rating,
      'image': image,
    };
  }
}
