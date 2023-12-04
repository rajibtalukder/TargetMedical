import 'dart:convert';

class UserModel {
  final List<User>? user;

  UserModel({
    this.user,
  });

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        user: json["user"] == null
            ? []
            : List<User>.from(json["user"]!.map((x) => User.fromMap(x))),
      );

  factory UserModel.profileFromMap(Map<String, dynamic> json) => UserModel(
        user: json["profile"] == null
            ? []
            : List<User>.from(json["profile"]!.map((x) => User.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "user":
            user == null ? [] : List<dynamic>.from(user!.map((x) => x.toMap())),
      };
}

class User {
  final int? userId;
  final String? name;
  final String? mobile;
  final String? email;
  final String? password;
  final String? deviceId;
  final String? currentDeviceId;
  final String? dateOfBirth;
  final String? image;
  final int? paymentCounter;
  final int? loginCounter;
  final int? isPaid;
  final int? enable;

  User({
    this.userId,
    this.name,
    this.mobile,
    this.email,
    this.password,
    this.deviceId,
    this.currentDeviceId,
    this.dateOfBirth,
    this.image,
    this.paymentCounter,
    this.loginCounter,
    this.isPaid,
    this.enable,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  User copyWith({
    int? userId,
    String? name,
    String? mobile,
    String? email,
    String? password,
    String? deviceId,
    String? currentDeviceId,
    String? dateOfBirth,
    String? image,
    int? paymentCounter,
    int? loginCounter,
    int? isPaid,
    int? enable,
  }) =>
      User(
        userId: userId ?? this.userId,
        name: name ?? this.name,
        mobile: mobile ?? this.mobile,
        email: email ?? this.email,
        password: password ?? this.password,
        deviceId: deviceId ?? this.deviceId,
        currentDeviceId: currentDeviceId ?? this.currentDeviceId,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        image: image ?? this.image,
        paymentCounter: paymentCounter ?? this.paymentCounter,
        loginCounter: loginCounter ?? this.loginCounter,
        isPaid: isPaid ?? this.isPaid,
        enable: enable ?? this.enable,
      );

  factory User.fromMap(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        name: json["name"],
        mobile: json["mobile"],
        email: json["email"],
        password: json["password"],
        deviceId: json["device_id"],
        currentDeviceId: json["current_device_id"],
        dateOfBirth: json["date_of_birth"],
        image: json["image"],
        paymentCounter: json["payment_counter"],
        loginCounter: json["login_counter"],
        isPaid: json["is_paid"],
        enable: json["enable"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "mobile": mobile,
        "email": email,
        "password": password,
        "device_id": deviceId,
        "date_of_birth": dateOfBirth,
        "image": image,
      };
}
