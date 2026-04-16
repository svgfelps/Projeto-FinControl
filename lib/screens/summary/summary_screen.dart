import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/summary_provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  String _formatCurrency(double value) {
    return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  @override
  Widget build(BuildContext context) {
    final summaryProvider = Provider.of<SummaryProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Resumo Financeiro')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.arrow_downward, color: Colors.green),
                title: const Text('Total de Receitas'),
                subtitle: Text(
                  _formatCurrency(summaryProvider.totalIncome),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: const Icon(Icons.arrow_upward, color: Colors.red),
                title: const Text('Total de Despesas'),
                subtitle: Text(
                  _formatCurrency(summaryProvider.totalExpense),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: const Icon(Icons.account_balance_wallet),
                title: const Text('Saldo Atual'),
                subtitle: Text(
                  _formatCurrency(summaryProvider.balance),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: summaryProvider.balance >= 0
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Icon(Icons.insights, size: 40),
                    SizedBox(height: 12),
                    Text(
                      'Resumo geral das movimentações financeiras cadastradas no aplicativo.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
