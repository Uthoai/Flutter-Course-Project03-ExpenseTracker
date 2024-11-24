import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category {rent, food, transport, entertainment, education, shopping, work, income, other}

const categoryIcons = {
  Category.rent: Icons.home,
  Category.food: Icons.lunch_dining,
  Category.transport: Icons.car_crash,
  Category.entertainment: Icons.movie_creation_outlined,
  Category.education: Icons.school,
  Category.shopping: Icons.shopping_cart,
  Category.work: Icons.work_history,
  Category.income: Icons.monetization_on,
  Category.other: Icons.devices_other,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate{
    return formatter.format(date);
  }
}
