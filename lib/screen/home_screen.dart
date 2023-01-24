import 'package:expense/widgets/home_chart.dart';
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
  final List<ExpenseDate> _expense = [];

  //passa as transações recente para o componente
  List<ExpenseDate> get _recentTransactions{
    return _expense.where((ex) {
      return ex.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  } 

  _addExpense(String title, double value, DateTime date) {
    final newExpense = ExpenseDate(
      id: Random().nextDouble().toString(),
      //parametro da base atributo nomeado : parametro que recebeu no chamado da função
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _expense.add(newExpense);
    });

    Navigator.of(context).pop();

  }

  _deleteExpense(String id){
    setState(() {
      _expense.removeWhere((ex) => ex.id == id);
    });
  }

/*  _editExpense(String id){
     if (int insertId == id)
     setState(() {
       _expense.insert(index, element)
     });
   }
*/
  _openExpenseFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context, 
      builder: (_){
        return Container(
          color: Colors.black54,
          child: HomeExpenseForm(_addExpense)
          );
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
            HomeChart(recentTransaction: _recentTransactions),
            HomeExpenseList(_expense, _deleteExpense),
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
