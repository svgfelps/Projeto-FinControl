import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reports = [
      {'title': 'Total de Receitas', 'value': 'R\$ 4.500,00'},
      {'title': 'Total de Despesas', 'value': 'R\$ 2.150,00'},
      {'title': 'Saldo Atual', 'value': 'R\$ 2.350,00'},
      {'title': 'Maior Gasto', 'value': 'R\$ 900,00'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Relatórios')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                title: Text(
                  report['title'] as String,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(report['value'] as String),
              ),
            );
          },
        ),
      ),
    );
  }
}
