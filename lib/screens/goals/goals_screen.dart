import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/routes/app_routes.dart';
import '../../models/goal_model.dart';
import '../../providers/goal_provider.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  String _formatCurrency(double value) {
    return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  void _confirmDelete(
    BuildContext context,
    GoalProvider provider,
    GoalModel goal,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Excluir meta'),
          content: Text('Deseja realmente excluir a meta "${goal.title}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                provider.removeGoal(goal.id);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Meta excluída com sucesso!')),
                );
              },
              child: const Text('Excluir'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final goalProvider = Provider.of<GoalProvider>(context);
    final goals = goalProvider.goals;

    return Scaffold(
      appBar: AppBar(title: const Text('Metas Financeiras')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addGoal);
        },
        child: const Icon(Icons.add),
      ),
      body: goals.isEmpty
          ? const Center(child: Text('Nenhuma meta cadastrada.'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: goals.length,
              itemBuilder: (context, index) {
                final goal = goals[index];
                final progress = goal.targetAmount > 0
                    ? goal.currentAmount / goal.targetAmount
                    : 0.0;

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(Icons.flag),
                          title: Text(
                            goal.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Atual: ${_formatCurrency(goal.currentAmount)}'
                            '\nMeta: ${_formatCurrency(goal.targetAmount)}',
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () =>
                                _confirmDelete(context, goalProvider, goal),
                          ),
                        ),
                        const SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: progress.clamp(0.0, 1.0),
                          minHeight: 8,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${(progress * 100).clamp(0, 100).toStringAsFixed(1)}% concluído',
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
