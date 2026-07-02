class RouteModel {
  final String id;
  final String driverId;
  final String driverName;
  final String? driverAvatar;
  final double driverRating;
  final String startLocation;
  final String endLocation;
  final double startLat;
  final double startLng;
  final double endLat;
  final double endLng;
  final DateTime departureTime;
  final int? availableSeats;
  final String? packageSize; // 'small', 'medium', 'large'
  final double price;
  final String type; // 'ride' or 'package'
  final List<String> preferences;
  final int mutualFriendsCount;
  final bool isActive;

  RouteModel({
    required this.id,
    required this.driverId,
    required this.driverName,
    this.driverAvatar,
    required this.driverRating,
    required this.startLocation,
    required this.endLocation,
    required this.startLat,
    required this.startLng,
    required this.endLat,
    required this.endLng,
    required this.departureTime,
    this.availableSeats,
    this.packageSize,
    required this.price,
    required this.type,
    this.preferences = const [],
    this.mutualFriendsCount = 0,
    this.isActive = true,
  });

  factory RouteModel.fromJson(Map<String, dynamic> json) {
    return RouteModel(
      id: json['id'],
      driverId: json['driverId'],
      driverName: json['driverName'],
      driverAvatar: json['driverAvatar'],
      driverRating: (json['driverRating'] ?? 5.0).toDouble(),
      startLocation: json['startLocation'],
      endLocation: json['endLocation'],
      startLat: (json['startLat'] ?? 0.0).toDouble(),
      startLng: (json['startLng'] ?? 0.0).toDouble(),
      endLat: (json['endLat'] ?? 0.0).toDouble(),
      endLng: (json['endLng'] ?? 0.0).toDouble(),
      departureTime: DateTime.parse(json['departureTime']),
      availableSeats: json['availableSeats'],
      packageSize: json['packageSize'],
      price: (json['price'] ?? 0.0).toDouble(),
      type: json['type'] ?? 'ride',
      preferences: List<String>.from(json['preferences'] ?? []),
      mutualFriendsCount: json['mutualFriendsCount'] ?? 0,
      isActive: json['isActive'] ?? true,
    );
  }
}
