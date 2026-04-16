import 'package:flutter/material.dart';

import '../models/transaction_model.dart';

class TransactionProvider extends ChangeNotifier {
  final List<TransactionModel> _transactions = [];

  List<TransactionModel> get transactions => List.unmodifiable(_transactions);

  List<TransactionModel> get incomes =>
      _transactions.where((t) => t.type == 'income').toList();

  List<TransactionModel> get expenses =>
      _transactions.where((t) => t.type == 'expense').toList();

  void addTransaction(TransactionModel transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }

  void removeTransaction(String id) {
    _transactions.removeWhere((transaction) => transaction.id == id);
    notifyListeners();
  }

  void updateTransaction(String id, TransactionModel updatedTransaction) {
    final index = _transactions.indexWhere(
      (transaction) => transaction.id == id,
    );
    if (index != -1) {
      _transactions[index] = updatedTransaction;
      notifyListeners();
    }
  }
}
