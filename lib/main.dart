import 'package:device_preview_plus/device_preview_plus.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'providers/auth_provider.dart';
import 'providers/goal_provider.dart';
import 'providers/summary_provider.dart';
import 'providers/transaction_provider.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true, // só funciona em debug
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => TransactionProvider()),
          ChangeNotifierProvider(create: (_) => GoalProvider()),
          ChangeNotifierProxyProvider<TransactionProvider, SummaryProvider>(
            create: (_) => SummaryProvider(),
            update: (_, transactionProvider, summaryProvider) =>
                summaryProvider!..update(transactionProvider.transactions),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}