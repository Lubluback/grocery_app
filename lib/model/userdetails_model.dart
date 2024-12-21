import 'dart:convert';

class UserModel {
  String? username;
  String? uid;
  String? phoneNumber;
  String? email;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? pincode;
  String? state;

  UserModel({
    required this.username,
    required this.phoneNumber,
    required this.email,
    required this.addressLine1,
    required this.city,
    required this.pincode,
    required this.state,
    required this.addressLine2,
    required this.uid,
  });

  // Convert a UserModel to a Map (useful for APIs or local storage)
  Map<String, dynamic> toJson() {
    return {
      'name': username,
      'phoneNumber': phoneNumber,
      'email': email,
      'addressLine1': addressLine1,
      'city': city,
      'pincode': pincode,
      'state': state,
      'addressLine2': addressLine2,
      'uid': uid,
    };
  }

  // Create a UserModel from a Map (useful for APIs or local storage)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['name'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      addressLine1: json['address'],
      city: json['city'],
      pincode: json['pincode'],
      state: json['state'],
      addressLine2: json['addressLine2'],
      uid: json['uid'],
    );
  }
  // Convert UserModel to JSON string for SharedPreferences
  String toJsonString() => jsonEncode(toJson());

  // Create UserModel from JSON string
  factory UserModel.fromJsonString(String jsonString) {
    return UserModel.fromJson(jsonDecode(jsonString));
  }
  UserModel copyWith({
    String? username,
    String? phoneNumber,
    String? email,
    String? addressLine1,
    String? city,
    String? pincode,
    String? state,
    String? addressLine2,
    String? uid,
  }) {
    return UserModel(
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      addressLine1: addressLine1 ?? this.addressLine1,
      city: city ?? this.city,
      pincode: pincode ?? this.pincode,
      state: state ?? this.state,
      addressLine2: addressLine2 ?? this.addressLine2,
      uid: uid ?? this.uid,
    );
  }

  @override
  String toString() {
    return '$UserModel(username: $username, phoneNumber: $phoneNumber, email: $email, addressLine1: $addressLine1, city: $city, pincode: $pincode, state: $state, addressLine2: $addressLine2, uid: $uid)';
  }
}
