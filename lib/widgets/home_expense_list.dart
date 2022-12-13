import 'package:flutter/material.dart';
import '../data_base/base_expense.dart';
import 'package:intl/intl.dart';

class HomeExpenseList extends StatelessWidget {
  final List<ExpenseDate> expense;
  final void Function(String) onRemove;

  const HomeExpenseList(this.expense, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 500,
      child: expense.isEmpty 
      ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              'Nenhuma Despesa Cadastrada',
            ),
            const SizedBox(height: 20),//Espaço entre o texto e o container
            SizedBox(
              width: 150,
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover, //Ajustar o tamanho da imagem dentro do container
              ),
            ),
          ],
        ),
      ) : ListView.builder(
        itemCount: expense.length,
        itemBuilder: (ctx, index){
          final ex = expense[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.all(5),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text(
                      'R\$${ex.value}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ),
              ),
              title: Text(
                ex.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(
                DateFormat('d MMM y').format(ex.date),
              ),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => onRemove(ex.id), 
                    icon: const Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    ),
                  IconButton(
                    onPressed: (){}, 
                    icon: const Icon(Icons.edit),
                    color: Colors.grey,
                    ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}