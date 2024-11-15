import 'package:flutter/material.dart';
import 'package:flutter_course_project03_expense_tracker/widget/expenses.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Expenses(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}
