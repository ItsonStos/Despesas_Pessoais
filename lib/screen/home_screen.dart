import 'package:flutter/material.dart';
import 'dart:math';
import 'package:expense/widgets/home_expense_list.dart';
import '../data_base/base_expense.dart';
import '../widgets/home_expense_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _expense = [
    ExpenseDate(
      id: 't1',
      title: 'Tênis Olympikus',
      value: 310.76,
      date: DateTime.now(),
    ),
    ExpenseDate(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    ),
    ExpenseDate(
      id: 't3',
      title: 'Conta de Água',
      value: 80.50,
      date: DateTime.now(),
    ),
  ];

  _addExpense(String title, double value) {
    final newExpense = ExpenseDate(
      id: Random().nextDouble().toString(),
      //parametro da base atributo nomeado : parametro que recebeu no chamado da função
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _expense.add(newExpense);
    });

    Navigator.of(context).pop();

  }

  _openExpenseFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context, 
      builder: (_){
        return HomeExpenseForm(_addExpense);
      },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
              onPressed: () => _openExpenseFormModal(context),
              icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(
              child: Card(elevation: 10, child: Text('Gráfico')),
            ),
            HomeExpenseList(_expense),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openExpenseFormModal(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
