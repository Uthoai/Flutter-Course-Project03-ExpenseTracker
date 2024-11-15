import 'package:flutter/cupertino.dart';
import 'package:flutter_course_project03_expense_tracker/widget/expenses_list/expenses_item.dart';
import '../../model/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expense});

  final List<Expense> expense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expense.length,
        itemBuilder: (context, index) => ExpensesItem(expense[index]));
  }
}
