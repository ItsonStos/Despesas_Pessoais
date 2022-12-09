import 'package:flutter/material.dart';


class HomeExpenseForm extends StatefulWidget {
  
  
  final void Function(String, double) onSubmit;

  HomeExpenseForm(this.onSubmit, {super.key});

  @override
  State<HomeExpenseForm> createState() => _HomeExpenseFormState();
}

class _HomeExpenseFormState extends State<HomeExpenseForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm(){
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if(title.isEmpty || value <=0 ){
      return;
    }

    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                TextField(
                  controller: titleController,
                  onSubmitted: (_) => _submitForm(),
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    labelText: 'Título',
                  ),
                ),
                TextField(
                 controller: valueController,
                 keyboardType: TextInputType.number,
                 onSubmitted: (_) => _submitForm(),
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    labelText: 'Valor (R\$)',
                  ),
                ),
                TextButton(
                  onPressed: _submitForm, 
                  // ignore: sort_child_properties_last
                  child: const Text(
                    'Salvar Nova Transação',
                    style: TextStyle(                    
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    ),
                    ),
                  style: TextButton.styleFrom(
                    primary: Colors.red,                  
                  ),
                ),
              ],
            ),
          ),
        );
  }
}