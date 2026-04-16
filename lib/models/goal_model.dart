class GoalModel {
  final String id;
  final String title;
  final double targetAmount;
  double currentAmount;

  GoalModel({
    required this.id,
    required this.title,
    required this.targetAmount,
    required this.currentAmount,
  });
}
