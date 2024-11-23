import 'package:flutter/material.dart';

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

  void _presentDatePicker(){
    final dateNow = DateTime.now();
    final firstDate = DateTime(dateNow.year -1, dateNow.month, dateNow.day);
    showDatePicker(
        context: context,
        initialDate: dateNow,
        firstDate: firstDate,
        lastDate: dateNow
    );
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
        children: [
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
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                        "Selected Date",
                        style: TextStyle(color: Colors.blue)
                    ),
                    IconButton(
                        onPressed: () {
                          _presentDatePicker();
                        },
                        icon: const Icon(
                          Icons.calendar_month,
                          color: Colors.blue,
                        )
                    )
                  ],
                ),
              )
            ],
          ),
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
                  child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.blue)
                  ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
