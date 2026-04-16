import 'package:flutter/material.dart';

import '../models/goal_model.dart';

class GoalProvider extends ChangeNotifier {
  final List<GoalModel> _goals = [];

  List<GoalModel> get goals => List.unmodifiable(_goals);

  void addGoal(GoalModel goal) {
    _goals.add(goal);
    notifyListeners();
  }

  void removeGoal(String id) {
    _goals.removeWhere((goal) => goal.id == id);
    notifyListeners();
  }

  void updateGoalProgress(String id, double newAmount) {
    final index = _goals.indexWhere((goal) => goal.id == id);
    if (index != -1) {
      _goals[index].currentAmount = newAmount;
      notifyListeners();
    }
  }
}
