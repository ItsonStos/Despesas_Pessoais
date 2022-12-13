import 'package:flutter/material.dart';

class HomeChartBar extends StatelessWidget {

  final String? label;
  final double? value;
  final double? percentage;

  const HomeChartBar({
    this.label, 
    this.value, 
    this.percentage, 
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 12,
          child: FittedBox(
            child: Text(value!.toStringAsFixed(2))
            ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 10,
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(5),
                ),
                )
              ),
            ],
            ),
        ),
        const SizedBox(height: 5),
        Text(label!),
      ],
    );
  }
}