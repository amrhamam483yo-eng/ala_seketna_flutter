class UserModel {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String email;
  final String? avatarUrl;
  final bool isVerified;
  final double driverRating;
  final double packageRating;
  final int totalTrips;
  final List<String> badges;
  final List<String> mutualFriends;
  final String? vehicleModel;
  final String? vehicleColor;
  final String? vehicleYear;
  final DateTime joinedAt;

  UserModel({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    this.avatarUrl,
    this.isVerified = false,
    this.driverRating = 5.0,
    this.packageRating = 5.0,
    this.totalTrips = 0,
    this.badges = const [],
    this.mutualFriends = const [],
    this.vehicleModel,
    this.vehicleColor,
    this.vehicleYear,
    required this.joinedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      avatarUrl: json['avatarUrl'],
      isVerified: json['isVerified'] ?? false,
      driverRating: (json['driverRating'] ?? 5.0).toDouble(),
      packageRating: (json['packageRating'] ?? 5.0).toDouble(),
      totalTrips: json['totalTrips'] ?? 0,
      badges: List<String>.from(json['badges'] ?? []),
      mutualFriends: List<String>.from(json['mutualFriends'] ?? []),
      vehicleModel: json['vehicleModel'],
      vehicleColor: json['vehicleColor'],
      vehicleYear: json['vehicleYear'],
      joinedAt: DateTime.parse(json['joinedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'avatarUrl': avatarUrl,
      'isVerified': isVerified,
      'driverRating': driverRating,
      'packageRating': packageRating,
      'totalTrips': totalTrips,
      'badges': badges,
      'mutualFriends': mutualFriends,
      'vehicleModel': vehicleModel,
      'vehicleColor': vehicleColor,
      'vehicleYear': vehicleYear,
      'joinedAt': joinedAt.toIso8601String(),
    };
  }
}
