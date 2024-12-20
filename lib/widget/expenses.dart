import 'package:flutter/material.dart';
import 'package:flutter_course_project03_expense_tracker/widget/expenses_list/expenses_list.dart';
import 'package:flutter_course_project03_expense_tracker/widget/new_expense.dart';
import '../model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpenses = [
    Expense(
        title: 'Flutter Course',
        amount: 6200.00,
        date: DateTime.now(),
        category: Category.education),
    Expense(
        title: 'Egg 12pis',
        amount: 150.00,
        date: DateTime.now(),
        category: Category.food)
  ];

  void _openAddExpensesOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense),
        isScrollControlled: true
    ); 
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
  }

  void removeExpense(Expense expense){
    setState(() {
      _registerExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Expense Tracker",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500
            ),
          ),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
                onPressed: _openAddExpensesOverlay,
                icon: const Icon(Icons.add, color: Colors.white)
            ),
          ],
        ),
        body: Column(
          children: [
            Text("The Chart"),
            Expanded(child: ExpensesList(expense: _registerExpenses,onRemoveExpense: removeExpense,))
          ],
        ));
  }
}
