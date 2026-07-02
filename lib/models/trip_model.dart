class TripModel {
  final String id;
  final String routeId;
  final String driverId;
  final String seekerId;
  final String status; // 'pending', 'accepted', 'pickup', 'en_route', 'arrived', 'completed', 'cancelled'
  final DateTime createdAt;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final double price;
  final String? packagePhotoUrl;
  final String? deliveryPhotoUrl;
  final String? recipientName;
  final String? recipientPhone;
  final String? packageDescription;
  final String? packageCategory;
  final double? driverLat;
  final double? driverLng;

  TripModel({
    required this.id,
    required this.routeId,
    required this.driverId,
    required this.seekerId,
    this.status = 'pending',
    required this.createdAt,
    this.startedAt,
    this.completedAt,
    required this.price,
    this.packagePhotoUrl,
    this.deliveryPhotoUrl,
    this.recipientName,
    this.recipientPhone,
    this.packageDescription,
    this.packageCategory,
    this.driverLat,
    this.driverLng,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['id'],
      routeId: json['routeId'],
      driverId: json['driverId'],
      seekerId: json['seekerId'],
      status: json['status'] ?? 'pending',
      createdAt: DateTime.parse(json['createdAt']),
      startedAt: json['startedAt'] != null ? DateTime.parse(json['startedAt']) : null,
      completedAt: json['completedAt'] != null ? DateTime.parse(json['completedAt']) : null,
      price: (json['price'] ?? 0.0).toDouble(),
      packagePhotoUrl: json['packagePhotoUrl'],
      deliveryPhotoUrl: json['deliveryPhotoUrl'],
      recipientName: json['recipientName'],
      recipientPhone: json['recipientPhone'],
      packageDescription: json['packageDescription'],
      packageCategory: json['packageCategory'],
      driverLat: json['driverLat'] != null ? (json['driverLat'] as num).toDouble() : null,
      driverLng: json['driverLng'] != null ? (json['driverLng'] as num).toDouble() : null,
    );
  }
}
