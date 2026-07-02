class TransactionModel {
  final String id;
  final String userId;
  final String type; // 'topup', 'payment', 'refund', 'withdrawal', 'escrow'
  final double amount;
  final String description;
  final DateTime createdAt;
  final String status; // 'completed', 'pending', 'failed'
  final String? paymentMethod;

  TransactionModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.amount,
    required this.description,
    required this.createdAt,
    this.status = 'completed',
    this.paymentMethod,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      userId: json['userId'],
      type: json['type'],
      amount: (json['amount'] ?? 0.0).toDouble(),
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
      status: json['status'] ?? 'completed',
      paymentMethod: json['paymentMethod'],
    );
  }
}
