import 'package:flutter/material.dart';
import '../data_base/base_expense.dart';
import 'package:intl/intl.dart';

class HomeExpenseList extends StatelessWidget {
  
  

  final List<ExpenseDate> expense;

  const HomeExpenseList(this.expense, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: expense.isEmpty ? Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Text(
            'Nenhuma Transação Cadastrada',
          ),
          const SizedBox(height: 20),
          Container(
            width: 200,
            child: Image.asset(
              'assets\images\waiting.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ) : ListView.builder(
        itemCount: expense.length,
        itemBuilder: (ctx, index){
          final ex = expense[index];
          return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15, 
                          vertical: 10,
                          ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          )
                        ),                      
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'R\$ ${ex.value.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(255, 216, 9, 9),
                          ),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ex.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            ),
                          Text(
                            DateFormat('d MMM y').format(ex.date),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            ),
                        ],
                      ),
                    ],
                  ),
                );
        }
      ),
    );
  }
}