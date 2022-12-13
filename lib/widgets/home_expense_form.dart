import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class HomeExpenseForm extends StatefulWidget {
  
  
  final void Function(String, double, DateTime) onSubmit;

  const HomeExpenseForm(this.onSubmit, {super.key});

  @override
  State<HomeExpenseForm> createState() => _HomeExpenseFormState();
}

class _HomeExpenseFormState extends State<HomeExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _selectedDate = DateTime.now();

  _submitForm(){
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if(title.isEmpty || value <=0 || _selectedDate == null){
      return;
    }

    widget.onSubmit(title, value, _selectedDate!);
  }

  _showDatePicker(){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2022), 
      lastDate: DateTime.now(),
      ).then((pickedDate) {
        if (pickedDate == null){
        return;
      }
      setState(() {
        _selectedDate = pickedDate;    
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0)
        )),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            TextField(
              controller: _titleController,
              onSubmitted: (_) => _submitForm(),
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
             controller: _valueController,
             keyboardType: const TextInputType.numberWithOptions(decimal: true),
             onSubmitted: (_) => _submitForm(),
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      // ignore: unnecessary_null_comparison
                      _selectedDate == null
                      ? 'Nenhuma data selecionada!'
                      : 'Data Selecionada: ${DateFormat('dd/MM/y').format(_selectedDate!)}'
                    ),
                  ),
                  TextButton(
                    onPressed: _showDatePicker, 
                    child: const Text(
                      'Selecionar Data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                ],
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