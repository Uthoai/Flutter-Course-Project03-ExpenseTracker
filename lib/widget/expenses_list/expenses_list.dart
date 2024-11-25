import 'package:flutter/cupertino.dart';
import 'package:flutter_course_project03_expense_tracker/widget/expenses_list/expenses_item.dart';
import '../../model/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expense, required this.onRemoveExpense});

  final List<Expense> expense;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expense.length,
        itemBuilder: (context, index) =>
            Dismissible(
                key: ValueKey(expense[index]),
                onDismissed: (direction){
                  onRemoveExpense(expense[index]);
                },
                child: ExpensesItem(expense[index]))
    );
  }
}
