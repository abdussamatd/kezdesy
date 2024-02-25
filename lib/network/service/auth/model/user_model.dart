class User {
  User({
    required this.data,
  });

  final Data data;

  factory User.fromJson(Map<String, dynamic> json) => User(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() {
    return {
      "data": data.toJson(),
    };
  }
}

class Data {
  Data({
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.age,
    this.gender,
    this.profilePic,
    this.token,
    this.city,
    this.createdAt,
    this.updatedAt,
    this.interests,
  });

  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;
  final int? age;
  final String? gender;
  final String? profilePic;
  final String? token;
  final String? city;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<String>? interests;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      email: json['email'],
      password: json['password'],
      age: json['age'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      profilePic: json['profilePic'],
      gender: json['gender'],
      token: json['token'],
      city: json['city'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      interests: json['interests'] != null ? List<String>.from(json['interests']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'age': age,
      'firstName': firstName,
      'lastName': lastName,
      'profilePic': profilePic,
      'gender': gender,
      'token': token,
      'city': city,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'interests': interests,
    };
  }
}
