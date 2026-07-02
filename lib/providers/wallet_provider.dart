import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

class WalletProvider extends ChangeNotifier {
  double _balance = 1250.00;
  double _escrowAmount = 45.00;
  List<TransactionModel> _transactions = [];
  bool _isLoading = false;

  double get balance => _balance;
  double get escrowAmount => _escrowAmount;
  List<TransactionModel> get transactions => _transactions;
  bool get isLoading => _isLoading;

  WalletProvider() {
    _loadMockTransactions();
  }

  void _loadMockTransactions() {
    _transactions = [
      TransactionModel(
        id: 'tx_001',
        userId: 'user_001',
        type: 'topup',
        amount: 500.0,
        description: 'Top-up via Vodafone Cash',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        paymentMethod: 'Vodafone Cash',
      ),
      TransactionModel(
        id: 'tx_002',
        userId: 'user_001',
        type: 'payment',
        amount: -25.0,
        description: 'Ride payment: Maadi → Tagamoa',
        createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 6)),
      ),
      TransactionModel(
        id: 'tx_003',
        userId: 'user_001',
        type: 'payment',
        amount: -20.0,
        description: 'Delivery fee: Nasr City → Heliopolis',
        createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 4)),
      ),
    ];
  }

  Future<void> topUp(double amount, String method) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    _balance += amount;
    _transactions.insert(0, TransactionModel(
      id: 'tx_${DateTime.now().millisecondsSinceEpoch}',
      userId: 'user_001',
      type: 'topup',
      amount: amount,
      description: 'Top-up via $method',
      createdAt: DateTime.now(),
      paymentMethod: method,
    ));

    _isLoading = false;
    notifyListeners();
  }

  Future<void> makePayment(double amount, String description) async {
    if (_balance < amount) {
      throw Exception('Insufficient balance');
    }

    _balance -= amount;
    _escrowAmount += amount;

    _transactions.insert(0, TransactionModel(
      id: 'tx_${DateTime.now().millisecondsSinceEpoch}',
      userId: 'user_001',
      type: 'escrow',
      amount: -amount,
      description: description,
      createdAt: DateTime.now(),
      status: 'pending',
    ));

    notifyListeners();
  }

  Future<void> releaseEscrow(double amount) async {
    _escrowAmount -= amount;
    notifyListeners();
  }
}
