import 'package:flutter/material.dart';

import '../models/transaction_model.dart';

class SummaryProvider extends ChangeNotifier {
  List<TransactionModel> _transactions = [];

  void update(List<TransactionModel> transactions) {
    _transactions = transactions;
    notifyListeners();
  }

  double get totalIncome {
    return _transactions
        .where((t) => t.type == 'income')
        .fold(0.0, (sum, item) => sum + item.amount);
  }

  double get totalExpense {
    return _transactions
        .where((t) => t.type == 'expense')
        .fold(0.0, (sum, item) => sum + item.amount);
  }

  double get balance => totalIncome - totalExpense;
}
