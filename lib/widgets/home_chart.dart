import 'package:expense/widgets/home_chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data_base/base_expense.dart';

class HomeChart extends StatelessWidget {
  final List<ExpenseDate> recentTransaction; //Parametro necessário

  const HomeChart({required this.recentTransaction, super.key});

  List<Map<String, Object>> get groupedExpense {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for(var i = 0; i<recentTransaction.length; i++){
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;
        
        if (sameDay && sameMonth && sameYear){
          totalSum += recentTransaction[i].value;
        }
      }
      

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue{
    return groupedExpense.fold(0.0, (sum, ex) => 
     sum + (ex['value'] as double)
    );
  }

  @override
  Widget build(BuildContext context) {
    groupedExpense;
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedExpense.map((ex) {
            return HomeChartBar(
              label: ex['day'] as String, 
              value: ex['value'] as double, 
              percentage: _weekTotalValue == 0 ? 0 : (ex['value'] as double) / _weekTotalValue,
              );
          }).toList(),
        ),
      ),
    );
  }
}
