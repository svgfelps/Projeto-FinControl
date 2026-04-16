import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/goal_model.dart';
import '../../providers/goal_provider.dart';

class AddGoalScreen extends StatefulWidget {
  const AddGoalScreen({super.key});

  @override
  State<AddGoalScreen> createState() => _AddGoalScreenState();
}

class _AddGoalScreenState extends State<AddGoalScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _targetAmountController = TextEditingController();
  final _currentAmountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _targetAmountController.dispose();
    _currentAmountController.dispose();
    super.dispose();
  }

  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return 'O campo $fieldName é obrigatório.';
    }
    return null;
  }

  String? _validateAmount(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Informe um valor.';
    }

    final parsed = double.tryParse(value.replaceAll(',', '.'));
    if (parsed == null || parsed < 0) {
      return 'Informe um valor numérico válido.';
    }

    return null;
  }

  void _saveGoal() {
    if (_formKey.currentState!.validate()) {
      final goal = GoalModel(
        id: DateTime.now().toString(),
        title: _titleController.text.trim(),
        targetAmount: double.parse(
          _targetAmountController.text.replaceAll(',', '.'),
        ),
        currentAmount: double.parse(
          _currentAmountController.text.replaceAll(',', '.'),
        ),
      );

      Provider.of<GoalProvider>(context, listen: false).addGoal(goal);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Meta cadastrada com sucesso!')),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nova Meta')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Nome da meta'),
                validator: (value) => _validateRequired(value, 'Nome da meta'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _targetAmountController,
                decoration: const InputDecoration(labelText: 'Valor da meta'),
                keyboardType: TextInputType.number,
                validator: _validateAmount,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _currentAmountController,
                decoration: const InputDecoration(labelText: 'Valor atual'),
                keyboardType: TextInputType.number,
                validator: _validateAmount,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveGoal,
                child: const Text('Salvar Meta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
