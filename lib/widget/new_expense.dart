import 'package:flutter/material.dart';
import 'package:flutter_course_project03_expense_tracker/model/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? selectedDate;
  Category _selectedCategory = Category.rent;

  void _presentDatePicker() async {
    final dateNow = DateTime.now();
    final firstDate = DateTime(dateNow.year - 1, dateNow.month, dateNow.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: dateNow,
        firstDate: firstDate,
        lastDate: dateNow);

    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          TextField(
            controller: _titleController,
            maxLength: 30,
            maxLines: 1,
            keyboardType: TextInputType.text,
            //default
            cursorColor: Colors.blue,
            decoration: const InputDecoration(
                label: Text("Title", style: TextStyle(color: Colors.blue))),
          ),
          //amount , date picker
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  //default
                  cursorColor: Colors.blue,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text("Amount", style: TextStyle(color: Colors.blue)),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                        selectedDate == null
                            ? "Select Date"
                            : formatter.format(selectedDate!),
                        style: const TextStyle(color: Colors.blue)),
                    IconButton(
                        onPressed: () {
                          _presentDatePicker();
                        },
                        icon: const Icon(
                          Icons.calendar_month,
                          color: Colors.blue,
                        ))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 4.0),
          DropdownButton(
              value: _selectedCategory,
              items: Category.values
                  .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                setState(() {
                  _selectedCategory = value;
                });
              }),
          const SizedBox(height: 8.0),
          //Button Row
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_amountController.text);
                  //Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  elevation: 2, // Shadow elevation
                ),
                child: const Text(
                  "Save Expense",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child:
                    const Text("Cancel", style: TextStyle(color: Colors.blue)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
